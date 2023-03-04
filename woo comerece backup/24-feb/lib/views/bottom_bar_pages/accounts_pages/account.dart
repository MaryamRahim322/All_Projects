import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:woo_commerce_app/custom_widgets/custom_button.dart';
import 'package:woo_commerce_app/custom_widgets/custom_textfield.dart';
import 'package:woo_commerce_app/utils/styles/app_colors.dart';
import 'package:woo_commerce_app/utils/styles/apptextstyles.dart';
import 'package:woo_commerce_app/views/bottom_bar_pages/accounts_pages/sign_in_otp.dart';

class AccountScreen extends StatelessWidget {
  var usernameController = TextEditingController();
  var passController = TextEditingController();
  AccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsets.only(
              top: 2.0.h,
            ),
            child: Center(
              child: Text(
                "Welcome!",
                style:
                    AppTextStyles.appbar.copyWith(color: AppColors.colorBlack),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              top: 0.3.h,
            ),
            child: Center(
              child: Text(
                "Please Login if you already have an account",
                style: AppTextStyles.appbar
                    .copyWith(color: AppColors.colorBlack, fontSize: 10.sp),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 3.0.w, right: 3.0.w, top: 4.0.h),
            child: CustomTextField(
              controller: usernameController,
              hintText: "Enter Username",
              height: 6.0.h,
              width: 100.0.w,
              color: AppColors.grey,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 3.0.w, right: 3.0.w, top: 2.0.h),
            child: CustomTextField(
              isObscure: true,
              controller: passController,
              hintText: "Enter passward",
              height: 6.0.h,
              width: 100.0.w,
              color: AppColors.grey,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 10.0.w, right: 10.0.w, top: 3.0.h),
            child: CustomButton(
              onpressed: () {},
              text: "Login",
              width: 100.0.w,
              height: 5.0.h,
              color: AppColors.appthem,
            ),
          ),
          // Padding(
          //   padding: EdgeInsets.only(left: 3.0.w, right: 3.0.w, top: 2.0.h),
          //   child: const Divider(
          //     color: AppColors.colorBlack,
          //   ),
          // ),
          Padding(
            padding: EdgeInsets.only(left: 10.0.w, right: 10.0.w, top: 3.0.h),
            child: CustomButton(
              onpressed: () {
                Get.to(() => const SignInWithOtp(),
                    transition: Transition.rightToLeft,
                    duration: const Duration(milliseconds: 500));
              },
              text: "Sign in with otp",
              width: 100.0.w,
              height: 5.0.h,
              color: AppColors.grey,
            ),
          ),
        ],
      ),
    );
  }
}
