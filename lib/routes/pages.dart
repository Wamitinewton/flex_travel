import 'package:flextravel/presentation/auth/login/login_page.dart';
import 'package:flextravel/presentation/auth/register/register_page.dart';
import 'package:flextravel/presentation/onboarding/onboarding_screen.dart';
import 'package:flextravel/routes/names.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppPages {
  static const initial = AppRoutes.initial;
  static final RouteObserver<Route> observer = RouteObserver();
  static List<String> history = [];

  static final List<GetPage> routes = [
    GetPage(name: AppRoutes.initial, page: () => OnboardingScreen()),
    GetPage(
      name: AppRoutes.login,
      page: () => LoginScreen(),
    ),
    GetPage(name: AppRoutes.register, page: () => RegisterScreen())
  ];
}
