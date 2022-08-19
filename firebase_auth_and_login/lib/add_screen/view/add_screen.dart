import 'dart:convert';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth_and_login/services/img_provider.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

class AddScreen extends StatelessWidget {
  AddScreen({Key? key}) : super(key: key);
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String imgstring = '';

  File? imageFile;

  changeImage(String imgstring) {
    this.imgstring = imgstring;
  }

  @override
  Widget build(BuildContext context) {
    final nameControllerfb = TextEditingController();
    final phoneNumberControllerfb = TextEditingController();
    final placeControllerfb = TextEditingController();
    File? imagefile;
    final ImagePicker picker = ImagePicker();

    void _addTask() {
      FirebaseFirestore.instance.collection("Student Management").add({
        "title": nameControllerfb.text,
        "number": phoneNumberControllerfb.text,
        "place": placeControllerfb.text,
        "image": context.read<ScreenProvider>().imageAvtr,
      });
    }

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: ListView(shrinkWrap: true, children: [
            const Text(
              'ADD STUDENT',
              style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
            ),
            Center(child: imageprofile(context)),
            const SizedBox(
              height: 40,
            ),
            Container(
              decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 219, 219, 219),
                  borderRadius: BorderRadius.circular(10)),
              child: Form(
                key: _formKey,
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    children: [
                      TextFormField(
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter some text';
                          }
                          return null;
                        },
                        controller: nameControllerfb,
                        decoration: InputDecoration(
                            fillColor: Colors.white,
                            filled: true,
                            hintText: 'Enter Student Name',
                            border: OutlineInputBorder(
                                borderSide: BorderSide.none,
                                borderRadius: BorderRadius.circular(20))),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      TextFormField(
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter some text';
                          }
                          return null;
                        },
                        controller: phoneNumberControllerfb,
                        decoration: InputDecoration(
                            fillColor: Colors.white,
                            filled: true,
                            hintText: 'Enter the Number',
                            border: OutlineInputBorder(
                                borderSide: BorderSide.none,
                                borderRadius: BorderRadius.circular(20))),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      TextFormField(
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter some text';
                          }
                          return null;
                        },
                        controller: placeControllerfb,
                        decoration: InputDecoration(
                          fillColor: Colors.white,
                          filled: true,
                          hintText: 'Enter Place',
                          border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            ElevatedButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.black),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
              ),
              onPressed: () {
                _addTask();
                print(imgstring.toString());
                // print(_nameControllerfb.text);
                if (!_formKey.currentState!.validate()) {
                  return null;
                }
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Processing Data'),
                  ),
                );

                //   Navigator.of(context).pop();

                // onAddStudentButtonClicked(context);
              },
              child: const Text('Add Student'),
            )
          ]),
        ),
      ),
    );
  }

  Widget imageprofile(BuildContext context) {
    return Stack(
      children: [
        imgstring.trim().isEmpty
            ? Image.network(
                "https://static.vecteezy.com/system/resources/previews/004/819/327/original/male-avatar-profile-icon-of-smiling-caucasian-man-vector.jpg",
                fit: BoxFit.contain,
                height: 250,
                width: 250,
              )
            : Image.memory(
                const Base64Decoder().convert(imgstring),
                width: 250,
                height: 250,
                fit: BoxFit.cover,
              ),
        Positioned(
          left: 50,
          right: 50,
          top: 170,
          bottom: 0,
          // padding: const EdgeInsets.only(top: 150, left: 150),
          child: IconButton(
              onPressed: () {
                showBottomSheet(context);
              },
              icon: const Icon(
                Icons.camera_alt,
                color: Colors.black,
                size: 40,
              )),
        )
      ],
    );
  }

  Future<void> takePhoto(BuildContext context) async {
    XFile? image = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (image == null) return;
    File imageTemprary = File(image.path);
    final bayts = File(image.path).readAsBytesSync();
    String encode = base64Encode(bayts);
  }

  Future<void> takecamera(BuildContext context) async {
    XFile? image = await ImagePicker().pickImage(source: ImageSource.camera);
    if (image == null) return;
    final imageTemprary = File(image.path);
    final bayts = File(image.path).readAsBytesSync();
    String encode = base64Encode(bayts);
  }

  Future<void> showBottomSheet(BuildContext context) async {
    showModalBottomSheet(
      context: context,
      builder: (ctx1) {
        return Container(
          height: 100,
          width: double.infinity,
          color: Colors.white,
          child: Column(children: [
            const Text('choise your profile photo'),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                    onPressed: () {
                      takecamera(context);
                    },
                    icon: const Icon(Icons.camera)),
                IconButton(
                    onPressed: () {
                      takePhoto(context);
                    },
                    icon: const Icon(Icons.browse_gallery))
              ],
            )
          ]),
        );
      },
    );
  }
}
