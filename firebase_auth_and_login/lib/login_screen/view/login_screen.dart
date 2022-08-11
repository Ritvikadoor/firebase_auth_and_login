import 'package:firebase_auth_and_login/login_screen/widgets/bottom_sheet_login.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.white,
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(
                    "https://1.bp.blogspot.com/-CzSTSHoIEOo/YMEU6Jeql4I/AAAAAAAAiSE/U4-w4oxMXOkaUM7HRud21aYFyf3b0-8fgCLcBGAsYHQ/s2535/V1-DESERT-HD.png"), // <-- BACKGROUND IMAGE
                fit: BoxFit.cover,
              ),
            ),
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
