import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firstloginapp/FirebaseFireStore/firestore_list_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../FirebaseFireStore/upload_images.dart';
import '../Login_Page/Login_Page.dart';
import '../homeScreen.dart';

class SplashServices {
  void isLogin(BuildContext context) {
    final auth = FirebaseAuth.instance;

    final user = auth.currentUser;

    if (user != null) {
      Timer(
          Duration(seconds: 3),
          () => Navigator.push(
              context, MaterialPageRoute(builder: (context) => UploadImage())));
    } else {
      Timer(
          Duration(seconds: 3),
          () => Navigator.push(
              context, MaterialPageRoute(builder: (context) => loginPage())));
    }
  }
}
