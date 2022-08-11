import 'package:firebase_auth_and_login/utils/signup_utils/utilities.dart';
import 'package:flutter/material.dart';

class BackgroundImageWidget extends StatelessWidget {
  const BackgroundImageWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: signupScreenBackgroundImage,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
