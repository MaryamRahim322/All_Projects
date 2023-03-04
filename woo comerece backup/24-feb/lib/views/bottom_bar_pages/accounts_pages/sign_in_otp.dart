import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:woo_commerce_app/custom_widgets/custom_button.dart';
import 'package:woo_commerce_app/custom_widgets/custom_textfield.dart';
import 'package:woo_commerce_app/utils/styles/app_colors.dart';
import 'package:woo_commerce_app/utils/styles/apptextstyles.dart';

class SignInWithOtp extends StatefulWidget {
  const SignInWithOtp({super.key});

  @override
  State<SignInWithOtp> createState() => _SignInWithOtpState();
}

class _SignInWithOtpState extends State<SignInWithOtp> {
  var controller = TextEditingController();
  var controllerPhone = TextEditingController();

  var cCode = "+92";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Sign with Otp"),
        backgroundColor: AppColors.appthem,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "Please Enter Your Mobile number for access the app",
              style: AppTextStyles.hMedium
                  .copyWith(color: AppColors.colorBlack, fontSize: 14.sp),
            ),
          ),
          SizedBox(
            height: 3.0.h,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
                  height: 5.0.h,
                  width: 30.0.w,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: AppColors.grey),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(cCode),
                      IconButton(
                        onPressed: () {
                          showCountryPicker(
                              context: context,
                              countryListTheme: CountryListThemeData(
                                flagSize: 25,
                                backgroundColor: Colors.white,
                                textStyle: const TextStyle(
                                    fontSize: 16, color: Colors.blueGrey),
                                bottomSheetHeight:
                                    500, // Optional. Country list modal height
                                //Optional. Sets the border radius for the bottomsheet.
                                borderRadius: const BorderRadius.only(
                                  topLeft: Radius.circular(20.0),
                                  topRight: Radius.circular(20.0),
                                ),
                                //Optional. Styles the search field.
                                inputDecoration: InputDecoration(
                                  labelText: 'Search',
                                  hintText: 'Start typing to search',
                                  prefixIcon: const Icon(Icons.search),
                                  border: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: const Color(0xFF8C98A8)
                                          .withOpacity(0.2),
                                    ),
                                  ),
                                ),
                              ),
                              onSelect: (Country country) {
                                setState(() {
                                  cCode = country.phoneCode;
                                });
                                print('Select country: ${country.displayName}');
                              });
                        },
                        icon: const Icon(Icons.arrow_drop_down),
                      ),
                    ],
                  )),
              CustomTextField(
                controller: controllerPhone,
                hintText: "Enter phone Number",
                height: 5.0.h,
                width: 60.0.w,
                color: AppColors.grey,
              )
            ],
          ),
          const Spacer(),
          Padding(
            padding: EdgeInsets.only(left: 3.0.w, right: 3.0.w),
            child: CustomButton(
              onpressed: () {},
              text: "Login",
              color: AppColors.appthem,
              width: 100.0.w,
              height: 6.0.h,
            ),
          ),
          SizedBox(
            height: 2.0.h,
          )
        ],
      ),
    );
  }
}
