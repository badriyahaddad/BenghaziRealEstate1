import 'package:bre/services/fetchData.dart';
import 'package:bre/widget/list_of_estates_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class TabbarScreen extends StatefulWidget {
  const TabbarScreen({super.key, required this.category});
  final String category;

  @override
  State<TabbarScreen> createState() => _TabbarScreenState();
}

class _TabbarScreenState extends State<TabbarScreen>
    with SingleTickerProviderStateMixin {
  String type = 'rent';
  late TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey.shade200,
        elevation: 0,
        title: Text('BRE'),
        bottom: TabBar(
          controller: _tabController,
          unselectedLabelColor: Color.fromARGB(255, 161, 130, 100),
          indicatorSize: TabBarIndicatorSize.label,
          indicator: BoxDecoration(
              gradient: const LinearGradient(colors: [
                Color.fromARGB(255, 161, 130, 100),
                Color.fromARGB(255, 252, 207, 149)
              ]),
              borderRadius: BorderRadius.circular(50),
              color: Colors.redAccent),
          tabs: <Widget>[
            GestureDetector(
              onTap: () {
                setState(() {
                  _tabController.index = 0;
                  type = 'rent';
                  fetchHouses(widget.category, type);
                });
              },
              child: Container(
                width: size.width * 0.45,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Center(
                    child: Text(
                      '      For Rent      ',
                    ),
                  ),
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                setState(() {
                  _tabController.index = 1;
                  type = 'sell';
                  fetchHouses(widget.category, type);
                });
              },
              child: Container(
                width: size.width * 0.45,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Center(
                    child: Text(
                      '      For Sell      ',
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      body:
          //  TabBarView(
          //   children: <Widget>[
          Column(
        children: [
          Expanded(
              child: ListOfEstatesScreen(
            category: widget.category,
            type: type,
          )),
        ],
      ),
    );
  }
}
