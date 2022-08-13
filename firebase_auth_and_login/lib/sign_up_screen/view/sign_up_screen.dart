import 'package:firebase_auth_and_login/home_screen/widgets/backgroundimage_widget.dart';
import 'package:firebase_auth_and_login/sign_up_screen/provider/signup_screen_provider.dart';
import 'package:firebase_auth_and_login/utils/utilities.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   backgroundColor: Colors.transparent,
      //   elevation: 0,
      // ),
      body: Stack(
        children: [
          const BackgroundImageWidget(),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Center(
              child: Container(
                height: 350,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(23),
                  color: Colors.red.withOpacity(0.2),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(top: 20, left: 10),
                  child: Column(
                    children: [
                      // Consumer<SignupScreenProvider>(
                      //     builder: (context, firstnameValue, _) {
                      //   return Padding(
                      //     padding: const EdgeInsets.only(right: 100),
                      //     child: firstnameValue.firstNameTextField(),
                      //     //  firstNameTextField(),
                      //   );
                      // }),
                      hSpace10,
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
                          builder: (context, signupValue, _) {
                        return Padding(
                          padding: const EdgeInsets.only(top: 10),
                          child: signupValue.signUpButton(context),
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
