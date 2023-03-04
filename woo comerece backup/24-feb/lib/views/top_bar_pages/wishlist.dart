import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:woo_commerce_app/custom_widgets/custom_button.dart';
import 'package:woo_commerce_app/utils/styles/app_colors.dart';
import 'package:woo_commerce_app/utils/styles/apptextstyles.dart';

class Wishlist extends StatelessWidget {
  const Wishlist({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Container(
              height: 6.0.h,
              width: 100.0.w,
              color: AppColors.appthem,
              child: Row(
                children: [
                  IconButton(
                      onPressed: () {
                        Get.back();
                      },
                      icon: const Icon(
                        Icons.arrow_back,
                        color: AppColors.colorWhite,
                      )),
                  SizedBox(
                    width: 3.0.w,
                  ),
                  Text(
                    "Wishlist",
                    style: AppTextStyles.appbar,
                  ),
                  const Spacer(),
                  const Badge(
                    label: Text(
                      '3',
                      style: TextStyle(color: AppColors.colorWhite),
                    ),
                    child: Icon(
                      Icons.shopping_cart_rounded,
                      color: AppColors.colorWhite,
                    ),
                  ),
                  SizedBox(
                    width: 6.0.w,
                  )
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 40.0.h),
              child: Column(children: [
                Text(
                  "Oops,please login first to use this feature",
                  style: AppTextStyles.hMedium
                      .copyWith(color: AppColors.colorBlack, fontSize: 14.sp),
                ),
                Padding(
                  padding:
                      EdgeInsets.only(left: 4.0.w, right: 4.0.w, top: 3.0.h),
                  child: CustomButton(
                    onpressed: () {},
                    text: "Login",
                    width: 100.0.w,
                    height: 6.0.h,
                    color: AppColors.appthem,
                  ),
                )
              ]),
            )
          ],
        ),
      ),
    );
  }
}
