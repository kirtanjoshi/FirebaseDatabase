import 'package:firebase_auth/firebase_auth.dart';
import 'package:firstloginapp/screens/SignUp_Page/SignUp_Page.dart';
import 'package:firstloginapp/screens/homeScreen.dart';
import 'package:firstloginapp/services/auth_services.dart';
import 'package:flutter/material.dart';

import '../../../Utils/Utils.dart';

class Form_Widget extends StatefulWidget {
  Form_Widget({
    super.key,
  });

  @override
  State<Form_Widget> createState() => _Form_WidgetState();
}

class _Form_WidgetState extends State<Form_Widget> {
  final emailcontroller = TextEditingController();
  final passwordcontroller = TextEditingController();
  final _formField = GlobalKey<FormState>();
  final _auth = FirebaseAuth.instance;

  // void SignIn() {
  //   _auth
  //       .signInWithEmailAndPassword(
  //           email: emailcontroller.text,
  //           password: passwordcontroller.text.toString())
  //       .then((value) {
  //     Utils().ToastMessage(value.user!.email.toString());
  //     Navigator.push(
  //         context, MaterialPageRoute(builder: (context) => HomePage()));
  //   }).catchError((error, stackTrace) async {
  //     debugPrint(error.toString());
  //     Utils().ToastMessage(error.toString());
  //     return Future<Set<void>>.error(error);
  //   });
  // }

  void SignIn() {
    _auth
        .signInWithEmailAndPassword(
            email: emailcontroller.text,
            password: passwordcontroller.text.toString())
        .then((value) {
      Utils().ToastMessage(value.user!.email.toString());
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => const HomePage()));
    }).onError((error, stackTrace) async {
      debugPrint(error.toString());
      Utils().ToastMessage(error.toString());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Form(
        key: _formField,
        child: Container(
          padding: const EdgeInsets.all(20),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text("Email", style: TextStyle(color: Colors.grey)),
                TextFormField(
                  controller: emailcontroller,
                  decoration: const InputDecoration(
                    prefixIcon: Icon(Icons.email),
                    labelText: "Email",
                    hintText: "Enter your email here",
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "enter Email";
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                const Text("Password", style: TextStyle(color: Colors.grey)),
                TextFormField(
                  controller: passwordcontroller,
                  decoration: const InputDecoration(
                    prefixIcon: Icon(Icons.email),
                    labelText: "Email",
                    hintText: "Enter your email here",
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "enter Pass";
                    }
                    return null;
                  },
                ),
                Align(
                  alignment: Alignment.topRight,
                  child: TextButton(
                    onPressed: () {},
                    child: const Text("Forget Password?"),
                  ),
                ),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      if (_formField.currentState!.validate()) {
                        SignIn();
                      }
                    },
                    child: Text("SignIn".toUpperCase()),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                const Row(
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
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextButton(
                      onPressed: () async {
                        await AuthServices().sinInwithGoogle();
                        // ignore: use_build_context_synchronously
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const HomePage()));
                      },
                      child: Image.asset(
                        "assets/images/google.png",
                        height: 40,
                      ),
                    ),
                    const SizedBox(
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
                const SizedBox(
                  height: 40,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Don't have an account?"),
                    TextButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const SignUp_Page()));
                        },
                        child: const Text("Register"))
                  ],
                )
              ]),
        ));
  }
}
