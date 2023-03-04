import 'package:get/state_manager.dart';
import 'package:woo_commerce_app/utils/constant/app_image_resouces.dart';

class StationaryScreenController extends GetxController {
  RxInt SelIndex = 0.obs;
  List labels = ["Popularity", "Latest", "Highest Price", "Lowest Price"];
  List<FashionProducts> list2 = [];

  @override
  void onInit() {
    super.onInit();

    list2 = [
      FashionProducts(
          imgUrl: AppImageResouces.img8,
          name: "SmartPhones",
          percetage: "18%",
          price: "\$825",
          btext: "+ Add To Cart"),
      FashionProducts(
          imgUrl: AppImageResouces.img9,
          name: "Virtual Reality",
          percetage: "10%",
          price: "\$110",
          btext: "+ Add To Cart"),
      FashionProducts(
          imgUrl: AppImageResouces.img10,
          name: "Laptop New",
          percetage: "25%",
          price: "\$1000",
          btext: "+ Add To Cart"),
      FashionProducts(
          imgUrl: AppImageResouces.img9,
          name: "Steroe Headphone",
          percetage: "30%",
          price: "\$55",
          btext: "+ Add To Cart"),
      FashionProducts(
          imgUrl: AppImageResouces.img11,
          name: "Smar Watches",
          percetage: "10%",
          price: "\$801",
          btext: "+ Add To Cart"),
      FashionProducts(
          imgUrl: AppImageResouces.img8,
          name: "SmartPhones",
          percetage: "18%",
          price: "\$825",
          btext: "+ Add To Cart"),
      FashionProducts(
          imgUrl: AppImageResouces.img9,
          name: "Virtual Reality",
          percetage: "10%",
          price: "\$110",
          btext: "+ Add To Cart"),
      FashionProducts(
          imgUrl: AppImageResouces.img10,
          name: "Laptop New",
          percetage: "25%",
          price: "\$1000",
          btext: "+ Add To Cart"),
      FashionProducts(
          imgUrl: AppImageResouces.img9,
          name: "Steroe Headphone",
          percetage: "30%",
          price: "\$55",
          btext: "+ Add To Cart"),
      FashionProducts(
          imgUrl: AppImageResouces.img11,
          name: "Smar Watches",
          percetage: "10%",
          price: "\$801",
          btext: "+ Add To Cart"),
    ];
  }
}

class FashionProducts {
  String? imgUrl;
  String? name;
  String? percetage;
  String? price;
  String? btext;
  FashionProducts(
      {this.imgUrl, this.name, this.percetage, this.price, this.btext});
}
