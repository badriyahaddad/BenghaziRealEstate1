import 'package:bre/Models/Content.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:sizer/sizer.dart';

import '../Settings/TabBarLs.dart';
import '../widget/HomeScreen.dart';

class Welcome extends StatefulWidget {
  const Welcome({super.key});

  @override
  State<Welcome> createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {
  int currentIndex = 0;

  late PageController _controller;
  @override
  void initState() {
    _controller = PageController(initialPage: 0);
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
        backgroundColor: Color.fromARGB(255, 255, 247, 235),
        body: Column(
          children: [
            Expanded(
              flex: 5,
              child: PageView.builder(
                  controller: _controller,
                  itemCount: 3,
                  onPageChanged: (int index) {
                    setState(() {
                      currentIndex = index;
                    });
                  },
                  itemBuilder: (_, i) {
                    return Stack(
                      children: [
                        Positioned(
                          top: 6.h,
                          left: 14.h,
                          child: Text('Benghazi',
                              style: TextStyle(
                                  fontSize: 26.sp, fontWeight: FontWeight.bold),
                              textAlign: TextAlign.center),
                        ),
                        Positioned(
                          top: 12.h,
                          left: 15.5.h,
                          child: Text('Real Estate',
                              style: TextStyle(
                                  fontSize: 20.sp, fontWeight: FontWeight.w100),
                              textAlign: TextAlign.center),
                        ),
                        // Column(
                        //   mainAxisAlignment: MainAxisAlignment.start,
                        //   children: [],
                        // ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            SizedBox(height: width * 0.30),
                            Container(
                                // margin: EdgeInsets.all(width * 0.04),
                                child: Image(
                              fit: BoxFit.contain,
                              image: AssetImage(
                                contents[i].image,
                              ),
                            )),
                            Container(
                              padding: EdgeInsets.only(
                                left: width * 0.01,
                                right: width * 0.01,
                                //bottom: width * 0.03,
                              ),
                              child: Column(
                                children: [
                                  Text(
                                    contents[i].title,
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        shadows: <Shadow>[
                                          Shadow(
                                            offset: Offset(0, 5.0),
                                            blurRadius: 10.5,
                                            color: Colors.grey.shade700,
                                          ),
                                        ],
                                        fontSize: 40,
                                        wordSpacing: 5,
                                        fontWeight: FontWeight.w600),
                                  ),
                                  SizedBox(height: width * 0.04),
                                  Center(
                                    child: Text(
                                      contents[i].description,
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        fontSize: 30,
                                        fontWeight: FontWeight.w100,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(height: width / 9),
                          ],
                        )
                      ],
                    );
                  }),
            ),
            Expanded(
              flex: 1,
              child: Column(
                children: [
                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(
                          contents.length, (index) => buildDot(index, context)),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Container(
                            width: 50,
                            height: 65,
                            margin: EdgeInsets.all(20.0),
                            decoration: BoxDecoration(
                              gradient: LinearGradient(colors: [
                                Color.fromARGB(255, 161, 130, 100),
                                Color.fromARGB(255, 39, 32, 22),
                              ]),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(60)),
                            ),
                            child: MaterialButton(
                              padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                              // minWidth: MediaQuery.of(context).size.width / 1.5,
                              onPressed: () {
                                Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => TapBarLs()),
                                );
                              },
                              child: Text(
                                "Start ",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 35,
                                  color: Colors.white,
                                ),
                              ),
                            )),
                      ),
                      Expanded(
                        child: Container(
                            margin: EdgeInsets.all(20.0),
                            width: 150,
                            height: 65,
                            decoration: BoxDecoration(
                              gradient: LinearGradient(colors: [
                                Color.fromARGB(124, 211, 208, 202),
                                Color.fromARGB(123, 180, 176, 167),
                              ]),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(60)),
                            ),
                            child: MaterialButton(
                              padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                              // minWidth: MediaQuery.of(context).size.width / 1.5,
                              onPressed: () {
                                Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => HomeScreen()));
                              },
                              child: Text(
                                "Skip",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 35,
                                  color: Colors.black,
                                ),
                              ),
                            )),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ));
  }

  Container buildDot(int index, BuildContext context) {
    return Container(
      height: 8,
      width: 11,
      margin: EdgeInsets.only(right: 5.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: currentIndex == index
            ? Colors.black
            : Color.fromARGB(136, 179, 169, 131),
      ),
    );
  }
}
