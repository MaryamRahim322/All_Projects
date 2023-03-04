import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:woo_commerce_app/custom_widgets/custom_button.dart';
import 'package:woo_commerce_app/custom_widgets/custom_textfield.dart';
import 'package:woo_commerce_app/utils/styles/app_colors.dart';
import 'package:woo_commerce_app/utils/styles/apptextstyles.dart';

class RegisterScreen extends StatelessWidget {
  var fname = TextEditingController();
  var lname = TextEditingController();
  var email = TextEditingController();
  var username = TextEditingController();
  var passwar = TextEditingController();
  var repeatpasswar = TextEditingController();

  RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(left: 3.0.w, right: 3.0.w, top: 6.0.h),
            child: CustomTextField(
              controller: fname,
              hintText: "Enter First Name",
              height: 6.0.h,
              width: 100.0.w,
              color: AppColors.grey,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 3.0.w, right: 3.0.w, top: 3.0.h),
            child: CustomTextField(
              controller: lname,
              hintText: "Enter Last Name",
              height: 6.0.h,
              width: 100.0.w,
              color: AppColors.grey,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 3.0.w, right: 3.0.w, top: 3.0.h),
            child: CustomTextField(
              controller: email,
              hintText: "Enter Username",
              height: 6.0.h,
              width: 100.0.w,
              color: AppColors.grey,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 3.0.w, right: 3.0.w, top: 3.0.h),
            child: CustomTextField(
              controller: passwar,
              hintText: "Enter Passward",
              height: 6.0.h,
              width: 100.0.w,
              color: AppColors.grey,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 3.0.w, right: 3.0.w, top: 3.0.h),
            child: CustomTextField(
              controller: repeatpasswar,
              hintText: "Repeate Passward",
              height: 6.0.h,
              width: 100.0.w,
              color: AppColors.grey,
            ),
          ),
          const Spacer(),
          Padding(
            padding: EdgeInsets.only(left: 3.0.w, right: 3.0.w),
            child: CustomButton(
              onpressed: () {},
              text: "Sign Up",
              color: AppColors.appthem,
              height: 6.0.h,
              width: 100.0.w,
            ),
          ),
          SizedBox(
            height: 2.0.h,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Already have Account? ",
                style: AppTextStyles.appbar.copyWith(
                    color: AppColors.colorBlack,
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w300),
              ),
              InkWell(
                onTap: () {},
                child: Text(
                  "Login",
                  style: AppTextStyles.appbar.copyWith(
                      color: AppColors.colorBlack,
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w800),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 2.0.h,
          ),
        ],
      ),
    );
  }
}
