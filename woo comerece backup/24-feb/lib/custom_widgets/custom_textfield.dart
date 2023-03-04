import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class CustomTextField extends StatelessWidget {
  TextEditingController controller;
  double height;
  double width;
  String hintText;
  Color? color;
  bool? isObscure;
  CustomTextField(
      {super.key,
      required this.controller,
      required this.hintText,
      required this.height,
      required this.width,
      this.color,
      this.isObscure});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      decoration:
          BoxDecoration(color: color, borderRadius: BorderRadius.circular(10)),
      child: TextField(
        obscureText: isObscure ?? false,
        controller: controller,
        decoration: InputDecoration(
            contentPadding: EdgeInsets.only(left: 3.0.w, bottom: 1.0.h),
            hintText: hintText,
            border: InputBorder.none,
            hintStyle: const TextStyle(color: Colors.grey)),
      ),
    );
  }
}
