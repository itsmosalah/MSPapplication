import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:msp_ainshams/data/shared/styles/colors/colors.dart';

ThemeData darkTheme = ThemeData(
  scaffoldBackgroundColor: bgDarkColor,
  appBarTheme: AppBarTheme(
    titleSpacing: 20.0,
    systemOverlayStyle: SystemUiOverlayStyle(
      statusBarColor:bgDarkColor,
      statusBarIconBrightness: Brightness.light,
    ),
    backgroundColor: bgDarkColor,
    elevation: 0.0,
    titleTextStyle: const TextStyle(
      fontFamily: 'RailWay',
      color: Colors.white,
      fontSize: 20.0,
      fontWeight: FontWeight.bold,
    ),
    iconTheme: const IconThemeData(
      color: Colors.white,
    ),
  ),
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
      type: BottomNavigationBarType.fixed,
      elevation: 20.0,
      backgroundColor: bgDarkColor
  ),
  textTheme: const TextTheme(
    headline1: TextStyle(
        color: Colors.white,
        fontSize: 36.0,
        fontWeight: FontWeight.bold,
        fontFamily: 'RailWay'
    ),
    headline2: TextStyle(
        color: Colors.white60,
        fontSize: 13.0,
        fontWeight: FontWeight.bold,
        fontFamily: 'RailWay',
        letterSpacing: 1.5
    ),
    headline3: TextStyle(
        color: Colors.white,
        fontSize: 26.0,
        fontWeight: FontWeight.bold,
        fontFamily: 'RailWay',
        letterSpacing: 1.5
    ),
    bodyText1: TextStyle(
      fontSize: 18.0,
      fontWeight: FontWeight.w600,
      color: Colors.white,
      fontFamily: 'RailWay',
    ),
    subtitle1: TextStyle(
      fontSize: 14.0,
      fontWeight: FontWeight.w600,
      color: Colors.white,
      height: 1.3,
      fontFamily: 'RailWay',
    ),
    subtitle2: TextStyle(
      fontSize: 9.0,
      fontWeight: FontWeight.w600,
      color: Colors.black,
      height: 1.3,
    ),
  ),
  fontFamily: 'RailWay',
);

ThemeData lightTheme = ThemeData(
  scaffoldBackgroundColor: bgLightColor,
  appBarTheme: AppBarTheme(
    titleSpacing: 20.0,
    systemOverlayStyle: SystemUiOverlayStyle(
      statusBarColor: bgLightColor,
      statusBarIconBrightness: Brightness.dark,
    ),
    backgroundColor: Colors.white,
    elevation: 0.0,
    titleTextStyle:const  TextStyle(
      fontFamily: 'RailWay',
      color: Colors.black,
      fontSize: 20.0,
      fontWeight: FontWeight.bold,
    ),
    iconTheme: const IconThemeData(
      color: Colors.black,
    ),
  ),
  bottomNavigationBarTheme:const BottomNavigationBarThemeData(
    type: BottomNavigationBarType.fixed,
    elevation: 20.0,
    backgroundColor: Colors.white,
  ),
  textTheme:const  TextTheme(
    headline1: TextStyle(
        color: Colors.black,
        fontSize: 54.0,
        fontWeight: FontWeight.bold,
        fontFamily: 'RailWay'
    ),
    bodyText1: TextStyle(
      fontSize: 18.0,
      fontWeight: FontWeight.w600,
      color: Colors.black,
      fontFamily: 'RailWay',
    ),
    headline2: TextStyle(
        color: Colors.black54,
        fontSize: 13.0,
        fontWeight: FontWeight.bold,
        fontFamily: 'RailWay',
        letterSpacing: 1.5
    ),
    headline3: TextStyle(
        color: Colors.black,
        fontSize: 26.0,
        fontWeight: FontWeight.bold,
        fontFamily: 'RailWay',
        letterSpacing: 1.5
    ),
    subtitle1: TextStyle(
      fontSize: 14.0,
      fontWeight: FontWeight.w600,
      color: Colors.black,
      fontFamily: 'RailWay',
      height: 1.3,
    ),
    subtitle2: TextStyle(
      fontSize: 9.0,
      fontWeight: FontWeight.w600,
      color: Colors.black,
      fontFamily: 'RailWay',
      height: 1.3,
    ),
  ),
  fontFamily: 'RailWay',
);