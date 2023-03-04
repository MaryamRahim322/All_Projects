import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:woo_commerce_app/custom_widgets/custom_button.dart';
import 'package:woo_commerce_app/utils/constant/app_image_resouces.dart';
import 'package:woo_commerce_app/utils/styles/app_colors.dart';
import 'package:woo_commerce_app/utils/styles/apptextstyles.dart';
import 'package:woo_commerce_app/views/categorise_pages.dart/electronics.dart';
import 'package:woo_commerce_app/views/categorise_pages.dart/fashion_toys.dart';
import 'package:woo_commerce_app/views/categorise_pages.dart/gadget.dart';
import 'package:woo_commerce_app/views/categorise_pages.dart/grocery_screen.dart';
import 'package:woo_commerce_app/views/categorise_pages.dart/stationary.dart';
import 'package:woo_commerce_app/views/top_bar_pages/notifications.dart';
import 'package:woo_commerce_app/views/top_bar_pages/wishlist.dart';

import '../../custom_widgets/custom_textfield.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController _controller = TextEditingController();
  int _selectedIndex = 0;

  List<ProductDet> list = [];
  List<NewProductsList> list2 = [];
  List label = [
    "Cosmetics",
    "Electronics",
    "Fashion & Toys",
    "Gadgets",
    "Jewellery"
  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    list = [
      ProductDet(iconData: AppImageResouces.fashion, name: "Fashion And Toys"),
      ProductDet(iconData: AppImageResouces.electronics, name: "Electronics"),
      ProductDet(iconData: AppImageResouces.stationary, name: "Stationary"),
      ProductDet(iconData: AppImageResouces.grocery, name: "Grocery"),
      ProductDet(iconData: AppImageResouces.gadgets, name: "Gadget"),
      ProductDet(iconData: AppImageResouces.fashion, name: "View More"),
    ];
/////////////////////////
    list2 = [
      NewProductsList(
          imgUrl: AppImageResouces.img8,
          name: "SmartPhones",
          percetage: "18%",
          price: "\$825"),
      NewProductsList(
          imgUrl: AppImageResouces.img9,
          name: "Virtual Reality",
          percetage: "10%",
          price: "\$110"),
      NewProductsList(
          imgUrl: AppImageResouces.img10,
          name: "Laptop New",
          percetage: "25%",
          price: "\$1000"),
      NewProductsList(
          imgUrl: AppImageResouces.img9,
          name: "Steroe Headphone",
          percetage: "30%",
          price: "\$55"),
      NewProductsList(
          imgUrl: AppImageResouces.img11,
          name: "Smar Watches",
          percetage: "10%",
          price: "\$801"),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            height: 13.0.h,
            width: 100.0.w,
            decoration: const BoxDecoration(
                gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                AppColors.appthem,
                AppColors.appthemDark,
              ],
            )),
            child: Padding(
              padding: EdgeInsets.only(left: 3.0.w, right: 3.0.w),
              child: Row(
                children: [
                  Expanded(
                      child: CustomTextField(
                    controller: _controller,
                    hintText: "Search Here",
                    height: 5.0.h,
                    width: 30.0.w,
                    color: AppColors.colorWhite,
                  )),
                  SizedBox(
                    width: 3.0.w,
                  ),
                  IconButton(
                    onPressed: () {
                      Get.to(() => const Wishlist(),
                          transition: Transition.fadeIn,
                          duration: const Duration(milliseconds: 700));
                    },
                    icon: const Icon(
                      Icons.favorite,
                      color: AppColors.colorWhite,
                    ),
                  ),
                  SizedBox(
                    width: 3.0.w,
                  ),
                  IconButton(
                    onPressed: () {
                      Get.to(() => const Notifications(),
                          transition: Transition.fadeIn,
                          duration: const Duration(milliseconds: 700));
                    },
                    icon: const Icon(
                      Icons.notifications,
                      color: AppColors.colorWhite,
                    ),
                  ),
                  SizedBox(
                    width: 3.0.w,
                  ),
                  IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.note_add,
                        color: AppColors.colorWhite,
                      ))
                ],
              ),
            ),
          ),

          ////////////////////////////////////////////
          Flexible(
              child: SizedBox(
            height: 100.0.h,
            width: 100.0.w,
            //   color: Colors.amber,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: const EdgeInsets.all(10),
                    height: 30.0.h,
                    decoration: BoxDecoration(
                        color: AppColors.appthem,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                              blurRadius: 0.5,
                              spreadRadius: 0.5,
                              color: Colors.grey[300]!,
                              offset: const Offset(0, 3))
                        ]),
                    child: Column(
                      children: [
                        Container(
                          margin: const EdgeInsets.all(10),
                          height: 4.0.h,
                          width: 100.0.w,
                          //  color: Colors.white,
                          child: Text(
                            "Let's Explore Something New",
                            style: AppTextStyles.hBold,
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(
                            left: 3.0.w,
                            right: 3.0.w,
                          ),
                          height: 20.0.h,
                          child: CarouselSlider(
                            items: [
                              Image.asset(
                                AppImageResouces.img1,
                                fit: BoxFit.cover,
                              ),
                              Image.asset(AppImageResouces.img2,
                                  fit: BoxFit.cover),
                              Image.asset(AppImageResouces.img3,
                                  fit: BoxFit.cover),
                              Image.asset(AppImageResouces.img4,
                                  fit: BoxFit.cover)
                            ],
                            options: CarouselOptions(
                              height: double.infinity,
                              enlargeCenterPage: true,
                              autoPlay: true,
                              aspectRatio: 4 / 4,
                              autoPlayCurve: Curves.fastOutSlowIn,
                              enableInfiniteScroll: true,
                              autoPlayAnimationDuration:
                                  const Duration(milliseconds: 800),
                              viewportFraction: 0.8,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                  //////////////////////////////
                  Container(
                    margin:
                        EdgeInsets.only(top: 1.0.h, left: 3.0.w, right: 3.0.w),
                    height: 6.0.h,
                    width: 100.0.w,
                    decoration: BoxDecoration(
                        color: Colors.grey[300],
                        borderRadius: BorderRadius.circular(10)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        const Icon(
                          Icons.wallet,
                          color: AppColors.appthem,
                        ),
                        Text(
                          "Wallet",
                          style: AppTextStyles.hMedium
                              .copyWith(color: AppColors.colorBlack),
                        ),
                        SizedBox(
                          width: 2.0.w,
                        ),
                        Text(
                          "\$ 250",
                          style: AppTextStyles.hBold.copyWith(
                              color: AppColors.colorBlack, fontSize: 12.sp),
                        ),
                        CustomButton(
                          onpressed: () {},
                          text: "More Details",
                          height: 4.0.h,
                          width: 35.0.w,
                          color: AppColors.appthem,
                        )
                      ],
                    ),
                  ),

                  ////////////////////////////////////////////////

                  Container(
                    margin:
                        EdgeInsets.only(top: 2.0.h, left: 2.0.w, right: 2.0.w),
                    height: 8.0.h,
                    width: 100.0.w,
                    //  color: Colors.red,
                    child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: list.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: EdgeInsets.only(
                                left: index == 0 ? 1.0.w : 2.0.w,
                                right:
                                    index == list.length - 1 ? 2.0.w : 0.0.w),
                            child: InkWell(
                              onTap: () {
                                index == 0
                                    ? Get.to(() => FashionAndToys(),
                                        transition: Transition.rightToLeft,
                                        duration: const Duration(
                                            milliseconds: 500))
                                    : index == 1
                                        ? Get.to(() => ElectronicsScreen(),
                                            transition: Transition.rightToLeft,
                                            duration: const Duration(
                                                milliseconds: 500))
                                        : index == 2
                                            ? Get.to(() => StationaryScreen(),
                                                transition: Transition
                                                    .rightToLeft,
                                                duration: const Duration(
                                                    milliseconds: 500))
                                            : index == 3
                                                ? Get.to(() => GroceryScreen(),
                                                    transition: Transition
                                                        .rightToLeft,
                                                    duration: const Duration(
                                                        milliseconds: 500))
                                                : index == 4
                                                    ? Get.to(
                                                        () => GadgetScreen(),
                                                        transition: Transition
                                                            .rightToLeft,
                                                        duration:
                                                            const Duration(
                                                                milliseconds:
                                                                    500))
                                                    : null;
                              },
                              child: Column(
                                children: [
                                  Image.asset(
                                    list[index].iconData ?? "",
                                    height: 3.0.h,
                                  ),
                                  SizedBox(
                                    height: 1.0.h,
                                  ),
                                  Text(list[index].name.toString())
                                ],
                              ),
                            ),
                          );
                        }),
                  ),

                  ///////////////////////////

                  Padding(
                    padding: EdgeInsets.only(
                      left: 2.0.w,
                    ),
                    child: Text(
                      "New Product",
                      style: AppTextStyles.hBold.copyWith(color: Colors.black),
                    ),
                  ),
                  //////////////////////////////////////////////////////////////
                  Container(
                    margin: const EdgeInsets.all(10),
                    height: 40.0.h,
                    width: 100.0.w,
                    //  color: Colors.red,
                    child: Column(
                      children: [
                        Container(
                          margin: EdgeInsets.only(
                              left: 2.0.w, right: 2.0.w, top: 1.0.h),
                          height: 6.0.h,
                          width: 100.0.w,
                          child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: label.length,
                              itemBuilder: (context, index) {
                                return InkWell(
                                  onTap: () {
                                    setState(() {
                                      _selectedIndex = index;
                                    });
                                  },
                                  child: Container(
                                    margin: EdgeInsets.only(
                                        left: index == 0 ? 0.0.w : 2.0.w),
                                    decoration: BoxDecoration(
                                        color: _selectedIndex == index
                                            ? AppColors.appthem
                                            : Colors.white,
                                        borderRadius: BorderRadius.circular(10),
                                        border: Border.all(color: Colors.grey)),
                                    child: Center(
                                        child: Padding(
                                      padding: EdgeInsets.only(
                                        left: 3.0.w,
                                        right: 3.0.w,
                                      ),
                                      child: Text(
                                        label[index],
                                        style: TextStyle(
                                            color: _selectedIndex == index
                                                ? AppColors.colorWhite
                                                : AppColors.appthem),
                                      ),
                                    )),
                                  ),
                                );
                              }),
                        ),
                        Container(
                          margin: const EdgeInsets.all(8),
                          height: 30.0.h,
                          width: 100.0.w,
                          //color: Colors.red,
                          child: ListView.builder(
                              itemCount: list2.length,
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (context, index) {
                                return Container(
                                  margin: EdgeInsets.only(
                                      left: index == 0 ? 0.0.w : 2.0.w,
                                      top: 1.0.h,
                                      bottom: 1.0.h),
                                  // height: 25.0.h,
                                  width: 35.0.w,
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(10),
                                      boxShadow: [
                                        BoxShadow(
                                            blurRadius: 0.5,
                                            spreadRadius: 0.5,
                                            color: Colors.grey.withOpacity(0.3),
                                            offset: const Offset(0, 3))
                                      ]),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Center(
                                          child: SizedBox(
                                              height: 100,
                                              width: 100,
                                              child: Image.asset(
                                                  list2[index].imgUrl ?? "")),
                                        ),
                                        SizedBox(
                                          height: 3.0.h,
                                        ),
                                        Padding(
                                          padding: EdgeInsets.only(left: 2.0.w),
                                          child: Text(list2[index].name ?? ""),
                                        ),
                                        Container(
                                          margin: EdgeInsets.only(
                                              top: 1.0.h, left: 1.0.w),
                                          height: 3.0.h,
                                          width: 12.0.w,
                                          decoration: BoxDecoration(
                                              color: AppColors.appthem,
                                              borderRadius:
                                                  BorderRadius.circular(8)),
                                          child: Center(
                                            child: Text(
                                              list2[index].percetage ?? "",
                                              style: const TextStyle(
                                                  color: AppColors.colorWhite),
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding: EdgeInsets.only(
                                              top: 1.5.h, left: 2.0.w),
                                          child: Text(
                                            list2[index].price ?? "",
                                            style: const TextStyle(
                                                color: AppColors.appthem),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              }),
                        )
                      ],
                    ),
                  ),

                  ////////////////////////////////////////////////

                  Container(
                    margin: EdgeInsets.only(
                        bottom: 1.0.h, left: 2.0.w, right: 2.0.w),
                    height: 32.0.h,
                    width: 100.0.w,
                    //color: Colors.black,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(left: 2.0.w),
                          child: Text(
                            "Special Promo : App Only",
                            style: AppTextStyles.hBold
                                .copyWith(color: AppColors.colorBlack),
                          ),
                        ),
                        SizedBox(
                          height: 1.0.h,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Container(
                              height: 12.0.h,
                              width: 40.0.w,
                              color: Colors.red,
                              child: Image.asset(
                                AppImageResouces.img1,
                                fit: BoxFit.cover,
                              ),
                            ),
                            Container(
                              height: 12.0.h,
                              width: 40.0.w,
                              color: Colors.red,
                              child: Image.asset(
                                AppImageResouces.img2,
                                fit: BoxFit.cover,
                              ),
                            )
                          ],
                        ),
                        SizedBox(
                          height: 2.0.h,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Container(
                              height: 12.0.h,
                              width: 40.0.w,
                              color: Colors.red,
                              child: Image.asset(
                                AppImageResouces.img3,
                                fit: BoxFit.cover,
                              ),
                            ),
                            Container(
                              height: 12.0.h,
                              width: 40.0.w,
                              color: Colors.red,
                              child: Image.asset(
                                AppImageResouces.img4,
                                fit: BoxFit.cover,
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  ),

///////////////
                  Stack(
                    children: [
                      Container(
                        height: 30.0.h,
                        width: 100.0.w,
                        color: AppColors.appthem,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding:
                                      EdgeInsets.only(top: 1.0.h, left: 8.0),
                                  child: Text(
                                    "Our Best seller",
                                    style: AppTextStyles.hBold,
                                  ),
                                ),
                                Padding(
                                  padding:
                                      EdgeInsets.only(top: 0.8.h, left: 8.0),
                                  child: Text(
                                    "Get the Best product",
                                    style: AppTextStyles.hMedium,
                                  ),
                                )
                              ],
                            ),
                            const Spacer(),
                            Padding(
                              padding: EdgeInsets.only(top: 1.0.h, left: 8.0),
                              child: Text(
                                "More",
                                style: AppTextStyles.hBold,
                              ),
                            ),
                            SizedBox(
                              width: 4.0.w,
                            )
                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(
                            top: 10.0.h, left: 3.0.w, right: 3.0.w),
                        height: 30.0.h,
                        width: 100.0.w,
                        //color: Colors.red,
                        child: ListView.builder(
                            itemCount: list2.length,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) {
                              return Container(
                                margin: EdgeInsets.only(
                                    left: index == 0 ? 0.0.w : 2.0.w,
                                    top: 1.0.h,
                                    bottom: 1.0.h),
                                width: 35.0.w,
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(10),
                                    boxShadow: [
                                      BoxShadow(
                                          blurRadius: 0.5,
                                          spreadRadius: 0.5,
                                          color: Colors.grey.withOpacity(0.3),
                                          offset: const Offset(0, 3))
                                    ]),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Center(
                                        child: SizedBox(
                                            height: 100,
                                            width: 100,
                                            child: Image.asset(
                                                list2[index].imgUrl ?? "")),
                                      ),
                                      SizedBox(
                                        height: 3.0.h,
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(left: 2.0.w),
                                        child: Text(list2[index].name ?? ""),
                                      ),
                                      Container(
                                        margin: EdgeInsets.only(
                                            top: 1.0.h, left: 1.0.w),
                                        height: 3.0.h,
                                        width: 12.0.w,
                                        decoration: BoxDecoration(
                                            color: AppColors.appthem,
                                            borderRadius:
                                                BorderRadius.circular(8)),
                                        child: Center(
                                          child: Text(
                                            list2[index].percetage ?? "",
                                            style: const TextStyle(
                                                color: AppColors.colorWhite),
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(
                                            top: 1.5.h, left: 2.0.w),
                                        child: Text(
                                          list2[index].price ?? "",
                                          style: const TextStyle(
                                              color: AppColors.appthem),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            }),
                      )
                    ],
                  ),

                  ///////////////////////////////////

                  SizedBox(
                    height: 2.0.h,
                  )
                ],
              ),
            ),
          ))
        ],
      ),
    );
  }
}

class ProductDet {
  String? iconData;
  String? name;
  ProductDet({this.iconData, this.name});
}

class NewProductsList {
  String? imgUrl;
  String? name;
  String? percetage;
  String? price;
  NewProductsList({this.imgUrl, this.name, this.percetage, this.price});
}
