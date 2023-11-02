import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Edit_Page extends StatelessWidget {
  const Edit_Page({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            appBar: AppBar(
              title: Text("Edit Page"),
            ),
            body: SingleChildScrollView(
              child: Center(
                child: Container(
                  margin: EdgeInsets.fromLTRB(30, 50, 30, 0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image.network(
                          "${FirebaseAuth.instance.currentUser!.photoURL}"),
                      SizedBox(
                        height: 60,
                      ),
                      TextFormField(
                        initialValue:
                            FirebaseAuth.instance.currentUser!.displayName,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                          labelText: "Full Name",
                          prefixIcon: Icon(
                            Icons.account_circle,
                          ),
                          hintText: "Enter your name",
                        ),
                      ),
                      SizedBox(height: 20),
                      TextFormField(
                        initialValue: FirebaseAuth.instance.currentUser!.email,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                          labelText: "Full Email",
                          prefixIcon: Icon(
                            Icons.alternate_email,
                          ),
                          hintText: "Enter your Email",
                        ),
                      ),
                      SizedBox(height: 20),
                      TextFormField(
                        initialValue: FirebaseAuth
                            .instance.currentUser!.phoneNumber
                            .toString(),
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                          labelText: "Phone No",
                          prefixIcon: Icon(
                            Icons.phone,
                          ),
                          hintText: "Enter your Phone no",
                        ),
                      ),
                      SizedBox(height: 20),
                      TextFormField(
                        obscureText: true,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                          labelText: "Password",
                          prefixIcon: Icon(
                            Icons.fingerprint,
                          ),
                          hintText: "Enter your Password",
                        ),
                      ),
                      SizedBox(height: 25),
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              padding: EdgeInsets.all(18),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30))),
                          onPressed: () {},
                          child: Text("Edit Profile"),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            )));
  }
}
