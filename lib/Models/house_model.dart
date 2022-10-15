// To parse this JSON data, do
//
//     final houseModel = houseModelFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

class HouseModel {
  HouseModel({
    required this.id,
    required this.area,
    required this.location,
    required this.price,
    required this.image,
  });

  String id;
  String area;
  String location;
  String price;
  String image;

  factory HouseModel.fromRawJson(String str) =>
      HouseModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory HouseModel.fromJson(Map<String, dynamic> json) => HouseModel(
        id: json["id"],
        area: json["area"],
        location: json["location"],
        price: json["price"],
        image: json["image"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "area": area,
        "location": location,
        "price": price,
        "image": image,
      };
}
