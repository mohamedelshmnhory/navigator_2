import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'colors.dart';

ThemeData lightTheme = ThemeData(
  // accentColor: mainColor,
  colorScheme: ColorScheme.fromSwatch().copyWith(
    secondary: mainColor, // Your accent color
  ),
  scaffoldBackgroundColor: Colors.white,
  canvasColor: Colors.white,
  appBarTheme: const AppBarTheme(
    backgroundColor: mainColor,
    titleSpacing: 20.0,
    systemOverlayStyle: SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
      systemNavigationBarColor: Colors.black, // navigation bar color
    ),
    elevation: 0.0,
    titleTextStyle: TextStyle(
      color: Colors.white,
      fontSize: 16.0,
      fontWeight: FontWeight.bold,
      fontFamily: 'cairo',
    ),
    iconTheme: IconThemeData(
      color: mainColor,
    ),
  ),
  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
    showUnselectedLabels: false,
    type: BottomNavigationBarType.fixed,
    selectedItemColor: mainColor,
    elevation: 5,
    // selectedItemColor: Colors.white,
    unselectedItemColor: Colors.white,
    backgroundColor: Colors.transparent,
  ),
  textTheme: const TextTheme(
    headline3: TextStyle(
      color: mainColor,
      fontSize: 11,
      fontWeight: FontWeight.bold,
    ),
    headline4: TextStyle(
      color: mainColor,
      fontSize: 20,
      fontFamily: 'HACEN-SAMRA',
    ),
    headline5: TextStyle(
      fontSize: 18.0,
      fontWeight: FontWeight.bold,
      color: mainColor,
    ),
    headline2: TextStyle(
      fontSize: 14.0,
      fontWeight: FontWeight.bold,
      color: mainColor,
    ),
    bodyText1: TextStyle(
      fontSize: 16.0,
      fontWeight: FontWeight.bold,
      color: CupertinoColors.white,
    ),
  ),
  iconTheme: const IconThemeData(color: mainColor),
  fontFamily: 'cairo',
);
