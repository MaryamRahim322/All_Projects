import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getstatemanagment/res/assets/image_assets.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('email hint'.tr)),
      body: Image(image: AssetImage(ImageAssets.splashScreen)),
      // floatingActionButton: FloatingActionButton(onPressed: () {
      //   // throw InternetException('message');
      //   Utils.toastMassage('Maryam');
      //   Utils.toastMassageCenter('Maryam');
      // }),
    );
  }
}
