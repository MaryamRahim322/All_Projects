import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:woo_commerce_app/custom_widgets/custom_button.dart';
import 'package:woo_commerce_app/custom_widgets/custom_textfield.dart';
import 'package:woo_commerce_app/data/controllers/category_pages_controllers/fashion_toys_controller.dart';
import 'package:woo_commerce_app/utils/styles/app_colors.dart';

class CatScreen extends StatelessWidget {
  var searchController = TextEditingController();
  var controller = Get.put(FashionAndToysController());
  CatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Category"),
        backgroundColor: AppColors.appthem,
      ),
      body: Column(children: [
        Container(
          height: 8.0.h,
          width: 100.0.w,
          decoration:
              const BoxDecoration(color: AppColors.colorWhite, boxShadow: [
            BoxShadow(
                blurRadius: 0.5,
                spreadRadius: 0.5,
                color: AppColors.grey,
                offset: Offset(0, 3))
          ]),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              SizedBox(
                width: 3.0.w,
              ),
              Expanded(
                child: CustomTextField(
                  controller: searchController,
                  hintText: "Search",
                  height: 5.0.h,
                  width: 40.0.w,
                  color: AppColors.grey,
                ),
              ),
              SizedBox(
                width: 3.0.w,
              ),
              CustomButton(
                onpressed: () {},
                text: "Search",
                color: AppColors.appthem,
              ),
              SizedBox(
                width: 3.0.w,
              ),
            ],
          ),
        ),
        Flexible(
            child: Container(
          margin: EdgeInsets.only(top: 2.0.h),
          height: 100.0.h,
          //  color: Colors.red,
          child: Row(
            children: [
              Expanded(
                  flex: 2,
                  child: Container(
                    width: 30.0.w,
                    height: 100.0.h,
                    color: AppColors.appthem,
                    child: ListView.builder(
                        itemCount: controller.list2.length,
                        itemBuilder: ((context, index) {
                          return Container(
                            margin: EdgeInsets.only(
                                top: index == 0 ? 1.0.h : 2.0.h,
                                left: 2.0.w,
                                right: 2.0.w,
                                bottom: index == controller.list2.length - 1
                                    ? 2.0.h
                                    : 0.0.h),
                            decoration: BoxDecoration(
                                color: AppColors.colorWhite,
                                borderRadius: BorderRadius.circular(10)),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(
                                      top: 1.0.h,
                                      left: 1.0.w,
                                      right: 1.0.w,
                                      bottom: 0.5.h),
                                  child: Image.asset(
                                    controller.list2[index].imgUrl.toString(),
                                    height: 4.0.h,
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(bottom: 0.5.h),
                                  child:
                                      Text(controller.list2[index].name ?? ""),
                                )
                              ],
                            ),
                          );
                        })),
                  )),

              ///////////////////right side container
              Expanded(
                  flex: 4,
                  child: SizedBox(
                    width: 30.0.w,
                    height: 100.0.h,
                    //     color: AppColors.colorGreen,
                    child: GridView.builder(
                        padding: const EdgeInsets.all(10),
                        gridDelegate:
                            const SliverGridDelegateWithMaxCrossAxisExtent(
                                maxCrossAxisExtent: 200,
                                childAspectRatio: 1.8 / 2.8,
                                crossAxisSpacing: 10,
                                mainAxisSpacing: 10),
                        itemCount: controller.list2.length,
                        itemBuilder: (BuildContext ctx, index) {
                          return Container(
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                                color: AppColors.colorWhite,
                                borderRadius: BorderRadius.circular(15),
                                boxShadow: const [
                                  BoxShadow(
                                      blurRadius: 0.5,
                                      spreadRadius: 0.5,
                                      color: AppColors.grey,
                                      offset: Offset(0, 3))
                                ]),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(3.0),
                                  child: Center(
                                    child: Image.asset(
                                      controller.list2[index].imgUrl ?? "",
                                      height: 10.0.h,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding:
                                      EdgeInsets.only(top: 1.0.h, left: 3.0.w),
                                  child: SizedBox(
                                      width: 70.0.w,
                                      child: Text(
                                        controller.list2[index].name ?? "",
                                        maxLines: 1,
                                      )),
                                ),
                                Padding(
                                  padding:
                                      EdgeInsets.only(left: 3.0.w, top: 0.5.h),
                                  child:
                                      Text(controller.list2[index].price ?? ""),
                                ),
                                Center(
                                  child: CustomButton(
                                    onpressed: () {},
                                    text: "+ Add to cart",
                                    color: AppColors.appthem,
                                  ),
                                )
                              ],
                            ),
                          );
                        }),
                  ))
            ],
          ),
        ))
      ]),
    );
  }
}
