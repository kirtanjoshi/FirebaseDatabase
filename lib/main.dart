import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firstloginapp/screens/SignUp_Page/SignUp_Page.dart';
import 'package:firstloginapp/screens/homeScreen.dart';
import 'package:firstloginapp/screens/Login_Page/Login_Page.dart';
import 'package:firstloginapp/screens/splash_screen/splash_screen.dart';
import 'package:firstloginapp/services/auth_services.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'FirebaseFireStore/firestore_list_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(
    MaterialApp(
      home: FireStoreScreen(),
    ),
  );
}
