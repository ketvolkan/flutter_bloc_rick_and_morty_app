import 'package:flutter/material.dart';

mixin ColorTable {
  static Color scaffoldBackgroundColor = const Color.fromARGB(255, 55, 0, 113);
  static Color errorColor = Colors.red[400]!;
  static Color errorColorLight = const Color.fromRGBO(254, 221, 229, 1);
  static Color successColorLight = const Color.fromRGBO(213, 251, 224, 1);
  static Color successColor = const Color.fromARGB(255, 22, 148, 58);
  static Color get getBlackTextColor => Colors.black;
  static Color primaryColor = const Color.fromARGB(255, 231, 53, 255);
  static Color primaryColorDark = const Color.fromARGB(255, 205, 16, 202);
  static Color primaryColorLight = const Color.fromARGB(31, 255, 145, 251);
  static Color fabButtonColor = const Color.fromARGB(255, 221, 151, 213);
  static Color getTextColor(BuildContext context) =>
      MediaQuery.of(context).platformBrightness != Brightness.dark ? Colors.white : const Color.fromARGB(255, 107, 107, 107);
  static Color getReversedTextColor(BuildContext context) =>
      MediaQuery.of(context).platformBrightness != Brightness.dark ? Colors.black : Colors.white;
}
