import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../Controllers/product_controller.dart';

class SingleProductScreen extends StatefulWidget {
  int id;
  SingleProductScreen({super.key, this.id = 1});

  @override
  State<SingleProductScreen> createState() => _SingleProductScreenState();
}

class _SingleProductScreenState extends State<SingleProductScreen> {
  var productidController = Get.put(ProductsController());
  @override
  void initState() {
    print("+++++++++++++++++++++++++++++${widget.id}");

    super.initState();
    productidController.getSingleProducts(widget.id);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Single Product"),
        ),
        body: Obx(
          () => productidController.loading2.value
              ? const Center(child: CircularProgressIndicator())
              : productidController.error2.value != ''
                  ? Center(
                      child: Column(
                      children: [
                        IconButton(
                            onPressed: () {
                              productidController.getSingleProducts(widget.id);
                            },
                            icon: const Icon(Icons.refresh)),
                        Text(productidController.error2.value),
                      ],
                    ))
                  : Container(
                      height: 160,
                      margin: const EdgeInsets.only(
                        left: 6.0,
                        right: 6.0,
                      ),
                      child: Card(
                        child: Padding(
                          padding: const EdgeInsets.all(6.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(
                                height: 10.0,
                              ),
                              Text(
                                "  id:  ${productidController.singleproductmodel.id ?? ""}",
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold),
                              ),
                              const SizedBox(
                                height: 5.0,
                              ),
                              Text(
                                " Price: ${productidController.singleproductmodel.price ?? ""}",
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold),
                              ),
                              const SizedBox(
                                height: 6.0,
                              ),
                              Text(
                                  " Title: ${productidController.singleproductmodel.title ?? ""}"),
                              const SizedBox(
                                height: 6.0,
                              ),
                              const SizedBox(
                                height: 5.0,
                              ),
                              Text(
                                  " Description: ${productidController.singleproductmodel.description ?? ""}"),
                            ],
                          ),
                        ),
                      ),
                    ),
        ));
  }
}
