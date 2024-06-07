import 'package:flextravel/common/widgets/input.dart';
import 'package:flextravel/constants.dart';
import 'package:flextravel/controllers/auth_controller.dart';
import 'package:flextravel/routes/names.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final AuthController _authController = Get.find();
  bool _showPassword = true;

  void _toggelPasswordVisibility() {
    setState(() {
      _showPassword = !_showPassword;
    });
  }

  void initState() {
    super.initState();
    _authController.mail.clear();
    _authController.name.clear();
    _authController.cfmPwd.clear();
    _authController.pwd.clear();
  }

  void _unfocusTextField() {
    FocusScope.of(context).unfocus();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: GestureDetector(
        onTap: _unfocusTextField,
        child: Container(
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/images/animeboy2.jpg'),
                  fit: BoxFit.cover)),
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(32),
                    child: Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12)),
                      child: Align(
                        alignment: Alignment.center,
                        child: Padding(
                          padding: const EdgeInsets.all(24),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Hello there',
                                style: kNunitoSansBold16.copyWith(fontSize: 20),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(bottom: 20),
                                child: Text(
                                  'Create an account with us to continue',
                                  style:
                                      kNunitoSansBold18.copyWith(fontSize: 16),
                                ),
                              ),
                              Padding(
                                  padding: const EdgeInsets.only(bottom: 16),
                                  child: TextInputWidget(
                                      controller: _authController.name,
                                      labelText: 'Full names',
                                      obscureText: false)),
                              Padding(
                                  padding: const EdgeInsets.only(bottom: 16),
                                  child: TextInputWidget(
                                      controller: _authController.mail,
                                      labelText: 'Email',
                                      obscureText: false)),
                              Padding(
                                  padding: const EdgeInsets.only(bottom: 16),
                                  child: TextInputWidget(
                                    controller: _authController.pwd,
                                    labelText: 'Password',
                                    obscureText: true,
                                    suffixIcon: GestureDetector(
                                      onTap: _toggelPasswordVisibility,
                                      child: Icon(_showPassword
                                          ? Icons.visibility
                                          : Icons.visibility_off),
                                    ),
                                  )),
                              Padding(
                                  padding: const EdgeInsets.only(bottom: 16),
                                  child: TextInputWidget(
                                    controller: _authController.cfmPwd,
                                    labelText: 'Confirm password',
                                    obscureText: true,
                                    suffixIcon: GestureDetector(
                                      onTap: _toggelPasswordVisibility,
                                      child: Icon(_showPassword
                                          ? Icons.visibility
                                          : Icons.visibility_off),
                                    ),
                                  )),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 16),
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.red[600],
                        padding: const EdgeInsets.symmetric(
                            vertical: 16, horizontal: 24),
                        shape: RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.circular(12), // Radius sudut tombol
                        ),
                        elevation: 3,
                        minimumSize: const Size(370, 44),
                      ),
                      child: const Text(
                        'Register',
                        style: kNunitoSansBold20,
                      ),
                    ),
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Already have an account?',
                        style: kMerriweatherBold16.copyWith(color: kLynxWhite),
                      ),
                      InkWell(
                        child: Text(
                          ' Sign in Here',
                          style:
                              kMerriweatherBold16.copyWith(color: Colors.green),
                        ),
                        onTap: () {
                          Get.offAllNamed(AppRoutes.login);
                        },
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
