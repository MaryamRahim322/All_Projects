import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getstatemanagment/view_models/Practice/Controllers.dart';
import 'package:getstatemanagment/view_models/Practice/Login_signup.dart';
import 'package:getstatemanagment/view_models/Practice/image_picker.dart';
import 'package:getstatemanagment/view_models/Practice/mark_favrt.dart';

class ExampleTwo extends StatefulWidget {
  const ExampleTwo({super.key});

  @override
  State<ExampleTwo> createState() => _ExampleTwoState();
}

class _ExampleTwoState extends State<ExampleTwo> {
  ExampleTwoControlller exampleTwoControlller =
      Get.put(ExampleTwoControlller());
  // double opacity = .4;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Example two')),
      body: Column(
        children: [
          const SizedBox(
            height: 60,
          ),
          Obx(
            () => Center(
              child: Container(
                height: 400,
                width: 300,
                color: Colors.pinkAccent
                    .withOpacity(exampleTwoControlller.opacity.value),
              ),
            ),
          ),
          Obx(
            () => Slider(
                value: exampleTwoControlller.opacity.value,
                onChanged: (value) {
                  exampleTwoControlller.opacity(value);
                  // setState(() {});
                }),
          ),
          TextButton(
              onPressed: () {
                Get.to(const FavouriteAppScreen());
              },
              child: const Text('Favourite App')),
          const SizedBox(
            height: 20,
          ),
          TextButton(
              onPressed: () {
                Get.to(const ImagePickerScreen());
              },
              child: const Text('ImagePicker App')),
          const SizedBox(
            height: 20,
          ),
          TextButton(
              onPressed: () {
                Get.to(const LoginSignupScreen());
              },
              child: const Text('Login and Signup App'))
        ],
      ),
    );
  }
}
