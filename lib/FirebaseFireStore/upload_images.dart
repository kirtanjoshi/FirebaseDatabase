import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

class UploadImage extends StatefulWidget {
  const UploadImage({super.key});

  @override
  State<UploadImage> createState() => _UploadImageState();
}

class _UploadImageState extends State<UploadImage> {
  File? _image;
  final imagepicker = ImagePicker();

  firebase_storage.FirebaseStorage storage =
      firebase_storage.FirebaseStorage.instance;

  final fireStore = FirebaseFirestore.instance.collection("users");
  CollectionReference ref = FirebaseFirestore.instance.collection("users");

  Future getImageGallery() async {
    final pickedFile = await imagepicker.pickImage(source: ImageSource.gallery);
    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      } else {
        print("no ImageFound");
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Upload"),
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            InkWell(
              onTap: () {
                getImageGallery();
              },
              child: Container(
                height: 500,
                width: 500,
                decoration:
                    BoxDecoration(border: Border.all(color: Colors.black)),
                child: _image != null
                    ? Image.file(_image!.absolute)
                    : Center(child: Icon(Icons.image)),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(
                onPressed: () async {
                  firebase_storage.Reference ref = firebase_storage
                      .FirebaseStorage.instance
                      .ref('/foldername/' +
                          DateTime.now().millisecondsSinceEpoch.toString());
                  firebase_storage.UploadTask uploadTask =
                      ref.putFile(_image!.absolute);

                  await Future.value(uploadTask);

                  var newUrl = await ref.getDownloadURL();
                  String id = DateTime.now().millisecond.toString();
                  fireStore.doc(id).set({
                    "hello": newUrl.toString(),
                    "id": id,
                  });
                },
                child: Text("Image Upload"))
          ],
        ),
      ),
    );
  }
}
