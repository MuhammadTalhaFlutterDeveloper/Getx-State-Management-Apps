import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getxdemo/components/constant.dart';

import 'login_controller.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final LoginController loginController = Get.put(LoginController());
  //
  bool passwordVisible = true;

  @override
  void initState() {
    super.initState();
    passwordVisible = false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const Image(
                image: NetworkImage(
                    "https://images.unsplash.com/photo-1509822929063-6b6cfc9b42f2?q=80&w=1740&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D")),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Form(
                autovalidateMode: AutovalidateMode.onUserInteraction,
                key: _formKey,
                child: Column(
                  children: [
                    SizedBox(height: 30,),
                    TextFormField(
                      controller: loginController.emailController.value,
                      keyboardType: TextInputType.emailAddress,
                      cursorColor: purpleColor,
                      style: const TextStyle(height: 0.85, color: kGreyColor),
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderSide:
                                const BorderSide(color: kGreyColor, width: 1),
                            borderRadius: BorderRadius.circular(10)),
                        prefixIcon: const Icon(
                          Icons.email_outlined,
                          color: kGreyColor,
                        ),
                        hintText: 'Enter Your Email...',
                        labelText: 'Email',
                        labelStyle: const TextStyle(color: kGreyColor),
                        hintStyle: const TextStyle(color: kGreyColor),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: const BorderSide(color: kGreyColor)),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: const BorderSide(color: kGreyColor)),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      controller: loginController.passwordController.value,
                      obscureText: !passwordVisible,
                      keyboardType: TextInputType.text,
                      cursorColor: purpleColor,
                      style: const TextStyle(height: 0.85, color: purpleColor),
                      decoration: InputDecoration(
                        alignLabelWithHint: false,
                        border: OutlineInputBorder(
                            borderSide:
                                const BorderSide(color: purpleColor, width: 1),
                            borderRadius: BorderRadius.circular(10)),
                        prefixIcon: const Icon(
                          Icons.lock_outline,
                          color: purpleColor,
                        ),
                        suffixIcon: IconButton(
                          icon: Icon(passwordVisible
                              ? Icons.visibility
                              : Icons.visibility_off),
                          onPressed: () {
                            setState(
                              () {
                                passwordVisible = !passwordVisible;
                              },
                            );
                          },
                        ),
                        hintText: 'Enter Your Password...',
                        labelText: 'Password',
                        labelStyle: const TextStyle(color: purpleColor),
                        hintStyle: const TextStyle(color: purpleColor),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: const BorderSide(color: kGreyColor)),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: const BorderSide(color: kGreyColor)),
                      ),
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    Obx(
                      () => ElevatedButton(
                        style: const ButtonStyle(
                            padding: MaterialStatePropertyAll(
                                EdgeInsets.symmetric(
                                    horizontal: 40, vertical: 10)),
                            backgroundColor:
                                MaterialStatePropertyAll(purpleColor)),
                        onPressed: () {
                          loginController.loginApi();
                          if (_formKey.currentState!.validate()) {
                            Get.toNamed('/home');
                          }
                        },
                        child: loginController.loading.value
                            ? const CircularProgressIndicator()
                            : const Text(
                                'Login',
                                style: TextStyle(
                                  fontSize: 25,
                                ),
                              ),
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
