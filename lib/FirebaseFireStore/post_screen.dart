import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firstloginapp/FirebaseFireStore/upload_images.dart';
import 'package:firstloginapp/Utils/Utils.dart';

import 'package:flutter/material.dart';

class PostScreen extends StatefulWidget {
  const PostScreen({super.key});

  @override
  State<PostScreen> createState() => _PostScreenState();
}

class _PostScreenState extends State<PostScreen> {
  final postController = TextEditingController();
  bool loading = false;
  final fireStore = FirebaseFirestore.instance.collection("users");

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              TextFormField(
                controller: postController,
                maxLines: 3,
                decoration: InputDecoration(
                    hintText: "Whats on your mind",
                    border: OutlineInputBorder()),
              ),
              SizedBox(
                height: 30,
              ),
              ElevatedButton(
                  onPressed: () {
                    loading:
                    loading;
                    setState(() {
                      loading = true;
                    });
                    String id = DateTime.now().millisecond.toString();
                    fireStore.doc(id).set({
                      "title": postController.text.toString(),
                      "id": id.toString(),
                    }).then((value) {
                      Navigator.pop(context);
                      Utils().ToastMessage("Post message");
                      loading = false;
                    }).onError((error, stackTrace) {
                      loading = false;
                      Utils().ToastMessage(error.toString());
                    });
                  },
                  child: Text("Post")),
              ElevatedButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => UploadImage()));
                  },
                  child: Text("image"))
            ],
          ),
        ),
      ),
    );
  }
}
