import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_auth_and_login/login_screen/view/login_screen.dart';
import 'package:firebase_auth_and_login/services/auth_provider.dart';
import 'package:firebase_auth_and_login/utils/utilities.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
        stream: context.watch<AuthProvider>().stream(),
        builder: (context, snapshot) {
          if (snapshot.hasData) return LoginScreen();

          return Scaffold(
            // appBar: AppBar(),
            body: SafeArea(
              child: Stack(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: homeBackgroundImage, // <-- BACKGROUND IMAGE
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  // Column(
                  //   children: [
                  //     Container(
                  //       height: 300,
                  //       width: double.infinity,
                  //       child: Center(
                  //         child: CircleAvatar(
                  //           radius: 80,
                  //           backgroundColor: Colors.white,
                  //         ),
                  //       ),
                  //     ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 30),
                        child: Container(
                          height: 540,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(23),
                            color: Colors.black.withOpacity(0.5),
                          ),
                        ),
                      ),
                    ],
                  )
                  //   ],
                  // ),
                ],
              ),
            ),
          );
        });
  }
}
