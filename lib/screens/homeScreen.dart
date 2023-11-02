import 'package:firebase_auth/firebase_auth.dart';
import 'package:firstloginapp/services/auth_services.dart';
import 'package:flutter/material.dart';

import '../Utils/Utils.dart';
import 'Login_Page/Login_Page.dart';
import 'edit_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentPageIndex = 0;
  final auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Center(child: Text("Profile")),
        ),
        bottomNavigationBar: NavigationBar(
          onDestinationSelected: (int index) {
            setState(() {
              currentPageIndex = index;
            });
          },
          indicatorColor: Colors.red,
          selectedIndex: currentPageIndex,
          destinations: [
            NavigationDestination(
              selectedIcon: Icon(Icons.home),
              icon: Icon(Icons.home_outlined),
              label: "Home",
            ),
            NavigationDestination(
              selectedIcon: Icon(Icons.settings),
              icon: Icon(Icons.settings),
              label: "Home",
            ),
            NavigationDestination(
              selectedIcon: Icon(Icons.account_circle_sharp),
              icon: Icon(Icons.account_circle),
              label: "Home",
            ),
          ],
        ),
        body: <Widget>[
          Container(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // Image.network("${FirebaseAuth.instance.currentUser!.photoURL}"),
                  // Text("${FirebaseAuth.instance.currentUser!.displayName}"),
                  ElevatedButton(
                      onPressed: () async {
                        auth.signOut().then((value) {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => loginPage()));
                        }).onError((error, stackTrace) {
                          Utils().ToastMessage(error.toString());
                        });
                      },
                      child: Text("Signout"))
                ],
              ),
            ),
          ),
          Container(
            alignment: Alignment.center,
            child: Text("2"),
          ),
          Container(
            alignment: Alignment.center,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.network("${FirebaseAuth.instance.currentUser!.photoURL}"),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "${FirebaseAuth.instance.currentUser!.displayName}",
                  style: TextStyle(color: Colors.black),
                ),
                Text(
                  "${FirebaseAuth.instance.currentUser!.email}",
                  style: TextStyle(
                    color: Colors.black,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Edit_Page()));
                    },
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      padding: EdgeInsets.symmetric(
                        vertical: 15,
                        horizontal: 60,
                      ),
                      backgroundColor: Colors.yellow,
                    ),
                    child: Text("Edit Profile",
                        style: TextStyle(color: Colors.black))),
                SizedBox(height: 50),
                Text(
                  "Settings",
                  style: TextStyle(color: Colors.black, fontSize: 15),
                ),
                SizedBox(height: 30),
                Text(
                  "Settings",
                  style: TextStyle(color: Colors.black, fontSize: 15),
                ),
                SizedBox(height: 30),
                Text(
                  "Settings",
                  style: TextStyle(color: Colors.black, fontSize: 15),
                ),
              ],
            ),
          ),
        ][currentPageIndex],
      ),
    );
  }
}
