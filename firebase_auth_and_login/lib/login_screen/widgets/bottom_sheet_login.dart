import 'package:firebase_auth_and_login/login_screen/view_model/google_bottom_sheet.dart';
import 'package:firebase_auth_and_login/login_screen/view_model/twitter_bottom_sheet.dart';
import 'package:firebase_auth_and_login/login_screen/view_model/yahoo_bottom_sheet.dart';
import 'package:firebase_auth_and_login/utils/utilities.dart';
import 'package:flutter/material.dart';

class BottomSheetLogin extends StatelessWidget {
  const BottomSheetLogin({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 70,
          width: double.infinity,
          color: Colors.transparent,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              CircleAvatar(
                backgroundColor: Colors.white,
                radius: 25,
                child: IconButton(
                  icon: googleIcon,
                  onPressed: () {
                    googleBottomSheet(context);
                  },
                ),
              ),
              CircleAvatar(
                backgroundColor: Colors.white,
                radius: 25,
                child: IconButton(
                  icon: yahooIcon,
                  onPressed: () {
                    yahooBottomSheet(context);
                  },
                ),
              ),
              CircleAvatar(
                backgroundColor: Colors.white,
                radius: 25,
                child: IconButton(
                  icon: twitterIcon,
                  onPressed: () {
                    twitterBottomSheet(context);
                  },
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
