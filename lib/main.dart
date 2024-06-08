import 'package:firebase_auth/firebase_auth.dart';
import 'package:flextravel/bindings.dart';
import 'package:flextravel/domain/auth_controller.dart';
import 'package:flextravel/presentation/auth/login/login_page.dart';
import 'package:flextravel/presentation/home/home_screen.dart';
import 'package:flextravel/presentation/onboarding/onboarding_screen.dart';
import 'package:flextravel/routes/pages.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: const FirebaseOptions(
    apiKey: "AIzaSyB1B4iHumq-7S-9GDEikMUDiLFqRUy7byM",
    appId: "1:504477659561:android:c77768a34b176f227bd4b8",
    messagingSenderId: "504477659561",
    projectId: "flextravel-d9364",
    storageBucket: "flextravel-d9364.appspot.com",
  ));

  final SharedPreferences prefs = await SharedPreferences.getInstance();
  Get.put(prefs);
  Get.put(AuthController());

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  User? user;

  Future<void> _getUser() async {
    user = _auth.currentUser;
  }

  MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    _getUser();
    final AuthController authController = Get.put(AuthController());
    return GetMaterialApp(
      initialRoute: AppPages.initial,
      debugShowCheckedModeBanner: false,
      getPages: AppPages.routes,
      initialBinding: AppBindings(),
      builder: EasyLoading.init(),
      home: StreamBuilder<User?>(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, snap) {
            if (snap.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (snap.hasData) {
              if (authController.isSessionExpired()) {
                authController.checkSession();
              }
              return const HomeScreenPage();
            } else {
              return const OnboardingScreen();
            }
          }),
    );
  }
}
