import 'package:bre/screens/SplachScreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'HomeScreen.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.only(
            right: 40,
            left: 40,
          ),
          child: Container(
            height: 400,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                BuildTextField(
                  data: TextEditingController(),
                  icon: Icons.person,
                  hint: 'Enter Your Name',
                  issecure: false,
                ),
                SizedBox(
                  height: 10,
                ),
                BuildTextField(
                  data: TextEditingController(),
                  icon: Icons.email,
                  hint: 'Enter Your Email address',
                  issecure: false,
                ),
                SizedBox(
                  height: 10,
                ),
                BuildTextField(
                  data: TextEditingController(),
                  icon: Icons.remove_red_eye_outlined,
                  hint: 'Enter Your Password',
                  issecure: true,
                ),
                SizedBox(
                  height: 20,
                ),
                BuildTextField(
                  data: TextEditingController(),
                  icon: Icons.remove_red_eye_outlined,
                  hint: 'confirmation Your Password',
                  issecure: true,
                ),
                SizedBox(
                  height: 20,
                ),
                TextButton(
                  child: Text(
                    "SignUp",
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w400,
                      fontSize: 20,
                    ),
                  ),
                  style: TextButton.styleFrom(
                    backgroundColor: Color.fromARGB(255, 161, 130, 100),
                  ),
                  onPressed: () {
                    setState(() {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: ((context) => HomeScreen()),
                        ),
                      );
                    });

                    // if(data.text.isEmpty ){
                    //   return;
                    // }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class BuildTextField extends StatelessWidget {
  final TextEditingController data;
  final IconData icon;
  final String hint;
  bool issecure = true;

  BuildTextField(
      {required this.issecure,
      required this.data,
      required this.icon,
      required this.hint});

  @override
  Widget build(BuildContext context) {
    return TextField(
      obscureText: issecure,
      controller: data,
      decoration: InputDecoration(
        border: OutlineInputBorder(),
        hintText: hint,
        suffixIcon: IconButton(
          icon: Icon(
            icon,
          ),
          onPressed: () {
            // setState(
            //   () {
            //     if (icon == Icons.remove_red_eye_outlined) {
            //       issecure = !issecure;
            //     }
            //   },
            // );
          },
        ),
      ),
    );
  }
}
