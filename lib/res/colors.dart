import 'package:flutter/material.dart';

// Custom colors class so if want to change the color scheme of whole app
// there is no need to go to all the widgets only change color here and color
// of the those widget which are using this color will change
class AppColor {
  // Defining static variables so these variables can be accessed without
  // creating instance of that class
  static Color white = Color.fromRGBO(255, 255, 255, 1);
  static Color black = Colors.black;
  static Color blue = Color.fromRGBO(0, 55, 255, 1);
  static Color lightBlue = Color.fromRGBO(0, 155, 255, 0.5);
  static Color skyLightBlue = Color.fromRGBO(228, 251, 245, 1.0);
  static Color skyBlue = Color.fromRGBO(147, 238, 221, 1.0);
  static Color lightMedBlue = Color.fromRGBO(110, 172, 255, 1.0);
  static Color mediumBlue = Color.fromRGBO(72, 142, 238, 1.0);
  static Color offWhite = Color.fromRGBO(230, 230, 230, 1);
  static Color yellow = Color.fromRGBO(255, 175, 0, 1);
  static Color orrange = Color.fromRGBO(255, 75, 0, 1);
  static Color red = Color.fromRGBO(255, 0, 0, 1);
  static Color black38 = Color(0XFE00000061);
  static Color black54 = Colors.black54;
  static Color black26 = Colors.black26;
  static Color white10 = Colors.white10;
  static Color whiteGrey = Colors.white54;
  static Color grey300 = Colors.grey.shade300;
  static Color grey100 = Colors.grey.shade100;
  static Color darkGreen = Color(0XFE108105);
}
