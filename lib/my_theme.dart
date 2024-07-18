import 'package:flutter/material.dart';

class MyThemeData {
  static Color goldColor = Color.fromRGBO(182, 95, 8, 1.0);
  static Color darkColor = Color(0xFF141A2E);
  static Color blackColor = Color(0xFF242424);
  static Color whiteColor = Colors.white;
  static Color yellowColor = Color(0xFFFACC1D);

  static final ThemeData lightMode = ThemeData(
    primaryColor: goldColor,
    scaffoldBackgroundColor: Colors.transparent,
    appBarTheme: AppBarTheme(
      backgroundColor: Colors.transparent,
      elevation: 0,
      centerTitle: true,
      titleTextStyle: TextStyle(
        color: blackColor,
        fontSize: 30,
        fontWeight: FontWeight.bold,
      ),
      iconTheme: IconThemeData(
        color: blackColor,
      ),
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      selectedItemColor: whiteColor,
      unselectedItemColor: blackColor,
    ),
    textTheme: TextTheme(
      titleLarge: TextStyle(
        fontWeight: FontWeight.bold,
        color: blackColor,
      ),
    ),
  );
  static ThemeData darkMode = ThemeData(
    //primaryColor: Color(0xFFFACC1D),
    scaffoldBackgroundColor: Colors.transparent,
    appBarTheme: AppBarTheme(
      backgroundColor: Colors.transparent,
      elevation: 0,
      centerTitle: true,
      titleTextStyle: TextStyle(
        color: whiteColor,
        fontSize: 30,
        fontWeight: FontWeight.bold,
      ),
      iconTheme: IconThemeData(
        color: yellowColor,
      ),
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      selectedItemColor: yellowColor,
      unselectedItemColor: whiteColor,
    ),
    textTheme: TextTheme(
      titleLarge: TextStyle(
        //  fontSize: 30,
        fontWeight: FontWeight.bold,
        color: whiteColor,
      ),
    ),
  );
}
