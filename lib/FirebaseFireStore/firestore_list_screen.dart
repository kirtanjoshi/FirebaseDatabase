import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firstloginapp/FirebaseFireStore/post_screen.dart';
import 'package:flutter/material.dart';

import '../Utils/Utils.dart';

class FireStoreScreen extends StatefulWidget {
  const FireStoreScreen({super.key});

  @override
  State<FireStoreScreen> createState() => _FireStoreScreenState();
}

class _FireStoreScreenState extends State<FireStoreScreen> {
  final fireStore = FirebaseFirestore.instance.collection("users").snapshots();

  CollectionReference ref = FirebaseFirestore.instance.collection("users");

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => PostScreen()));
          },
          child: Icon(Icons.add),
        ),
        appBar: AppBar(),
        body: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            StreamBuilder<QuerySnapshot>(
                stream: fireStore,
                builder: (BuildContext context,
                    AsyncSnapshot<QuerySnapshot> snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting)
                    return CircularProgressIndicator();

                  if (snapshot.hasError) return Text("Some error");

                  return Expanded(
                      child: ListView.builder(
                          itemCount: snapshot.data!.docs.length,
                          itemBuilder: (context, index) {
                            // String imageUrl= snapshot.data!.docs[index]["hello"];
                            return ListTile(
                              onTap: () {
                                ref
                                    .doc(snapshot.data!.docs[index].id
                                        .toString())
                                    .update({
                                  "title": "asif taj subcribe"
                                }).then((value) {
                                  Utils().ToastMessage("Updated");
                                }).onError((error, stackTrace) {
                                  Utils().ToastMessage("unable to update");
                                });

                                ref
                                    .doc(snapshot.data!.docs[index].id
                                        .toString())
                                    .delete();
                              },
                              title: Column(
                                children: [
                                  Text(
                                      snapshot.data!.docs[index].id.toString()),
                                  Text(snapshot.data!.docs[index]["title"]
                                      .toString()),
                                  // Image.network(imageUrl),
                                ],
                              ),
                            );
                          }));
                }),
          ],
        ),
      ),
    );
  }
}
