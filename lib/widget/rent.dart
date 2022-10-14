import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:sizer/sizer.dart';
import '../Models/Houses_Model.dart';
import '../services/fetchData.dart';
import '../services/function.dart';
import 'package:http/http.dart' as http;

class Rent extends StatefulWidget {
  Rent({super.key});

  @override
  State<Rent> createState() => _RentState();
}

class _RentState extends State<Rent> {
  late var _item;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      body: FutureBuilder<List<Houses>>(
          future: fetchHouses(http.Client()),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                shrinkWrap: true,
                itemCount: _item.length ?? '',
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Card(
                      elevation: 0.9.h,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      clipBehavior: Clip.antiAlias,
                      child: Column(
                        children: [
                          ListTile(
                            leading:
                                Icon(Icons.account_circle_rounded, size: 6.h),
                            title: Text(
                              _item[index].categories[index].villa.toString(),
                            ),
                            subtitle: Text(
                              _item[index]
                                  .categories[index]
                                  .villa[index]
                                  .rent[index]
                                  .location
                                  .toString(), 
                            ),
                          ),
                          Padding(
                              padding: EdgeInsets.symmetric(
                                horizontal: 2.h,
                              ),
                              child: Image.network(
                                _item[index]
                                    .categories[index]
                                    .villa[index]
                                    .rent[index]
                                    .image
                                    .toString(),
                              )),
                          Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: 2.h,
                              vertical: 2.h,
                            ),
                            child: Align(
                              alignment: Alignment.bottomRight,
                              child: Container(
                                width: 25.w,
                                decoration: BoxDecoration(
                                  color: Color.fromARGB(132, 146, 125, 118),
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Align(
                                    alignment: Alignment.center,
                                    child: Text(
                                      _item[index]
                                          .categories[index]
                                          .villa[index]
                                          .rent[index]
                                          .price
                                          .toString(),
                                      style: TextStyle(
                                          color: Color.fromARGB(255, 0, 0, 0)),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          TextButton(
                              onPressed: () {},
                              child: Padding(
                                padding: EdgeInsets.symmetric(horizontal: 15.h),
                                child: Row(
                                  children: [
                                    Icon(Icons.add_home_work),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Text(
                                      'Rent Now',
                                      style: TextStyle(fontSize: 20),
                                    ),
                                  ],
                                ),
                              ))
                        ],
                      ),
                    ),
                  );
                },
              );
            }
            return Center(child: CircularProgressIndicator());
          }),
    );
  }
}
