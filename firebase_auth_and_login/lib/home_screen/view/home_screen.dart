import 'dart:convert';
import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth_and_login/login_screen/view/login_screen.dart';
import 'package:firebase_auth_and_login/services/auth_provider.dart';
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
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
        stream: context.watch<AuthProvider>().stream(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) LoginScreen();
          return Scaffold(
              floatingActionButton: FloatingActionButton(
                child: const Icon(Icons.add),
                onPressed: () {
                  // Navigator.of(context).push(
                  //     MaterialPageRoute(builder: (context) => AddScreen()));
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
              body: Container());
        });
  }
}
