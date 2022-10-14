import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../screens/SplachScreen.dart';
import 'HomeScreen.dart';

class LoginScreen extends StatefulWidget {
  final TabController? tabControll;

  const LoginScreen({Key? key, required this.tabControll}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.only(
              right: 40,
              left: 40,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  // child: Container(
                  //   width: 200,
                  //   child: Image.asset(
                  //     'Assets/images/login.png',
                  //   ),
                  // ),
                ),
                SizedBox(
                  height: 10,
                ),
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
                  icon: Icons.remove_red_eye_outlined,
                  hint: 'Enter Your Password',
                  issecure: true,
                ),
                SizedBox(
                  height: 20,
                ),
                TextButton(
                  child: Text(
                    "login",
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
                SizedBox(
                  height: 20,
                ),
                Row(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(left: 25),
                      child: Text(
                        "You Dont Have an Account ?",
                        style: TextStyle(fontSize: 15),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        widget.tabControll?.animateTo(1);
                      },
                      child: Text(
                        "Sing Up",
                        style: TextStyle(
                            fontWeight: FontWeight.w700, fontSize: 15),
                      ),
                    ),
                  ],
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
      {super.key,
      required this.issecure,
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
