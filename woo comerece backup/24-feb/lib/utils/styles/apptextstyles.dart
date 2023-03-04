import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:woo_commerce_app/utils/styles/app_colors.dart';

class AppTextStyles {
  static TextStyle hBold = TextStyle(
      color: AppColors.colorWhite,
      fontSize: 14.sp,
      fontWeight: FontWeight.bold);

  static TextStyle hMedium = TextStyle(
    color: AppColors.colorWhite,
    fontSize: 12.sp,
  );

  static TextStyle appbar = TextStyle(
    color: AppColors.colorWhite,
    fontSize: 16.sp,
    fontWeight: FontWeight.w700,
  );
}
