import 'package:firstloginapp/screens/SignUp_Page/Widgets/SignUp-Form_Widgets.dart';
import 'package:flutter/material.dart';

class SignUp_Page extends StatelessWidget {
  const SignUp_Page({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.only(top: 60),
          child: Center(
            child: Column(
              children: [
                Image.asset(
                  "assets/images/route.png",
                  height: 100,
                ),
                Text(
                  "Sing UP Now",
                  style: TextStyle(
                      fontWeight: FontWeight.w800,
                      fontSize: 40,
                      color: Color.fromRGBO(6, 13, 87, 1)),
                ),
                Text("Fill up your details and create a account",
                    style: TextStyle(color: Colors.grey)),
                SignUp_FormWidgets(),
              ],
            ),
          ),
        ),
      ),
    ));
  }
}
