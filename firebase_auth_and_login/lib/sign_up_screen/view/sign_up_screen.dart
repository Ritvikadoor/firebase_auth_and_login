import 'package:firebase_auth_and_login/sign_up_screen/provider/signup_screen_provider.dart';
import 'package:firebase_auth_and_login/utils/signup_utils/utilities.dart';
import 'package:firebase_auth_and_login/utils/utilities.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SignUpScreen extends StatelessWidget {
  SignUpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   backgroundColor: Colors.transparent,
      //   elevation: 0,
      // ),
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: signupScreenBackgroundImage,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Center(
              child: Container(
                height: 450,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(23),
                  color: Colors.red.withOpacity(0.2),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(top: 20, left: 10),
                  child: Column(
                    children: [
                      Consumer<SignupScreenProvider>(
                          builder: (context, firstnameValue, _) {
                        return Padding(
                          padding: const EdgeInsets.only(right: 100),
                          child: firstnameValue.firstNameTextField(),
                          //  firstNameTextField(),
                        );
                      }),
                      hSpace10,
                      Consumer<SignupScreenProvider>(
                          builder: (context, secondName, _) {
                        return Padding(
                          padding: const EdgeInsets.only(right: 100),
                          child: secondName.secondNameTextField(),
                        );
                      }),
                      hSpace10,
                      Consumer<SignupScreenProvider>(
                          builder: (context, emailValue, _) {
                        return Padding(
                          padding: const EdgeInsets.only(right: 20),
                          child: emailValue.emailTextField(),
                          // emailTextField(),
                        );
                      }),
                      hSpace10,
                      Consumer<SignupScreenProvider>(
                          builder: (context, passwordValue, _) {
                        return Padding(
                          padding: const EdgeInsets.only(right: 20),
                          child: passwordValue.typePasswordTextField(),
                        );
                      }),
                      hSpace10,
                      Consumer<SignupScreenProvider>(
                          builder: (context, passwordtwoValue, _) {
                        return Padding(
                            padding: const EdgeInsets.only(right: 20),
                            child: passwordtwoValue.secondPasswordTextField()
                            // secondPasswordTextField(),
                            );
                      }),
                      Consumer<SignupScreenProvider>(
                          builder: (context, signupValue, _) {
                        return Padding(
                          padding: const EdgeInsets.only(top: 10),
                          child: signupValue.signUPButton(context),
                          //  signUPButton(context),
                        );
                      }),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
