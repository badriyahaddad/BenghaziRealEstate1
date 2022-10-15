// ignore: file_names
import 'package:flutter/services.dart';
import 'dart:async';
import 'dart:convert';
import '../Models/house_model.dart';

// List<Houses> parseHouses(String responseBody) {
//   final parsed = jsonDecode(responseBody).cast<Map<String, dynamic>>();

//   return parsed.map<Houses>((json) => Houses.fromJson(json)).toList();
// }

// Future<List<Houses>> fetchHouses(http.Client client) async {
//   final response = await client.get(Uri.parse('json/houses.json'));

//   return parseHouses(response.body);
// }

Future<List<HouseModel>> fetchHouses(
  String category,
  String type,
) async {
  //NOTE deleted cuz the data from local json file not HTTP.

  var jsonText = await rootBundle.loadString('json/houses.json');

  var data = json.decode(jsonText)[category][type];

  return (data).map<HouseModel>((json) => HouseModel.fromJson(json)).toList();
}
