import 'package:flutter/material.dart';

class ThemeModel {
  static final ThemeData ligtTheme = ThemeData(
    primaryColor: Colors.white,
    textTheme:TextTheme(bodyLarge: TextStyle(
      color: Colors.black,
      fontSize: 18
    )) ,
    scaffoldBackgroundColor: Colors.white,
  );
  static final ThemeData drakTheme = ThemeData(
    scaffoldBackgroundColor: Colors.black,
    textTheme:TextTheme(bodyLarge: TextStyle(
      color: Colors.white,
      fontSize: 18
    )) ,
  );
}
