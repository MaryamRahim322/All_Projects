import 'package:flutter/material.dart';
import 'package:woo_commerce_app/utils/styles/app_colors.dart';

class BlogScreen extends StatelessWidget {
  const BlogScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Blog"),
        backgroundColor: AppColors.appthem,
      ),
    );
  }
}
