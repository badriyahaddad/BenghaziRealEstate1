import 'package:bre/Models/house_model.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import '../services/fetchData.dart';

class ListOfEstatesScreen extends StatefulWidget {
  ListOfEstatesScreen({super.key, required this.category, required this.type});
  final String category;
  final String type;
  @override
  State<ListOfEstatesScreen> createState() => _ListOfEstatesScreenState();
}

class _ListOfEstatesScreenState extends State<ListOfEstatesScreen> {
  // late var _item;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      body: FutureBuilder<List<HouseModel>>(
          future: fetchHouses(widget.category, widget.type),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                shrinkWrap: true,
                itemCount: snapshot.data!.length,
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
                              // snapshot.data[index].location.toString(),
                              snapshot.data![index].location.toString(),
                            ),
                            subtitle: Text(
                              // _item[index]
                              //     .categories[index]
                              //     .villa[index]
                              //     .rent[index]
                              //     .location
                              //     .toString(),
                              snapshot.data![index].location.toString(),
                            ),
                          ),
                          Padding(
                              padding: EdgeInsets.symmetric(
                                horizontal: 2.h,
                              ),
                              child: Image.asset(
                                // _item[index]
                                //     .categories[index]
                                //     .villa[index]
                                //     .rent[index]
                                //     .image
                                //     .toString(),
                                snapshot.data![index].image.toString(),
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
                                      // _item[index]
                                      //     .categories[index]
                                      //     .villa[index]
                                      //     .rent[index]
                                      //     .price
                                      //     .toString(),
                                      snapshot.data![index].price.toString(),
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
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 25),
                                child: Row(
                                  children: [
                                    const Icon(Icons.add_home_work),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Text(
                                      widget.type == 'sell'
                                          ? 'Buy Now'
                                          : 'Rent Now',
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
