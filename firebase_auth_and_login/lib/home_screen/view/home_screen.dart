import 'dart:convert';
import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth_and_login/add_screen/view/add_screen.dart';
import 'package:firebase_auth_and_login/edit_screen/view/edit_scren.dart';

import 'package:firebase_auth_and_login/login_screen/view/login_screen.dart';
import 'package:firebase_auth_and_login/services/auth_provider.dart';
import 'package:firebase_auth_and_login/services/img_provider.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key})
      : super(
          key: key,
        );

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String imgstring = '';

  File? imageFile;

  changeImage(String imgstring) {
    this.imgstring = imgstring;
  }

  void _addTask() {
    FirebaseFirestore.instance.collection("Student Management").add({
      "title": _nameControllerfb.text,
      "number": _phoneNumberControllerfb.text,
      "place": _placeControllerfb.text,
    });
  }

  final _nameControllerfb = TextEditingController();

  final _phoneNumberControllerfb = TextEditingController();

  final _placeControllerfb = TextEditingController();

  File? imagefile;

  final ImagePicker _picker = ImagePicker();

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
        stream: context.watch<AuthProvider>().stream(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) return LoginScreen();
          return Scaffold(
            floatingActionButton: FloatingActionButton(
              child: const Icon(Icons.add),
              onPressed: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) => AddScreen()));
              },
            ),
            appBar: AppBar(
              toolbarHeight: 80,
              elevation: 0,
              backgroundColor: Colors.transparent,
              actions: [
                IconButton(
                    onPressed: () {
                      context.read<AuthProvider>().signOut();
                    },
                    icon: const Icon(
                      Icons.logout,
                      color: Colors.black,
                    )),
              ],
            ),
            body: StreamBuilder<QuerySnapshot>(
                stream: FirebaseFirestore.instance
                    .collection("Student Management")
                    .snapshots(),
                builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                  final data = snapshot.data!.docs.first;
                  if (!snapshot.hasData) {
                    return Center(child: CircularProgressIndicator());
                  }
                  return SafeArea(
                    child: ListView(
                      children: [
                        Column(
                          children: snapshot.data!.docs.map((document) {
                            return ListTile(
                              leading: CircleAvatarImageWidget(data: data),
                              title: Text(document["title"]),
                              subtitle: Text(document["place"]),
                              onTap: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => EditScreen()));
                              },
                            );
                          }).toList(),
                        ),
                      ],
                    ),
                  );
                }),
          );
        });
  }
}

class CircleAvatarImageWidget extends StatelessWidget {
  final QueryDocumentSnapshot<Object?> data;

  const CircleAvatarImageWidget({Key? key, required this.data})
      : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    return Consumer<ScreenProvider>(builder: (context, value, child) {
      return CircleAvatar(
        radius: 40,
        backgroundImage: MemoryImage(
          const Base64Decoder().convert(
              value.imageAvtr.trim().isEmpty ? data['image'] : value.imageAvtr),
        ),
      );
    });
  }
}
