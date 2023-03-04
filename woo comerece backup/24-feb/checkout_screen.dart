import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:woo_commerce_app/custom_widgets/custom_button.dart';
import 'package:woo_commerce_app/utils/constant/app_image_resouces.dart';
import 'package:woo_commerce_app/utils/styles/app_colors.dart';
import 'package:woo_commerce_app/utils/styles/apptextstyles.dart';

class CheckoutScreen extends StatefulWidget {
  const CheckoutScreen({super.key});

  @override
  State<CheckoutScreen> createState() => _CheckoutScreenState();
}

class _CheckoutScreenState extends State<CheckoutScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.appthem,
        title: const Text('Checkout'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(top: 1.8.h, left: 3.0.w, right: 3.0.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Shipped to',
                    style: AppTextStyles.hBold
                        .copyWith(color: AppColors.colorBlack),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'Add/Change Address',
                      style: AppTextStyles.hBold
                          .copyWith(color: AppColors.appthem),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 3.0.h, bottom: 1.0.h),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Center(
                    child: Text(
                      'Please Add/Change Your Address First',
                      style: AppTextStyles.hBold
                          .copyWith(color: AppColors.appthem),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 1.0.h,
            ),
            //!LISTVIEW_BUILDER
            Container(
              height: 45.5.h,
              width: 100.0.w,
              color: const Color.fromARGB(255, 244, 232, 231),
              child: ListView.builder(
                  itemCount: 6,
                  itemBuilder: ((context, index) {
                    return Padding(
                        padding: EdgeInsets.only(bottom: 0.2.h),
                        child: Card(
                          child: Container(
                            width: 100.0.w,
                            height: 14.0.h,
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
                                //!IMAGE
                                Padding(
                                  padding: EdgeInsets.only(
                                      right: 3.0.w,
                                      left: 2.0.w,
                                      top: 0.8.h,
                                      bottom: 0.8.h),
                                  child: SizedBox(
                                      height: 66.0.h,
                                      width: 34.0.w,
                                      child: Image.asset(
                                        AppImageResouces.shoes,
                                        fit: BoxFit.fitWidth,
                                      )),
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
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text(
                                          "\$80",
                                          style: AppTextStyles.hMedium.copyWith(
                                            color: AppColors.appthem,
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ));
                  })),
            ),
            Padding(
              padding: EdgeInsets.only(top: 2.0.h, left: 1.0.h),
              child: Row(
                children: [
                  Text(
                    'Order Notes',
                    style: AppTextStyles.hBold
                        .copyWith(color: AppColors.appthem, fontSize: 20),
                  ),
                ],
              ),
            ),
            Container(child: const TextField()),
            SizedBox(
              height: 2.0.h,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 4.0.w),
              child: Container(
                decoration: BoxDecoration(
                    border: Border.all(color: AppColors.grey),
                    borderRadius: BorderRadius.circular(10)),
                height: 6.5.h,
                child: ListTile(
                  leading: const Icon(
                    Icons.credit_score_sharp,
                    size: 30,
                    color: AppColors.appthem,
                  ),
                  title: Text('Coupon Code',
                      style: AppTextStyles.hBold
                          .copyWith(color: AppColors.colorBlack, fontSize: 20)),
                  trailing: const Icon(
                    Icons.arrow_right,
                    size: 30,
                    color: AppColors.appthem,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 1.0.h,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 4.0.w),
              child: Container(
                decoration: BoxDecoration(
                    border: Border.all(color: AppColors.grey),
                    borderRadius: BorderRadius.circular(10)),
                height: 6.5.h,
                child: ListTile(
                  leading: const Icon(
                    Icons.local_shipping_sharp,
                    size: 30,
                    color: AppColors.appthem,
                  ),
                  title: Text('Coupon Code',
                      style: AppTextStyles.hBold
                          .copyWith(color: AppColors.colorBlack, fontSize: 20)),
                  trailing: const Icon(
                    Icons.arrow_right,
                    size: 30,
                    color: AppColors.appthem,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 1.0.h,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 4.0.w),
              child: Container(
                decoration: BoxDecoration(
                    border: Border.all(color: AppColors.grey),
                    borderRadius: BorderRadius.circular(10)),
                height: 6.5.h,
                child: ListTile(
                  leading: const Icon(
                    Icons.payment_rounded,
                    size: 30,
                    color: AppColors.appthem,
                  ),
                  title: Text('Coupon Code',
                      style: AppTextStyles.hBold
                          .copyWith(color: AppColors.colorBlack, fontSize: 20)),
                  trailing: const Icon(
                    Icons.arrow_right,
                    size: 30,
                    color: AppColors.appthem,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 2.0.h,
            ),
            SizedBox(
              height: 9.0.h,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 2.5.h),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Summary',
                            style: AppTextStyles.hBold.copyWith(
                                color: AppColors.colorBlack, fontSize: 20)),
                        Padding(
                          padding: EdgeInsets.only(top: 0.7.h),
                          child: Text('Total Price (5 items)',
                              style: AppTextStyles.hMedium.copyWith(
                                  color: AppColors.colorBlack, fontSize: 16)),
                        ),
                      ],
                    ),
                    Text('\$ 234',
                        style: AppTextStyles.hMedium.copyWith(
                            color: AppColors.colorBlack,
                            fontSize: 20,
                            fontStyle: FontStyle.normal))
                  ],
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  decoration:
                      BoxDecoration(border: Border.all(color: Colors.black12)),
                  height: 6.5.h,
                  width: 100.0.w,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: 3.0.w),
                        child: Text('Total: \$ 75',
                            style: AppTextStyles.hBold.copyWith(
                              color: AppColors.colorBlack,
                            )),
                      ),
                      Padding(
                        padding: EdgeInsets.only(right: 2.0.w),
                        child: CustomButton(
                          onpressed: () {
                            Get.to(const CheckoutScreen());
                          },
                          text: "Place Order",
                          height: 5.0.h,
                          width: 28.0.w,
                          color: AppColors.appthem,
                        ),
                      )
                    ],
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
