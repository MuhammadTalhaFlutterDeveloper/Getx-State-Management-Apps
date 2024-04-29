import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class LoginController extends GetxController {
  final emailController = TextEditingController().obs;
  final passwordController = TextEditingController().obs;
  RxBool loading = false.obs;
  void loginApi() async {
    loading.value = true;
    try {
      final apiResponse =
          await http.post(Uri.parse("https://reqres.in/api/login"), body: {
        "email": emailController.value.text,
        "password": passwordController.value.text,
      });
      var jsonData = jsonDecode(apiResponse.body);

      if (apiResponse.statusCode == 200) {
        loading.value = false;
        Get.snackbar('Login Successful', jsonData["Error Occurred"]);
      } else {
        loading.value = false;
        Get.snackbar('Login Failed', jsonData["Error Occurred"]);
      }
    } catch (e) {
      loading.value = false;
      Get.snackbar('Exception', e.toString());
    }
  }
}
