// To parse this JSON data, do
//
//     final singleProductResponse = singleProductResponseFromJson(jsonString);

import 'dart:convert';

SingleProductResponse singleProductResponseFromJson(String str) =>
    SingleProductResponse.fromJson(json.decode(str));

String singleProductResponseToJson(SingleProductResponse data) =>
    json.encode(data.toJson());

class SingleProductResponse {
  SingleProductResponse({
    this.id,
    this.title,
    this.description,
    this.price,
    // this.discountPercentage,
    // this.rating,
    // this.stock,
    // this.brand,
    // this.category,
    // this.thumbnail,
    // this.images,
  });

  int? id;
  String? title;
  String? description;
  double? price;
  // double? discountPercentage;
  // double? rating;
  // int? stock;
  // String? brand;
  // String? category;
  // String? thumbnail;
  // List<String>? images;

  factory SingleProductResponse.fromJson(Map<String, dynamic> json) =>
      SingleProductResponse(
        id: json["id"],
        title: json["title"],
        description: json["description"],
        price: json["price"],
        // discountPercentage: json["discountPercentage"],
        // rating: json["rating"],
        // stock: json["stock"],
        // brand: json["brand"],
        // category: json["category"],
        // thumbnail: json["thumbnail"],
        // images: json["images"] == null
        //     ? []
        //     : List<String>.from(json["images"]!.map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "description": description,
        "price": price,
        // "discountPercentage": discountPercentage,
        // "rating": rating,
        // "stock": stock,
        // "brand": brand,
        // "category": category,
        // "thumbnail": thumbnail,
        // "images":
        //     images == null ? [] : List<dynamic>.from(images!.map((x) => x)),
      };
}
