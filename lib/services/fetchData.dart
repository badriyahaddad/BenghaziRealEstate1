import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';
import '../Models/Houses_Model.dart';

List<Houses> parseHouses(String responseBody) {
  final parsed = jsonDecode(responseBody).cast<Map<String, dynamic>>();

  return parsed.map<Houses>((json) => Houses.fromJson(json)).toList();
}

Future<List<Houses>> fetchHouses(http.Client client) async {
  final response = await client.get(Uri.parse('json/houses.json'));

  return parseHouses(response.body);
}
