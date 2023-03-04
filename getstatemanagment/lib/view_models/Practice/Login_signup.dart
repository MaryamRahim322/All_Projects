import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getstatemanagment/view_models/Practice/Controllers.dart';

class LoginSignupScreen extends StatefulWidget {
  const LoginSignupScreen({super.key});

  @override
  State<LoginSignupScreen> createState() => _LoginSignupScreenState();
}

class _LoginSignupScreenState extends State<LoginSignupScreen> {
  LoginController controller = Get.put(LoginController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Login and Signup")),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 35.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextFormField(
              controller: controller.emailController,
              decoration: const InputDecoration(
                  hintText: 'Email', prefixIcon: Icon(Icons.email_outlined)),
            ),
            const SizedBox(
              height: 40,
            ),
            TextFormField(
              controller: controller.passwordController,
              decoration: const InputDecoration(
                  hintText: 'Password', prefixIcon: Icon(Icons.password_sharp)),
            ),
            const SizedBox(
              height: 40,
            ),
            Obx(() {
              return InkWell(
                onTap: () {
                  controller.loginApi();
                },
                child: controller.loading.value
                    ? const CircularProgressIndicator()
                    : Container(
                        height: 45,
                        color: Colors.blue,
                        child: const Center(
                          child: Text('Login'),
                        ),
                      ),
              );
            }),
          ],
        ),
      ),
    );
  }
}
