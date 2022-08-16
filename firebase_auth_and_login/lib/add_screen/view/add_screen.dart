import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class AddScreen extends StatelessWidget {
  const AddScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _nameControllerfb = TextEditingController();

    // final _ageController = TextEditingController();

    final _phoneNumberControllerfb = TextEditingController();

    final _placeControllerfb = TextEditingController();

    File? imagefile;

    final ImagePicker _picker = ImagePicker();

    void _addTask() {
      FirebaseFirestore.instance.collection("Student Management").add({
        "title": _nameControllerfb.text,
        "number": _phoneNumberControllerfb.text,
        "place": _placeControllerfb.text,
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
            // Center(
            //   child: ClipOval(
            //     child: Container(),
            //     // child: imageprofile(context),
            //   ),
            // ),
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
                              borderRadius: BorderRadius.circular(20))),
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
                backgroundColor: MaterialStateProperty.all(Colors.black),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
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
          ]),
        ),
      ),
    );
  }
}
