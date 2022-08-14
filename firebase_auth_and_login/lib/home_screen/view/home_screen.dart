import 'dart:convert';
import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth_and_login/edit_screen/view/edit_scren.dart';

import 'package:firebase_auth_and_login/home_screen/provider/home_screen_provider.dart';
import 'package:firebase_auth_and_login/login_screen/view/login_screen.dart';
import 'package:firebase_auth_and_login/services/auth_provider_signin.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);
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

//   @override
//   State<HomeScreen> createState() => _ScreenAddState();
// }

// class _ScreenAddState extends State<HomeScreen> {
  // final _formkey = GlobalKey<FormState>();
  final _nameControllerfb = TextEditingController();

  // final _ageController = TextEditingController();

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
            drawer: Drawer(
              backgroundColor: Colors.black,
              // Add a ListView to the drawer. This ensures the user can scroll
              // through the options in the drawer if there isn't enough vertical
              // space to fit everything.
              child: StreamBuilder<QuerySnapshot>(
                  stream: FirebaseFirestore.instance
                      .collection("Student Management")
                      .snapshots(),
                  builder: (context, snapshot) {
                    if (!snapshot.hasData) {
                      return Center(child: CircularProgressIndicator());
                    }
                    return Expanded(
                      child: ListView(
                        // Important: Remove any padding from the ListView.
                        padding: EdgeInsets.zero,
                        children: snapshot.data!.docs.map((document) {
                          return DrawerHeader(
                            decoration: const BoxDecoration(
                              color: Colors.blue,
                            ),
                            child: ListTile(
                              title: Text(document["title"]),
                              subtitle: Text(document["place"]),
                              // leading: Text(document["number"]),
                              onTap: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => EditScreen()));
                                // Update the state of the app.
                                // ...
                              },
                            ),
                          );
                        }).toList(),
                        //  DrawerHeader(
                        //   decoration: const BoxDecoration(
                        //     color: Colors.blue,
                        //   ),
                        //   child: Text('Drawer Header'),
                        // ),

                        // ListTile(
                        //   title: const Text('Item 2'),
                        //   onTap: () {
                        //     // Update the state of the app.
                        //     // ...
                        //   },
                        // ),
                      ),
                    );
                  }),
            ),
            appBar: AppBar(
              toolbarHeight: 80,
              elevation: 0,
              backgroundColor: Colors.transparent,
              // leading: Padding(
              //   padding: EdgeInsets.all(8.0),
              //   child:
              // ),
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
            body: SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: ListView(shrinkWrap: true, children: [
                  Form(
                      // key: _formkey,
                      child: Column(
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(left: 10, top: 20),
                        child: Text(
                          'ADD STUDENT',
                          style: TextStyle(
                              fontSize: 40, fontWeight: FontWeight.bold),
                        ),
                      ),
                      Center(
                        child: ClipOval(
                          child: Container(),
                          // child: imageprofile(context),
                        ),
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                      Container(
                        decoration: BoxDecoration(
                            color: const Color.fromARGB(255, 219, 219, 219),
                            borderRadius: BorderRadius.circular(10)),
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
                                controller: _nameControllerfb,
                                decoration: InputDecoration(
                                    fillColor: Colors.white,
                                    filled: true,
                                    hintText: 'Enter Student Name',
                                    border: OutlineInputBorder(
                                        borderSide: BorderSide.none,
                                        borderRadius:
                                            BorderRadius.circular(20))),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              // TextFormField(
                              //   validator: (value) {
                              //     if (value == null || value.isEmpty) {
                              //       return 'Please enter some text';
                              //     }
                              //     return null;
                              //   },
                              //   controller: _ageController,
                              //   decoration: InputDecoration(
                              //       fillColor: Colors.white,
                              //       filled: true,
                              //       hintText: 'Enter Age',
                              //       border: OutlineInputBorder(
                              //           borderSide: BorderSide.none,
                              //           borderRadius:
                              //               BorderRadius.circular(20))),
                              // ),
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
                                controller: _phoneNumberControllerfb,
                                decoration: InputDecoration(
                                    fillColor: Colors.white,
                                    filled: true,
                                    hintText: 'Enter the Number',
                                    border: OutlineInputBorder(
                                        borderSide: BorderSide.none,
                                        borderRadius:
                                            BorderRadius.circular(20))),
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
                                controller: _placeControllerfb,
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
                      const SizedBox(
                        height: 10,
                      ),
                      ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(Colors.black),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                          ),
                        ),
                        onPressed: () {
                          _addTask();
                          // print(_nameControllerfb.text);
                          // if (_formkey.currentState!.validate()) {
                          //   ScaffoldMessenger.of(context).showSnackBar(
                          //     const SnackBar(
                          //       content: Text('Processing Data'),
                          //     ),
                          //   );

                          //   Navigator.of(context).pop();
                          // }
                          // onAddStudentButtonClicked(context);
                        },
                        child: const Text('Add Student'),
                      )
                    ],
                  ))
                ]),
              ),
            ),
          );
        });
  }

  // Future<void> takePhoto(BuildContext context) async {
  //   XFile? image = await ImagePicker().pickImage(source: ImageSource.gallery);

  //   if (image == null) return;

  //   File imageTemprary = File(image.path);
  //   final bayts = File(image.path).readAsBytesSync();
  //   String encode = base64Encode(bayts);

  //   // context.read<FunctionProvider>().imgstring = encode;
  //   // context.read<FunctionProvider>().changeImage(encode);
  // }

  // Future<void> takecamera(BuildContext context) async {
  //   XFile? image = await ImagePicker().pickImage(source: ImageSource.camera);

  //   if (image == null) return;

  //   final imageTemprary = File(image.path);

  //   final bayts = File(image.path).readAsBytesSync();
  //   String encode = base64Encode(bayts);

  //   // context.read<FunctionProvider>().imgstring = encode;
  //   // context.read<FunctionProvider>().changeImage(encode);
  // }

  // Future<void> showBottomSheet(BuildContext context) async {
  //   showModalBottomSheet(
  //     context: context,
  //     builder: (ctx1) {
  //       return Container(
  //         height: 100,
  //         width: double.infinity,
  //         color: Colors.white,
  //         child: Column(children: [
  //           const Text('choise your profile photo'),
  //           Row(
  //             mainAxisAlignment: MainAxisAlignment.center,
  //             children: [
  //               IconButton(
  //                   onPressed: () {
  //                     takecamera(context);
  //                   },
  //                   icon: const Icon(Icons.camera)),
  //               IconButton(
  //                   onPressed: () {
  //                     takePhoto(context);
  //                   },
  //                   icon: const Icon(Icons.browse_gallery))
  //             ],
  //           )
  //         ]),
  //       );
  //     },
  //   );
  // }

  // Widget imageprofile(BuildContext context) {

  //   return Consumer(
  //     builder: (context, value, child) => Stack(
  //       children: [
  //         value.imgstring.trim().isEmpty
  //             ? Image.asset(
  //                 "lib/res/images/add_screen_profile_pic.webp",
  //                 fit: BoxFit.contain,
  //                 height: 250,
  //                 width: 250,
  //               )
  //             : Image.memory(
  //                 const Base64Decoder().convert(value.imgstring),
  //                 width: 250,
  //                 height: 250,
  //                 fit: BoxFit.cover,
  //               ),
  //         Positioned(
  //           left: 50,
  //           right: 50,
  //           top: 170,
  //           bottom: 0,
  //           // padding: const EdgeInsets.only(top: 150, left: 150),
  //           child: IconButton(
  //               onPressed: () {
  //                 // showBottomSheet(context);
  //               },
  //               icon: const Icon(
  //                 Icons.camera_alt,
  //                 color: Colors.black,
  //                 size: 40,
  //               )),
  //         )
  //       ],
  //     ),
  //   );
  // }

  // Future<void> onAddStudentButtonClicked(BuildContext context) async {
  //   final name = _nameController.text;
  //   final age = _ageController.text;
  //   final phoneNumber = _phoneNumberController.text;
  //   final place = _placeController.text;
  //   final imgstri = _picker;
  //   if (name.isEmpty || age.isEmpty || phoneNumber.isEmpty || place.isEmpty) {
  //     return;
  //   } else {
  //     // final _student = await StudentModel(
  //     //     name: name,
  //     //     age: age,
  //     //     phoneNumber: phoneNumber,
  //     //     place: place,
  //     //     imgstri: context.read().imgstring);

  //     // context.read().addStudent(_student);
  //   }
  // }
}
