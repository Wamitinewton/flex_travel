import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  final TextEditingController name = TextEditingController();
  final TextEditingController mail = TextEditingController();
  final TextEditingController pwd = TextEditingController();
  final TextEditingController cfmPwd = TextEditingController();
}
