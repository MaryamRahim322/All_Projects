import 'package:flutter/material.dart';
import 'package:woo_commerce_app/utils/styles/app_colors.dart';
import 'package:woo_commerce_app/views/bottom_bar_pages/accounts_pages/acc_tab.dart';
import 'package:woo_commerce_app/views/bottom_bar_pages/blog.dart';
import 'package:woo_commerce_app/views/bottom_bar_pages/cart_screen.dart';
import 'package:woo_commerce_app/views/bottom_bar_pages/category.dart';
import 'package:woo_commerce_app/views/bottom_bar_pages/home_page.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  int _selectedTab = 0;
  List pages = [
    const HomePage(),
    const BlogScreen(),
    CatScreen(),
    const CartScreen(),
    AccTab()
  ];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          bottomNavigationBar: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            selectedIconTheme: const IconThemeData(color: AppColors.appthem),
            currentIndex: _selectedTab,
            onTap: (index) => _changeTab(index),
            selectedItemColor: AppColors.appthem,
            unselectedItemColor: Colors.black,
            items: const [
              BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
              BottomNavigationBarItem(
                  icon: Icon(Icons.note_add_rounded), label: "Blog"),
              BottomNavigationBarItem(
                  icon: Icon(Icons.space_dashboard_outlined),
                  label: "Category"),
              BottomNavigationBarItem(
                  icon: Icon(Icons.shopping_bag), label: "Cart"),
              BottomNavigationBarItem(
                  icon: Icon(Icons.person), label: "Account"),
            ],
          ),
          body: pages[_selectedTab]),
    );
  }

  _changeTab(int index) {
    setState(() {
      _selectedTab = index;
    });
  }
}
