import 'package:flutter/material.dart';
import 'package:woo_commerce_app/utils/styles/app_colors.dart';
import 'package:woo_commerce_app/views/bottom_bar_pages/accounts_pages/account.dart';
import 'package:woo_commerce_app/views/bottom_bar_pages/accounts_pages/sign_in.dart';

class AccTab extends StatelessWidget {
  int? initialIndex = 0;
  AccTab({super.key, this.initialIndex});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        initialIndex: initialIndex ?? 0,
        child: Scaffold(
          appBar: AppBar(
            title: const Text("Account"),
            backgroundColor: AppColors.appthem,
            bottom: const TabBar(indicatorColor: AppColors.colorWhite, tabs: [
              Tab(
                text: "Login",
              ),
              Tab(
                text: "Sign Up",
              )
            ]),
          ),
          body: TabBarView(children: [AccountScreen(), RegisterScreen()]),
        ));
  }
}
