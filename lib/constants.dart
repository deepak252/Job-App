import 'package:flutter/material.dart';

ThemeData kDarkTheme=ThemeData.dark().copyWith(
  scaffoldBackgroundColor: Color(0xff171e30),
  appBarTheme: AppBarTheme(
    backgroundColor: Color(0xff171e30),
    elevation: 0,    
  ),
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    backgroundColor: Color(0xff171e30),
  ),
  textTheme: TextTheme(
    bodyText1: TextStyle(
      fontSize: 44.0,
    ),
    bodyText2: TextStyle(
      fontSize: 13.0,
    )

  )
);
ThemeData kLightTheme=ThemeData.light();
// #171e30   //For dark theme


// https://remotive.io/api/remote-jobs