import 'dart:convert';
import 'dart:core';
import 'package:bre/Models/Houses_Model.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:sizer/sizer.dart';

import '../Settings/Tapbar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

List content = [
  {"image": "Assets/images/apartment.png", "name": "Apartment"},
  {"image": "Assets/images/villa.png", "name": "Villas"},
  {"image": "Assets/images/ofice.png", "name": "Offices"},
  {"image": "Assets/images/shop.png", "name": "Shops"},
];

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: Text(
            'BRE',
            style: GoogleFonts.ebGaramond(
              fontSize: 40.sp,
              color: Colors.black,
            ),
          ),
        ),
        body: Align(
          alignment: Alignment.center,
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: 8.h,
                ),
                Text(
                  'Real Estate \n Benghazi',
                  style: GoogleFonts.lobster(
                    fontSize: 40.sp,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                GridView.builder(
                  shrinkWrap: true,
                  itemCount: content.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 1,
                    mainAxisSpacing: 1,
                  ),
                  itemBuilder: (BuildContext context, int index) {
                    return Padding(
                      padding: EdgeInsets.symmetric(
                          vertical: 1.h, horizontal: 1.5.w),
                      child: InkWell(
                        onTap: () {
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => TabbarScreen()));
                        },
                        child: Card(
                          elevation: 1.h,
                          child: Column(
                            children: [
                              Expanded(
                                child: Image.asset(
                                  content[index]["image"].toString(),
                                ),
                              ),
                              SizedBox(
                                height: 1.h,
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  content[index]["name"].toString(),
                                  style: TextStyle(
                                    fontSize: 15.sp,
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ));
  }
}
