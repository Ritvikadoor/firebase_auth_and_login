import 'package:firebase_auth_and_login/login_screen/widgets/bottom_sheet_login.dart';
import 'package:firebase_auth_and_login/sign_up_screen/view/sign_up_screen.dart';
import 'package:firebase_auth_and_login/utils/utilities.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  bool IsDataMatched = true;
  var SAVED_KEY_NAME;

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
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 10),
                      child: emailTextField(),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: passwordTextField(),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: Column(
                        // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          loginButton(context),
                          signUpButton(context),
                        ],
                      ),
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

  TextButton signUpButton(BuildContext context) {
    return TextButton(
      child: const Text(
        'Sign Up?',
        style: TextStyle(fontSize: 16, color: Colors.red),
      ),
      onPressed: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => SignUpScreen(),
          ),
        );
        // checkLogin(context);
      },
    );
  }

  Container loginButton(BuildContext context) {
    return Container(
      height: 40,
      width: 100,
      child: TextButton(
        style: TextButton.styleFrom(
          backgroundColor: Colors.red,
          minimumSize: const Size.fromHeight(50),
        ),
        child: const Text(
          'Login',
          style: TextStyle(fontSize: 20, color: Colors.white),
        ),
        onPressed: () {
          checkLogin(context);
        },
      ),
    );
  }

  TextFormField passwordTextField() {
    return TextFormField(
      controller: passwordController,
      decoration: InputDecoration(
          fillColor: Colors.black.withOpacity(0.2),
          filled: true,
          border: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
          hintText: 'Password'),
      validator: (_) {
        if (IsDataMatched) {
          return null;
        } else {
          return 'error';
        }
      },
    );
  }

  TextFormField emailTextField() {
    return TextFormField(
      controller: usernameController,
      decoration: InputDecoration(
          fillColor: Colors.black.withOpacity(0.2),
          filled: true,
          border: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
          hintText: emailText),
      validator: (_) {
        if (IsDataMatched) {
          return null;
        } else {
          return 'error';
        }
      },
    );
  }

  void checkLogin(BuildContext ctx) async {
    final userName = usernameController.text;
    final password = passwordController.text;
    if (userName == 'ritvik' && password == 'hello') {
      //got to home
      IsDataMatched = true;
      final sharedPrefs = await SharedPreferences.getInstance();
      await sharedPrefs.setBool(SAVED_KEY_NAME, true);
      // Navigator.of(ctx).pushReplacement(
      //     MaterialPageRoute(builder: (ctx1) => const ScreenHome()));
    } else {
      IsDataMatched = false;
    }
  }
}