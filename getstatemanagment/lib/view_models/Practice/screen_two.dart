import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getstatemanagment/view_models/Practice/example_two.dart';

class Screentwo extends StatefulWidget {
  const Screentwo({super.key});

  @override
  State<Screentwo> createState() => _ScreentwoState();
}

class _ScreentwoState extends State<Screentwo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Screen two')),
      body: Container(
        child: Center(
          child: TextButton(
              onPressed: () {
                Get.to(const ExampleTwo());
                // Get.back();
              },
              child: const Text('Go back')),
        ),
      ),
    );
  }
}
