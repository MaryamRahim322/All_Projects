import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:woo_commerce_app/utils/styles/app_colors.dart';
import 'package:woo_commerce_app/utils/styles/apptextstyles.dart';

class MyAccountScreen extends StatefulWidget {
  const MyAccountScreen({super.key});

  @override
  State<MyAccountScreen> createState() => _MyAccountScreenState();
}

class _MyAccountScreenState extends State<MyAccountScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Account '),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 10.0.h,
              child: Center(
                child: Row(
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 1.0.h,
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(
                              vertical: 1.0.h, horizontal: 4.0.w),
                          child: Text(
                            'Hello, maryam !',
                            style: AppTextStyles.hBold.copyWith(
                                color: AppColors.appthemDark, fontSize: 20),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(
                              vertical: 0.0.h, horizontal: 4.0.w),
                          child: Text(
                            'Welcom back',
                            style: AppTextStyles.hMedium.copyWith(
                                color: AppColors.colorBlack, fontSize: 18),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
            const Divider(
              thickness: 4,
            ),
            Container(
              height: 20.0.h,
              width: 90.0.w,
              decoration: BoxDecoration(
                  border: Border.all(color: AppColors.appthem, width: 0.3.w),
                  borderRadius: BorderRadius.circular(16)),
              child: const Text(''),
            ),
            Align(
              alignment: Alignment.bottomLeft,
              child: Padding(
                padding: EdgeInsets.only(left: 3.0.w, top: 0.9.h),
                child: Text(
                  'Account',
                  style: AppTextStyles.hBold
                      .copyWith(color: AppColors.appthem, fontSize: 18),
                ),
              ),
            ),
            //!My Account
            SizedBox(
              height: 5.2.h,
              child: ListTile(
                leading: const Icon(
                  Icons.person,
                  color: AppColors.colorBlack,
                  size: 28,
                ),
                title: Text(
                  'My Account',
                  style: AppTextStyles.hMedium
                      .copyWith(color: AppColors.colorBlack, fontSize: 19),
                ),
                trailing: const Icon(
                  Icons.arrow_forward_ios_rounded,
                  color: AppColors.colorBlack,
                  size: 16,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 3.0.w),
              child: const Divider(
                thickness: 2,
              ),
            ),
            Align(
              alignment: Alignment.bottomLeft,
              child: Padding(
                padding: EdgeInsets.only(
                  left: 3.0.w,
                  top: 1.8.h,
                ),
                child: Text(
                  'Transaction',
                  style: AppTextStyles.hBold
                      .copyWith(color: AppColors.appthem, fontSize: 18),
                ),
              ),
            ),
            //!My order
            SizedBox(
              height: 5.2.h,
              child: ListTile(
                leading: const Icon(
                  Icons.shopping_cart_checkout,
                  color: AppColors.colorBlack,
                  size: 28,
                ),
                title: Text(
                  'My Order',
                  style: AppTextStyles.hMedium
                      .copyWith(color: AppColors.colorBlack, fontSize: 19),
                ),
                trailing: const Icon(
                  Icons.arrow_forward_ios_rounded,
                  color: AppColors.colorBlack,
                  size: 16,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 3.0.w),
              child: const Divider(
                thickness: 2,
              ),
            ),

            //!WISHLIST
            SizedBox(
              height: 5.2.h,
              child: ListTile(
                leading: const Icon(
                  Icons.favorite_border_rounded,
                  color: AppColors.colorBlack,
                  size: 28,
                ),
                title: Text(
                  'Wishlist',
                  style: AppTextStyles.hMedium
                      .copyWith(color: AppColors.colorBlack, fontSize: 19),
                ),
                trailing: const Icon(
                  Icons.arrow_forward_ios_rounded,
                  color: AppColors.colorBlack,
                  size: 16,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 3.0.w),
              child: const Divider(
                thickness: 2,
              ),
            ),
            Align(
              alignment: Alignment.bottomLeft,
              child: Padding(
                padding: EdgeInsets.only(
                  left: 3.0.w,
                  top: 1.8.h,
                ),
                child: Text(
                  'General Setting',
                  style: AppTextStyles.hBold
                      .copyWith(color: AppColors.appthem, fontSize: 18),
                ),
              ),
            ),
            //! Dark Theme
            SizedBox(
              height: 5.2.h,
              child: ListTile(
                leading: const Icon(
                  Icons.dark_mode_outlined,
                  color: AppColors.colorBlack,
                  size: 29,
                ),
                title: Text(
                  'Dark',
                  style: AppTextStyles.hMedium
                      .copyWith(color: AppColors.colorBlack, fontSize: 19),
                ),
                trailing: const Icon(
                  Icons.arrow_forward_ios_rounded,
                  color: AppColors.colorBlack,
                  size: 16,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 3.0.w),
              child: const Divider(
                thickness: 2,
              ),
            ),
            //! Rate App
            SizedBox(
              height: 5.2.h,
              child: ListTile(
                leading: const Icon(
                  Icons.star_border_outlined,
                  color: AppColors.colorBlack,
                  size: 29,
                ),
                title: Text(
                  'Rate the App',
                  style: AppTextStyles.hMedium
                      .copyWith(color: AppColors.colorBlack, fontSize: 19),
                ),
                trailing: const Icon(
                  Icons.arrow_forward_ios_rounded,
                  color: AppColors.colorBlack,
                  size: 16,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 3.0.w),
              child: const Divider(
                thickness: 2,
              ),
            ),
            //!About us
            SizedBox(
              height: 5.2.h,
              child: ListTile(
                leading: const Icon(
                  Icons.info_outline_rounded,
                  color: AppColors.colorBlack,
                  size: 28,
                ),
                title: Text(
                  'About Us',
                  style: AppTextStyles.hMedium
                      .copyWith(color: AppColors.colorBlack, fontSize: 19),
                ),
                trailing: const Icon(
                  Icons.arrow_forward_ios_rounded,
                  color: AppColors.colorBlack,
                  size: 16,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 3.0.w),
              child: const Divider(
                thickness: 2,
              ),
            ),
            //!Privacy Policy
            SizedBox(
              height: 5.2.h,
              child: ListTile(
                leading: const Icon(
                  Icons.stars,
                  color: AppColors.colorBlack,
                  size: 27,
                ),
                title: Text(
                  'Privacy Policy',
                  style: AppTextStyles.hMedium
                      .copyWith(color: AppColors.colorBlack, fontSize: 19),
                ),
                trailing: const Icon(
                  Icons.arrow_forward_ios_rounded,
                  color: AppColors.colorBlack,
                  size: 16,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 3.0.w),
              child: const Divider(
                thickness: 2,
              ),
            ),
            //!Terms Condition
            SizedBox(
              height: 5.2.h,
              child: ListTile(
                leading: const Icon(
                  Icons.rule_sharp,
                  color: AppColors.colorBlack,
                  size: 28,
                ),
                title: Text(
                  'Terms and Conditions',
                  style: AppTextStyles.hMedium
                      .copyWith(color: AppColors.colorBlack, fontSize: 19),
                ),
                trailing: const Icon(
                  Icons.arrow_forward_ios_rounded,
                  color: AppColors.colorBlack,
                  size: 16,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 3.0.w),
              child: const Divider(
                thickness: 2,
              ),
            ),
            //!Contact
            SizedBox(
              height: 5.2.h,
              child: ListTile(
                leading: const Icon(
                  Icons.phone_rounded,
                  color: AppColors.colorBlack,
                  size: 28,
                ),
                title: Text(
                  'Contact',
                  style: AppTextStyles.hMedium
                      .copyWith(color: AppColors.colorBlack, fontSize: 19),
                ),
                trailing: const Icon(
                  Icons.arrow_forward_ios_rounded,
                  color: AppColors.colorBlack,
                  size: 16,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 3.0.w),
              child: const Divider(
                thickness: 2,
              ),
            ),
            //!logout
            SizedBox(
              height: 5.2.h,
              child: ListTile(
                leading: const Icon(
                  Icons.logout_outlined,
                  color: AppColors.colorBlack,
                  size: 26,
                ),
                title: Text(
                  'Logout',
                  style: AppTextStyles.hMedium
                      .copyWith(color: AppColors.colorBlack, fontSize: 19),
                ),
                trailing: const Icon(
                  Icons.arrow_forward_ios_rounded,
                  color: AppColors.colorBlack,
                  size: 16,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 3.0.w),
              child: const Divider(
                thickness: 2,
              ),
            ),
          ],
        ),
        // child: Column(
        //   children: [
        //     SizedBox(
        //       height: 10.0.h,
        //       // decoration: const BoxDecoration(
        //       //   // border: Border.all(color: AppColors.grey),
        //       //   shape: BoxShape.rectangle,
        //       //   // boxShadow: [
        //       //   //   BoxShadow(
        //       //   //     blurRadius: 0.10,
        //       //   //     spreadRadius: 0.10,
        //       //   //     color: const Color.fromARGB(255, 246, 244, 244)
        //       //   //         .withOpacity(0.6),
        //       //   //   )
        //       //   // ]
        //       // ),
        //       child: Center(
        //         child: Row(
        //           children: [
        //             Column(
        //               mainAxisAlignment: MainAxisAlignment.start,
        //               crossAxisAlignment: CrossAxisAlignment.start,
        //               children: [
        //                 SizedBox(
        //                   height: 1.0.h,
        //                 ),
        //                 Padding(
        //                   padding: EdgeInsets.symmetric(
        //                       vertical: 1.0.h, horizontal: 4.0.w),
        //                   child: Text(
        //                     'Hello, maryam !',
        //                     style: AppTextStyles.hBold.copyWith(
        //                         color: AppColors.appthemDark, fontSize: 20),
        //                   ),
        //                 ),
        //                 Padding(
        //                   padding: EdgeInsets.symmetric(
        //                       vertical: 0.0.h, horizontal: 4.0.w),
        //                   child: Text(
        //                     'Welcom back',
        //                     style: AppTextStyles.hMedium.copyWith(
        //                         color: AppColors.colorBlack, fontSize: 18),
        //                   ),
        //                 ),
        //               ],
        //             )
        //           ],
        //         ),
        //       ),
        //     ),
        //     const Padding(
        //       padding: EdgeInsets.symmetric(horizontal: 8.0),
        //       child: Divider(
        //         thickness: 2,
        //       ),
        //     ),
        //     Row(
        //       children: [
        //         Padding(
        //           padding: EdgeInsets.only(top: 1.0.h, left: 4.0.w),
        //           child: Text(
        //             'Account',
        //             style: AppTextStyles.hBold
        //                 .copyWith(color: AppColors.appthem, fontSize: 22),
        //           ),
        //         )
        //       ],
        //     ),
        //     Padding(
        //         padding: EdgeInsets.only(top: 0.9.h),
        //         child: SizedBox(
        //           height: 5.5.h,
        //           child: ListTile(
        //             leading: const Icon(
        //               Icons.person,
        //               color: AppColors.colorBlack,
        //               size: 28,
        //             ),
        //             title: Text(
        //               'My Account',
        //               style: AppTextStyles.hMedium
        //                   .copyWith(color: AppColors.colorBlack, fontSize: 19),
        //             ),
        //             trailing: const Icon(
        //               Icons.arrow_forward_ios_rounded,
        //               color: AppColors.colorBlack,
        //               size: 18,
        //             ),
        //           ),
        //         )),
        //     const Padding(
        //       padding: EdgeInsets.symmetric(horizontal: 8.0),
        //       child: Divider(
        //         thickness: 2,
        //       ),
        //     ),
        //     Padding(
        //         padding: EdgeInsets.only(top: 0.0.h),
        //         child: Card(
        //           child: SizedBox(
        //               width: double.infinity,
        //               height: 7.0.h,
        //               // decoration: const BoxDecoration(
        //               //     // border: Border.all(color: AppColors.grey),
        //               //     // borderRadius: BorderRadius.circular(2),
        //               //     color: AppColors.colorWhite,
        //               //     boxShadow: [
        //               //       BoxShadow(
        //               //           blurRadius: 4,
        //               //           spreadRadius: 4,
        //               //           color: Color.fromARGB(255, 237, 235, 235),
        //               //           offset: Offset(0, 1))
        //               //     ]),
        //               child: ListTile(
        //                 leading: const Icon(
        //                   Icons.add_box_outlined,
        //                   color: AppColors.colorBlack,
        //                   size: 28,
        //                 ),
        //                 title: Padding(
        //                   padding: EdgeInsets.only(right: 18.0.w),
        //                   child: Text(
        //                     'My Order',
        //                     style: AppTextStyles.hMedium.copyWith(
        //                         color: AppColors.colorBlack, fontSize: 19),
        //                   ),
        //                 ),
        //                 trailing: const Icon(
        //                   Icons.arrow_forward_ios_rounded,
        //                   color: AppColors.colorBlack,
        //                   size: 18,
        //                 ),
        //               )
        //               // child: Row(
        //               //   children: const [
        //               //     ListTile(
        //               //       leading: Icon(Icons.account_box),
        //               //       title: Text('My Account'),
        //               //     )
        //               //   ],
        //               // ),
        //               ),
        //         )),
        //   ],
        // ),
      ),
    );
  }
}
