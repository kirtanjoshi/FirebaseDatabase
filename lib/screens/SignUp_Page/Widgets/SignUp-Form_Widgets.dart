import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firstloginapp/Utils/Utils.dart';
import 'package:flutter/material.dart';

class SignUp_FormWidgets extends StatefulWidget {
  const SignUp_FormWidgets({super.key});

  @override
  State<SignUp_FormWidgets> createState() => _SignUp_FormWidgetsState();
}

class _SignUp_FormWidgetsState extends State<SignUp_FormWidgets> {
  final _formField = GlobalKey<FormState>();
  final email = TextEditingController();
  final username = TextEditingController();
  final password = TextEditingController();

  FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    email.dispose();
    username.dispose();
    password.dispose();
  }

  void signUP() {
    _auth
        .createUserWithEmailAndPassword(
            email: email.text, password: password.text.toString())
        .then((value) {
      Navigator.pop(context);
    }).onError((error, stackTrace) {
      Utils().ToastMessage(error.toString());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Form(
        key: _formField,
        child: Container(
          padding: EdgeInsets.all(20),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Username", style: TextStyle(color: Colors.grey)),
                TextFormField(
                  controller: username,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.supervised_user_circle_rounded),
                    labelText: "Username",
                    hintText: "Enter your username here",
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Text("Email", style: TextStyle(color: Colors.grey)),
                TextFormField(
                  controller: email,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.email),
                    labelText: "Email",
                    hintText: "Enter your email here",
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Text("Password", style: TextStyle(color: Colors.grey)),
                TextFormField(
                  controller: password,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.email),
                    labelText: "Email",
                    hintText: "Enter your email here",
                  ),
                ),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      if (_formField.currentState!.validate()) {
                        signUP();
                      }
                    },
                    child: Text("SignUp".toUpperCase()),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Row(
                  children: [
                    Expanded(
                      child: Divider(
                        thickness: 0.5,
                        color: Colors.grey,
                      ),
                    ),
                    Text("or continue with"),
                    Expanded(
                      child: Divider(
                        thickness: 0.5,
                        color: Colors.grey,
                      ),
                    ),
                    SizedBox(
                      height: 50,
                    ),
                  ],
                ),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextButton(
                      onPressed: () async {},
                      child: Image.asset(
                        "assets/images/google.png",
                        height: 40,
                      ),
                    ),
                    SizedBox(
                      width: 30,
                    ),
                    TextButton(
                        onPressed: () {},
                        child: Image.asset(
                          "assets/images/download__3_-removebg-preview.png",
                          height: 40,
                        )),
                  ],
                ),
                SizedBox(
                  height: 40,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Already have an account?"),
                    TextButton(onPressed: () {}, child: Text("Log In"))
                  ],
                )
              ]),
        ));
  }
}
