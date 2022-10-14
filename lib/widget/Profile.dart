import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 255, 247, 235),
      appBar: AppBar(
        title: Text(
          'BRE',
          style: TextStyle(color: Colors.black),
        ),
        actions: [
          IconButton(
              icon: Icon(
                Icons.menu,
                color: Colors.black,
              ),
              onPressed: () {}),
        ],
        backgroundColor: Color.fromARGB(255, 180, 165, 141),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.only(top: 150),
          child: Column(children: [
            CircleAvatar(
              radius: 100,
              backgroundImage: AssetImage(
                'Assets/images/profile.jpg',
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              'Ahmed Ali',
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
            Divider(
              height: 20,
              thickness: 2,
              color: Color.fromARGB(255, 180, 165, 141),
            ),
            BuildContainer(
              icon: Icons.phone,
              data: '091 325 65 89',
            ),
            BuildContainer(
              icon: Icons.email,
              data: 'AhmedA@gmail.com',
            ),
            BuildContainer(
              icon: Icons.home,
              data: 'Benghazi/alhkhalij_street',
            ),
          ]),
        ),
      ),
    );
  }
}

class BuildContainer extends StatelessWidget {
  final IconData icon;
  final String data;

  const BuildContainer({super.key, required this.icon, required this.data});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        right: 40,
        left: 40,
        top: 20,
      ),
      child: Container(
        decoration: BoxDecoration(
            color: Color.fromARGB(255, 180, 165, 141),
            borderRadius: BorderRadius.circular(15)),
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Row(
            children: [
              Icon(icon),
              SizedBox(
                width: 30,
              ),
              Text(
                data,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
