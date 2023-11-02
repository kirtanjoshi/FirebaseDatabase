import 'package:firstloginapp/screens/Login_Page/Widgets/Form_Widgets.dart';
import 'package:flutter/material.dart';

class loginPage extends StatefulWidget {
  const loginPage({super.key});

  @override
  State<loginPage> createState() => _loginPageState();
}

class _loginPageState extends State<loginPage> {
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
                    "Let's sign you in.",
                    style: TextStyle(
                        fontWeight: FontWeight.w800,
                        fontSize: 40,
                        color: Color.fromRGBO(6, 13, 87, 1)),
                  ),
                  Text("Sign in with your data that you have",
                      style: TextStyle(color: Colors.grey)),
                  Text(
                    "entered during your registration",
                    style: TextStyle(color: Colors.grey),
                  ),
                  Form_Widget(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
