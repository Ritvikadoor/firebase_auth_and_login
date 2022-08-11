import 'package:firebase_auth_and_login/utils/utilities.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SignUpScreen extends StatelessWidget {
  SignUpScreen({Key? key}) : super(key: key);
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  bool IsDataMatched = true;
  var SAVED_KEY_NAME;

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
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(
                    "https://izood.net/wp-content/uploads/2022/01/11-1.jpg"
                    // "https://media.istockphoto.com/vectors/abstract-contemporary-nature-background-design-summer-sale-social-vector-id1299012655?k=20&m=1299012655&s=170667a&w=0&h=6cdJ_76F2yWMEEPmkvnF2MchEk35z0W5BDfYFwPQZUY="
                    // "https://cdn.pixabay.com/photo/2016/11/01/18/38/background-1789175__340.png"
                    // "https://1.bp.blogspot.com/-CzSTSHoIEOo/YMEU6Jeql4I/AAAAAAAAiSE/U4-w4oxMXOkaUM7HRud21aYFyf3b0-8fgCLcBGAsYHQ/s2535/V1-DESERT-HD.png",
                    ),
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
                      Padding(
                        padding: const EdgeInsets.only(right: 100),
                        child: firstNameTextField(),
                      ),
                      hSpace10,
                      Padding(
                        padding: const EdgeInsets.only(right: 100),
                        child: secondNameTextField(),
                      ),
                      hSpace10,
                      Padding(
                        padding: const EdgeInsets.only(right: 20),
                        child: emailTextField(),
                      ),
                      hSpace10,
                      Padding(
                        padding: const EdgeInsets.only(right: 20),
                        child: typePasswordTextField(),
                      ),
                      hSpace10,
                      Padding(
                        padding: const EdgeInsets.only(right: 20),
                        child: typePasswordTextField(),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 10),
                        child: signUPButton(context),
                      ),
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

  TextFormField emailTextField() {
    return TextFormField(
      controller: usernameController,
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
      controller: usernameController,
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
          'Sign in',
          style: TextStyle(fontSize: 20, color: Colors.white),
        ),
        onPressed: () {
          checkLogin(context);
        },
      ),
    );
  }

  TextFormField secondNameTextField() {
    return TextFormField(
      controller: passwordController,
      decoration: InputDecoration(
          fillColor: Colors.white.withOpacity(0.5),
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
