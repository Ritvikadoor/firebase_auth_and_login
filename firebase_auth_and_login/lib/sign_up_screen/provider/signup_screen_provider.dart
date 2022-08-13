import 'package:firebase_auth_and_login/home_screen/view/home_screen.dart';
import 'package:firebase_auth_and_login/services/auth_provider_signin.dart';
import 'package:firebase_auth_and_login/utils/utilities.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SignupScreenProvider with ChangeNotifier {
  final TextEditingController _email = TextEditingController();
  final TextEditingController _pass = TextEditingController();

  bool IsDataMatched = true;
  final usernameController = TextEditingController();

  // bool IsDataMatched = true;
  var SAVED_KEY_NAME;

  TextFormField firstNameTextField() {
    return TextFormField(
      controller: usernameController,
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

  // TextFormField secondNameTextField() {
  //   return TextFormField(
  //     controller: passwordController,
  //     decoration: InputDecoration(
  //         fillColor: Colors.white.withOpacity(0.5),
  //         filled: true,
  //         border: const OutlineInputBorder(
  //           borderRadius: BorderRadius.all(Radius.circular(10)),
  //         ),
  //         hintText: 'Password'),
  //     validator: (_) {
  //       if (IsDataMatched) {
  //         return null;
  //       } else {
  //         return 'error';
  //       }
  //     },
  //   );
  // }

  TextFormField emailTextField() {
    return TextFormField(
      controller: _email,
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
      controller: _pass,
      decoration: InputDecoration(
          fillColor: Colors.white.withOpacity(0.5),
          filled: true,
          border: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
          hintText: "type first password"),
      validator: (_) {
        if (IsDataMatched) {
          return null;
        } else {
          return 'error';
        }
      },
    );
  }

  // TextFormField secondPasswordTextField() {
  //   return TextFormField(
  //     controller: _pass,
  //     decoration: InputDecoration(
  //         fillColor: Colors.white.withOpacity(0.5),
  //         filled: true,
  //         border: const OutlineInputBorder(
  //           borderRadius: BorderRadius.all(Radius.circular(10)),
  //         ),
  //         hintText: "type first password"),
  //     validator: (_) {
  //       if (IsDataMatched) {
  //         return null;
  //       } else {
  //         return 'error';
  //       }
  //     },
  //   );
  // }

  Container signUpButton(BuildContext context) {
    // var SAVED_KEY_NAME;
    final authProvider = context.read<AuthProvider>();
    void signUp(AuthProvider provider) async {
      final msg = await provider.signUp(_email.text, _pass.text, context);
      if (msg == "") return;

      ScaffoldMessenger.of(context).hideCurrentSnackBar();
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(msg)));
    }

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
          signUp(authProvider);
          // checkLogin(context);
          // Navigator.of(context).push(
          //   MaterialPageRoute(
          //     builder: (context) => const HomeScreen(),
          //   ),
          // );
        },
      ),
    );
  }

  // void checkLogin(BuildContext ctx) async {
  //   final userName = usernameController.text;
  //   final password = _pass.text;
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
