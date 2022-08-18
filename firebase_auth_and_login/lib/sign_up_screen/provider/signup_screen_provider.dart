import 'package:firebase_auth_and_login/home_screen/view/home_screen.dart';
import 'package:firebase_auth_and_login/services/auth_provider.dart';
import 'package:firebase_auth_and_login/utils/utilities.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SignupScreenProvider with ChangeNotifier {
  final emailControllerfb = TextEditingController();
  final usernameControllerfb = TextEditingController();
  final passwordControllerfb = TextEditingController();
  bool IsDataMatched = true;
  var SAVED_KEY_NAME;

  TextFormField firstNameTextField() {
    return TextFormField(
      controller: usernameControllerfb,
      decoration: InputDecoration(
          fillColor: Colors.white.withOpacity(0.5),
          filled: true,
          border: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
          hintText: firstName),
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
      controller: emailControllerfb,
      decoration: InputDecoration(
          fillColor: Colors.white.withOpacity(0.5),
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

  TextFormField typePasswordTextField() {
    return TextFormField(
      controller: passwordControllerfb,
      decoration: InputDecoration(
          fillColor: Colors.white.withOpacity(0.5),
          filled: true,
          border: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
          hintText: "Type  password"),
      validator: (_) {
        if (IsDataMatched) {
          return null;
        } else {
          return 'error';
        }
      },
    );
  }

  Container signUPButton(BuildContext context) {
    return Container(
      height: 40,
      width: 100,
      child: TextButton(
        style: TextButton.styleFrom(
          backgroundColor: Colors.red,
          minimumSize: const Size.fromHeight(50),
        ),
        child: const Text(
          'Sign Up',
          style: TextStyle(fontSize: 20, color: Colors.white),
        ),
        onPressed: () {
          if (usernameControllerfb == null ||
              emailControllerfb == null ||
              passwordControllerfb == null) {
            return;
          }
          context
              .read<AuthProvider>()
              .signUp(emailControllerfb.text, passwordControllerfb.text);
          // checkLogin(context);
          // Navigator.of(context).push(
          //   MaterialPageRoute(
          //     builder: (context) => HomeScreen(),
          //   ),
          // );
        },
      ),
    );
  }

  // void checkLogin(BuildContext ctx) async {
  //   final userName = usernameController.text;
  //   final password = passwordController.text;
  //   if (userName == 'ritvik' && password == 'hello') {
  //     //got to home
  //     IsDataMatched = true;
  //     final sharedPrefs = await SharedPreferences.getInstance();
  //     await sharedPrefs.setBool(SAVED_KEY_NAME, true);
  //     // Navigator.of(ctx).pushReplacement(
  //     //     MaterialPageRoute(builder: (ctx1) => const ScreenHome()));
  //   } else {
  //     IsDataMatched = false;
  //   }
  // }
}
