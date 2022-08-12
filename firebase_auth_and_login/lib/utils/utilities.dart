import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

const Color backgroundColor = Colors.white;
const Color yahooColor = Colors.purple;

const FaIcon googleIcon = FaIcon(
  FontAwesomeIcons.google,
  size: 30,
  color: Colors.green,
);

const FaIcon yahooIcon = FaIcon(
  FontAwesomeIcons.yahoo,
  color: yahooColor,
  size: 30,
);

const FaIcon twitterIcon = FaIcon(
  FontAwesomeIcons.twitter,
  color: Colors.blue,
  size: 30,
);

String emailText = "Email";
String firstName = "First Name";
NetworkImage loginBackgroundImage = const NetworkImage(
    "https://media.istockphoto.com/vectors/abstract-contemporary-nature-background-design-summer-sale-social-vector-id1299012655?k=20&m=1299012655&s=170667a&w=0&h=6cdJ_76F2yWMEEPmkvnF2MchEk35z0W5BDfYFwPQZUY="
    // "https://cdn.pixabay.com/photo/2016/11/01/18/38/background-1789175__340.png"
    // "https://1.bp.blogspot.com/-CzSTSHoIEOo/YMEU6Jeql4I/AAAAAAAAiSE/U4-w4oxMXOkaUM7HRud21aYFyf3b0-8fgCLcBGAsYHQ/s2535/V1-DESERT-HD.png",
    );
NetworkImage homeBackgroundImage = const NetworkImage(
    "https://i.pinimg.com/736x/2f/dc/ee/2fdceea93287e90de5a16bf430a4bb36.jpg"
    // "https://cdn.pixabay.com/photo/2016/11/01/18/38/background-1789175__340.png"
    // "https://1.bp.blogspot.com/-CzSTSHoIEOo/YMEU6Jeql4I/AAAAAAAAiSE/U4-w4oxMXOkaUM7HRud21aYFyf3b0-8fgCLcBGAsYHQ/s2535/V1-DESERT-HD.png",
    );
SizedBox hSpace10 = SizedBox(
  height: 10,
);
