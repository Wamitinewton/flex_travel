import 'package:firebase_auth/firebase_auth.dart';
import 'package:flextravel/data/auth_service.dart';
import 'package:flextravel/providers/user.dart';
import 'package:flextravel/routes/names.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthController extends GetxController {
  final AuthService _authService = AuthService();
  final TextEditingController name = TextEditingController();
  final TextEditingController mail = TextEditingController();
  final TextEditingController pwd = TextEditingController();
  final TextEditingController cfmPwd = TextEditingController();

  RxString userName = ''.obs;
  RxBool isLoading = false.obs;
  Rx<User?> user = Rx<User?>(null);

  static const String lastLoginKey = 'lastLogininTime';
  static const int sessionDurationDays = 7;

  @override
  void onInit() {
    super.onInit();
    user.bindStream(_authService.authStateChanges());
  }

  void setUsername(String value) {
    userName.value = value;
  }

  Future<void> signUp() async {
    if (pwd.text != cfmPwd.text) {
      Get.snackbar('Error', 'Passwords do not match');
      return;
    }

    isLoading.value = true;
    try {
      EasyLoading.show(
        indicator: const CircularProgressIndicator(),
        maskType: EasyLoadingMaskType.clear,
        status: "Authenticating...",
        dismissOnTap: false,
      );
      User? result = await _authService.signUp(name.text, mail.text, pwd.text);

      if (result != null) {
        UserData user = UserData(
          name: name.text,
          email: mail.text,
          id: result.uid,
          password: pwd.text,
        );
        await _authService.saveUserData(user);

        EasyLoading.showSuccess('Authenticated');
        _saveLoginTime();
        Future.delayed(const Duration(seconds: 2), () {
          Get.offAllNamed(AppRoutes.homePage);
          // navigation here
        });
      } else {
        EasyLoading.showError("Sign up failed");
      }
    } on FirebaseAuthException catch (e) {
      EasyLoading.showError(e.message!);
    } catch (e) {
      EasyLoading.showError(e.toString());
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> signIn() async {
    isLoading.value = true;
    try {
      EasyLoading.show(
        indicator: const CircularProgressIndicator(),
        maskType: EasyLoadingMaskType.clear,
        status: "Authenticating...",
        dismissOnTap: false,
      );

      User? result = await _authService.signIn(mail.text, pwd.text);

      if (result != null) {
        user.value = result;

        EasyLoading.showSuccess("Authenticated");
        _saveLoginTime();
        Future.delayed(const Duration(seconds: 2), () {
          Get.offAllNamed(AppRoutes.homePage);
          // navigation here
        });
      } else {
        EasyLoading.showError("Sign in failed");
      }
    } on FirebaseAuthException catch (e) {
      EasyLoading.showError(e.message!);
    } catch (e) {
      EasyLoading.showError(e.toString());
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> signInWithGoogle() async {
    isLoading.value = true;
    try {
      User? result = await _authService.signInWithGoogle();

      if (result != null) {
        _saveLoginTime();
      } else {
        Get.snackbar('Error', 'Google sign in failed');
      }
    } catch (e) {
      Get.snackbar('Error', e.toString());
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> logOut() async {
    try {
      _clearLoginTime();
      await _authService.signOut();

      user.value = null;

      Get.offAllNamed(AppRoutes.login);
    } catch (e) {
      Get.snackbar('Error', e.toString());
    }
  }

  bool isSessionExpired() {
    final SharedPreferences prefs = Get.find<SharedPreferences>();
    final lastLoginTime = prefs.getInt(lastLoginKey) ?? 0;
    final currentTime = DateTime.now().millisecondsSinceEpoch;
    const oneWeekInMilliseconds = sessionDurationDays * 24 * 60 * 60 * 1000;

    return (currentTime - lastLoginTime) > oneWeekInMilliseconds;
  }

  Future<void> _saveLoginTime() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final currentTime = DateTime.now().millisecondsSinceEpoch;
    await prefs.setInt(lastLoginKey, currentTime);
  }

  Future<void> _clearLoginTime() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove(lastLoginKey);
  }

  Future<void> checkSession() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    Get.dialog(
      AlertDialog(
        title: const Text("Session Expired"),
        content: const Text("Your session has expired. Please log in again."),
        actions: [
          TextButton(
            onPressed: () async {
              Get.back();
              await logOut();
            },
            child: const Text("OK"),
          ),
        ],
      ),
      barrierDismissible: false,
    );
  }
}
