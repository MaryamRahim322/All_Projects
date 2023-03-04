import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:woo_commerce_app/custom_widgets/custom_button.dart';
import 'package:woo_commerce_app/data/controllers/category_pages_controllers/gadgets_controller.dart';
import 'package:woo_commerce_app/utils/styles/app_colors.dart';
import 'package:woo_commerce_app/utils/styles/apptextstyles.dart';

class GadgetScreen extends StatelessWidget {
  var controller = Get.put(GadgetcreenController());
  GadgetScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 10.0.h,
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
                  Text(
                    "Gadgets",
                    style: AppTextStyles.appbar,
                  )
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 4.0.w, top: 1.0.h),
              child: Text(
                "Sort",
                style:
                    AppTextStyles.hBold.copyWith(color: AppColors.colorBlack),
              ),
            ),
            Container(
              margin: const EdgeInsets.all(8),
              height: 4.0.h,
              width: 100.0.w,
              // color: Colors.red,
              child: ListView.builder(
                  itemCount: controller.labels.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: ((context, index) => Obx(() => GestureDetector(
                        onTap: () {
                          controller.SelIndex.value = index;
                        },
                        child: Container(
                          margin: EdgeInsets.only(
                              left: index == 0 ? 0.0.w : 2.0.w,
                              right: index == controller.labels.length - 1
                                  ? 2.0.w
                                  : 0.0.w),
                          decoration: BoxDecoration(
                              color: controller.SelIndex.value == index
                                  ? AppColors.appthem
                                  : AppColors.colorWhite,
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(
                                color: controller.SelIndex.value == index
                                    ? AppColors.appthem
                                    : AppColors.grey,
                              )),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              controller.labels[index],
                              style: TextStyle(
                                color: controller.SelIndex.value == index
                                    ? AppColors.colorWhite
                                    : AppColors.colorBlack,
                              ),
                            ),
                          ),
                        ),
                      )))),
            ),
            Flexible(
                child: SizedBox(
              height: 100.0.h,
              //    color: Colors.red,
              child: GridView.builder(
                  padding: const EdgeInsets.all(10),
                  gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                      maxCrossAxisExtent: 300,
                      childAspectRatio: 1 / 2,
                      crossAxisSpacing: 20,
                      mainAxisSpacing: 20),
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
                            padding: const EdgeInsets.all(8.0),
                            child: Image.asset(
                              controller.list2[index].imgUrl ?? "",
                              height: 20.0.h,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(controller.list2[index].name ?? ""),
                          ),
                          Container(
                            margin: EdgeInsets.only(top: 0.5.h, left: 2.0.w),
                            height: 3.0.h,
                            width: 12.0.w,
                            decoration: BoxDecoration(
                                color: AppColors.appthem,
                                borderRadius: BorderRadius.circular(8)),
                            child: Center(
                              child: Text(
                                controller.list2[index].percetage ?? "",
                                style: const TextStyle(
                                    color: AppColors.colorWhite),
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 3.0.w, top: 1.0.h),
                            child: Text(controller.list2[index].name ?? ""),
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 3.0.w, top: 1.0.h),
                            child: Text(controller.list2[index].price ?? ""),
                          ),
                          Center(
                            child: CustomButton(
                              onpressed: () {},
                              text: "Add to cart",
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
      ),
    );
  }
}
