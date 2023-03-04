import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:woo_commerce_app/custom_widgets/custom_button.dart';
import 'package:woo_commerce_app/utils/constant/app_image_resouces.dart';
import 'package:woo_commerce_app/utils/styles/app_colors.dart';
import 'package:woo_commerce_app/utils/styles/apptextstyles.dart';
import 'package:woo_commerce_app/views/bottom_bar_pages/cart_pages/checkout_screen.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  late bool isChecked;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text('Cart'),
              Text(
                'Delete Selected',
                style: AppTextStyles.hMedium
                    .copyWith(fontSize: 17, fontWeight: FontWeight.w300),
                // style: TextStyle(fontWeight: FontWeight.w300),
              )
            ],
          ),
          // title: ,
          backgroundColor: AppColors.appthem,
        ),
        body: Column(
          children: [
            //!For ListView
            Expanded(
              child: ListView.builder(
                  itemCount: 3,
                  itemBuilder: (context, index) {
                    return Padding(
                        padding: EdgeInsets.symmetric(vertical: 0.2.h),
                        child: Card(
                          child: Container(
                            width: 100.0.w,
                            height: 18.0.h,
                            decoration: BoxDecoration(
                                border: Border.all(
                                    color: const Color.fromARGB(
                                        31, 183, 178, 178)),
                                borderRadius: BorderRadius.circular(2),
                                color: AppColors.colorWhite,
                                boxShadow: [
                                  BoxShadow(
                                      blurRadius: 0.10,
                                      spreadRadius: 0.10,
                                      color: const Color.fromARGB(
                                              255, 233, 228, 228)
                                          .withOpacity(0.6),
                                      offset: const Offset(0, 1))
                                ]),
                            //!For
                            child: Row(
                              children: [
                                // Padding(
                                //   padding: EdgeInsets.only(
                                //       left: 3.2.w, right: 2.0.w),
                                //   child: RoundCheckBox(
                                //     onTap: (selected) {},
                                //     checkedColor: AppColors.appthem,
                                //     size: 18,

                                //     // uncheckedColor: Colors.yellow,
                                //   ),
                                // ),
                                //!IMAGE
                                Padding(
                                  padding: EdgeInsets.only(
                                      right: 0.8.w,
                                      left: 2.0.w,
                                      top: 0.8.h,
                                      bottom: 0.8.h),
                                  child: SizedBox(
                                      // height: 66.0.h,
                                      width: 40.0.w,
                                      child:
                                          Image.asset(AppImageResouces.shoes)),
                                ),
                                //!TEXT
                                Padding(
                                  padding: EdgeInsets.only(top: 2.0.h),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.only(left: 0.0.w),
                                        child: Text(
                                          'Causal Shoes',
                                          style: AppTextStyles.hMedium.copyWith(
                                              color: AppColors.colorBlack,
                                              fontWeight: FontWeight.w400,
                                              fontSize: 17),
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(top: 1.2.h),
                                        child: Row(children: [
                                          SizedBox(
                                            width: 11.0.w,
                                            height: 4.1.h,
                                            child: ElevatedButton(
                                                onPressed: () {},
                                                // style: ButtonStyle(Material),
                                                style: ElevatedButton.styleFrom(
                                                  backgroundColor:
                                                      AppColors.appthem,
                                                  //onPrimary: Colors.black,
                                                ),
                                                child: FittedBox(
                                                  fit: BoxFit.none,
                                                  child: Text(
                                                    '16%',
                                                    style: AppTextStyles.hMedium
                                                        .copyWith(fontSize: 16),
                                                  ),
                                                )),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Text(
                                              "\$80",
                                              style: AppTextStyles.hMedium
                                                  .copyWith(
                                                color: AppColors.colorBlack,
                                              ),
                                            ),
                                          )
                                        ]),
                                      ),
                                      //!For Edit
                                      Padding(
                                        padding: EdgeInsets.only(top: 2.0.h),
                                        child: Text(
                                          "\$80",
                                          // textAlign: TextAlign.left,
                                          style: AppTextStyles.hMedium.copyWith(
                                              color: AppColors.appthem,
                                              fontWeight: FontWeight.w500),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding:
                                      EdgeInsets.only(left: 4.0.w, top: 11.0.h),
                                  child: Container(
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      children: [
                                        Padding(
                                          padding: EdgeInsets.only(left: 1.0.w),
                                          child: const Icon(
                                            Icons.add_circle,
                                            size: 24,
                                          ),
                                        ),
                                        Padding(
                                          padding: EdgeInsets.only(
                                              left: 1.4.w, bottom: 0.3.h),
                                          child: Text('7',
                                              style: AppTextStyles.hMedium
                                                  .copyWith(
                                                      color: AppColors.appthem,
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      fontSize: 21)),
                                        ),
                                        Padding(
                                          padding: EdgeInsets.only(left: 1.4.w),
                                          child: const Icon(
                                            Icons.remove_circle,
                                            size: 24,
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsets.only(right: 1.2.w),
                                          child: const Icon(
                                            Icons.delete,
                                            size: 24,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ));
                  }),
            ),
            //!For Total
            Row(
              children: [
                Container(
                  decoration:
                      BoxDecoration(border: Border.all(color: Colors.black12)),
                  height: 6.5.h,
                  width: 100.0.w,
                  child: Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: 3.2.w, right: 2.0.w),
                        // child: RoundCheckBox(
                        //   onTap: (selected) {},
                        //   checkedColor: AppColors.appthem,
                        //   size: 22,

                        //   // uncheckedColor: Colors.yellow,
                        // ),
                      ),
                      // Text('Select All',
                      //     style: AppTextStyles.hMedium.copyWith(
                      //         color: AppColors.colorBlack,
                      //         fontWeight: FontWeight.w500,
                      //         fontSize: 18)),
                      SizedBox(
                        width: 29.0.w,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text('Total: \$75',
                            style: AppTextStyles.hBold.copyWith(
                              color: AppColors.colorBlack,
                            )),
                      ),
                      CustomButton(
                        onpressed: () {
                          Get.to(const CheckoutScreen());
                        },
                        text: "Checkout (1)",
                        height: 5.0.h,
                        width: 32.0.w,
                        color: AppColors.appthem,
                      )
                    ],
                  ),
                )
              ],
            )
          ],
        ));
  }
}
