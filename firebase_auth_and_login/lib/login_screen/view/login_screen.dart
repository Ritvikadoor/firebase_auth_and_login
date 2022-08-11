import 'package:firebase_auth_and_login/login_screen/provider/login_provider.dart';
import 'package:firebase_auth_and_login/login_screen/widgets/bottom_sheet_login.dart';
import 'package:firebase_auth_and_login/utils/utilities.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      // backgroundColor: Colors.white,
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: loginBackgroundImage, // <-- BACKGROUND IMAGE
                fit: BoxFit.cover,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 28),
            child: Center(
                child: Container(
              height: 330,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(23),
                color: Colors.white.withOpacity(0.5),
              ),
              child: Padding(
                padding: const EdgeInsets.only(top: 70),
                child: Column(
                  children: [
                    Consumer<LoginScreenProvider>(
                        builder: (context, emailValue, _) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 10, horizontal: 10),
                        child: emailValue.emailTextField(),
                        //  emailTextField(),
                      );
                    }),
                    Consumer<LoginScreenProvider>(
                        builder: (context, passValue, _) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: passValue.passwordTextField(),
                        // passwordTextField()
                      );
                    }),
                    Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: Consumer<LoginScreenProvider>(
                          builder: (context, value, _) {
                        return Column(
                          // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            // loginButton(context),
                            value.loginButton(context),
                            value.signUpButton(context),
                            // signUpButton(context),
                          ],
                        );
                      }),
                    ),
                  ],
                ),
              ),
              // color: Colors.white,
            )),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: const [
              BottomSheetLogin(),
            ],
          ),
        ],
      ),
    );
  }
}
