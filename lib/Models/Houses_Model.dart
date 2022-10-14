// To parse this JSON data, do
//
//     final houses = housesFromJson(jsonString);

import 'dart:convert';

Houses housesFromJson(String str) => Houses.fromJson(json.decode(str));

String housesToJson(Houses data) => json.encode(data.toJson());

class Houses {
  Houses({
    required this.categories,
  });

  List<Category> categories;

  factory Houses.fromJson(Map<String, dynamic> json) => Houses(
        categories: List<Category>.from(
            json[" Categories"].map((x) => Category.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        " Categories": List<dynamic>.from(categories.map((x) => x.toJson())),
      };
}

class Category {
  Category({
    required this.villa,
    required this.appartment,
    required this.office,
    required this.market,
  });

  List<Market> villa;
  List<Market> appartment;
  List<Market> office;
  List<Market> market;

  factory Category.fromJson(Map<String, dynamic> json) => Category(
        villa: List<Market>.from(json["Villa"].map((x) => Market.fromJson(x))),
        appartment: List<Market>.from(
            json["appartment "].map((x) => Market.fromJson(x))),
        office:
            List<Market>.from(json["Office "].map((x) => Market.fromJson(x))),
        market:
            List<Market>.from(json["Market "].map((x) => Market.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "Villa": List<dynamic>.from(villa.map((x) => x.toJson())),
        "appartment ": List<dynamic>.from(appartment.map((x) => x.toJson())),
        "Office ": List<dynamic>.from(office.map((x) => x.toJson())),
        "Market ": List<dynamic>.from(market.map((x) => x.toJson())),
      };
}

class Market {
  Market({
    required this.rent,
    required this.sell,
  });

  List<Rent> rent;
  List<Rent> sell;

  factory Market.fromJson(Map<String, dynamic> json) => Market(
        rent: List<Rent>.from(json["Rent"].map((x) => Rent.fromJson(x))),
        sell: List<Rent>.from(json["sell"].map((x) => Rent.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "Rent": List<dynamic>.from(rent.map((x) => x.toJson())),
        "sell": List<dynamic>.from(sell.map((x) => x.toJson())),
      };
}

class Rent {
  Rent({
    required this.id,
    required this.area,
    required this.location,
    required this.price,
    required this.image,
  });

  String id;
  String area;
  Location location;
  Price price;
  String image;

  factory Rent.fromJson(Map<String, dynamic> json) => Rent(
        id: json["id"],
        area: json["area"],
        location: locationValues.map[json["location"]]!,
        price: priceValues.map[json["price"]]!,
        image: json["image"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "area": area,
        "location": locationValues.reverse?[location],
        "price": priceValues.reverse?[price],
        "image": image,
      };
}

enum Location { ALJALA_STREET, ALKHALIJ_STREET }

final locationValues = EnumValues({
  "aljala street": Location.ALJALA_STREET,
  "alkhalij street": Location.ALKHALIJ_STREET
});

enum Price {
  THE_2000_LD_IN_MONTH,
  THE_3000_LD_IN_MONTH,
  THE_1500_LD_IN_MONTH,
  THE_1200_LD_IN_MONTH,
  THE_1000_LD_IN_MONTH,
  THE_2500_LD_IN_MONTH,
  THE_99000_LD,
  THE_100000_LD
}

final priceValues = EnumValues({
  "100.000LD": Price.THE_100000_LD,
  "1000LD in month": Price.THE_1000_LD_IN_MONTH,
  "1200LD in month": Price.THE_1200_LD_IN_MONTH,
  "1500LD in month": Price.THE_1500_LD_IN_MONTH,
  "2000LD in month": Price.THE_2000_LD_IN_MONTH,
  "2500LD in month": Price.THE_2500_LD_IN_MONTH,
  "3000LD in month": Price.THE_3000_LD_IN_MONTH,
  "99.000LD": Price.THE_99000_LD
});

class EnumValues<T> {
  Map<String, T> map;
  Map<T, String>? reverseMap;

  EnumValues(this.map);

  Map<T, String>? get reverse {
    if (reverseMap == null) {
      reverseMap = map.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap;
  }
}
