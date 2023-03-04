import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getstatemanagment/view_models/Practice/Controllers.dart';

class ImagePickerScreen extends StatefulWidget {
  const ImagePickerScreen({super.key});

  @override
  State<ImagePickerScreen> createState() => _ImagePickerScreenState();
}

class _ImagePickerScreenState extends State<ImagePickerScreen> {
  ImagePickerController controller = Get.put(ImagePickerController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('ImagePicker')),
      body: Obx(() {
        return Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                  radius: 150,
                  backgroundColor: const Color.fromARGB(255, 199, 227, 166),
                  backgroundImage: controller.imagePath.isNotEmpty
                      ? FileImage(File(controller.imagePath.toString()))
                      : null),
              TextButton(
                  onPressed: () {
                    controller.getImage();
                  },
                  child: const Padding(
                    padding: EdgeInsets.symmetric(vertical: 28.0),
                    child: Text(
                      'Pick Image',
                      style: TextStyle(fontSize: 40, color: Colors.black),
                    ),
                  ))
            ],
          ),
        );
      }),
    );
  }
}
