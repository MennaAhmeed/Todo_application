import 'package:flutter/material.dart';

class MyThemeData{
  static const colorBlack=Colors.black;
  static const colorWhite=Colors.white;
  static const colorBlue =Colors.blue;

  static var lightTheme=ThemeData(
    primaryColor: colorBlue,
    scaffoldBackgroundColor: Colors.transparent,
    appBarTheme: AppBarTheme(
      iconTheme: IconThemeData(
        color: colorBlack,
      ),
      color: Colors.transparent,
      elevation: 0,

    ),
    textTheme: TextTheme(
      subtitle1: TextStyle(
          fontSize: 25,
          color: colorWhite,
        fontWeight: FontWeight.bold,
      ),
      headline1: TextStyle(
        fontSize: 30,
        color: colorBlack,
        fontWeight: FontWeight.bold,
      ),
      bodyText1: TextStyle(
        fontSize: 24,
        color: colorBlack,
      ),
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: colorWhite,
      selectedItemColor:colorBlue,
    ),
  );

  static var darkTheme=ThemeData(
    primaryColor: colorBlack,
    scaffoldBackgroundColor: Colors.transparent,
    appBarTheme: AppBarTheme(
      iconTheme: IconThemeData(
        color: colorWhite,
      ),
      color: Colors.transparent,
      elevation: 0,

    ),
    textTheme: TextTheme(
      subtitle1: TextStyle(
        fontSize: 24,
        color: colorWhite,
      ),
      headline1: TextStyle(
        fontSize: 30,
        color: colorWhite,
        fontWeight: FontWeight.bold,
      ),
      bodyText1: TextStyle(
        fontSize: 24,
        color: colorWhite,
      ),
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: colorBlack,
      selectedItemColor: colorBlack,
      unselectedItemColor: Colors.white,
    ),
  );
}