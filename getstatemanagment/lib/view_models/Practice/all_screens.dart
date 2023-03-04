import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:getstatemanagment/home_screen.dart';

import 'package:getstatemanagment/view/splash_screen.dart';
import 'package:getstatemanagment/view_models/Lottie_Animations/lottie.dart';
import 'package:getstatemanagment/view_models/Practice/Login_signup.dart';
import 'package:getstatemanagment/view_models/Practice/example_two.dart';
import 'package:getstatemanagment/view_models/Practice/image_picker.dart';
import 'package:getstatemanagment/view_models/Practice/localization.dart';
import 'package:getstatemanagment/view_models/Practice/mark_favrt.dart';
import 'package:getstatemanagment/view_models/Responsive_Design/home_page.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text('Main Screens')),
        backgroundColor: Colors.black,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: ElevatedButton(
                onPressed: () {
                  Get.to(const HomePageScreen());
                },
                style: const ButtonStyle(
                    backgroundColor: MaterialStatePropertyAll(Colors.black)),
                child: const Text('Responsive Design')),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: ElevatedButton(
                onPressed: () {
                  Get.to(const LottieAnimationScreen());
                },
                style: const ButtonStyle(
                    backgroundColor: MaterialStatePropertyAll(Colors.black)),
                child: const Text('Lottie Animation')),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: ElevatedButton(
                onPressed: () {
                  Get.to(const HomeScreenState());
                },
                style: const ButtonStyle(
                    backgroundColor: MaterialStatePropertyAll(Colors.black)),
                child: const Text('GetX Practice')),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: ElevatedButton(
                onPressed: () {
                  Get.to(const SplashScreen());
                },
                style: const ButtonStyle(
                    backgroundColor: MaterialStatePropertyAll(Colors.black)),
                child: const Text('API Methods')),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: ElevatedButton(
                onPressed: () {
                  Get.to(const FavouriteAppScreen());
                },
                style: const ButtonStyle(
                    backgroundColor: MaterialStatePropertyAll(Colors.black)),
                child: const Text('Favourite App')),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: ElevatedButton(
                onPressed: () {
                  Get.to(const ImagePickerScreen());
                },
                style: const ButtonStyle(
                    backgroundColor: MaterialStatePropertyAll(Colors.black)),
                child: const Text('Image Picker')),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: ElevatedButton(
                onPressed: () {
                  Get.to(const LocalizationScreen());
                },
                style: const ButtonStyle(
                    backgroundColor: MaterialStatePropertyAll(Colors.black)),
                child: const Text('Localization')),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: ElevatedButton(
                onPressed: () {
                  Get.to(const LoginSignupScreen());
                },
                style: const ButtonStyle(
                    backgroundColor: MaterialStatePropertyAll(Colors.black)),
                child: const Text('Post Api')),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: ElevatedButton(
                onPressed: () {
                  Get.to(const ExampleTwo());
                },
                style: const ButtonStyle(
                    backgroundColor: MaterialStatePropertyAll(Colors.black)),
                child: const Text('Slider')),
          ),
        ],
      ),
    );
  }
}
