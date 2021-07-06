import 'package:flutter/material.dart';

const kCardColorDark = Color(0xff232e4a);
const kCardColorLight = Colors.white;
const kTextColorDark = Colors.white;
const kTextColorLight = Colors.black;


ThemeData kDarkTheme=ThemeData.dark().copyWith(
  scaffoldBackgroundColor: Color(0xff171e30),
  appBarTheme: AppBarTheme(
    // backgroundColor: Color(0xff171e30),
      backgroundColor: kCardColorDark,
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
ThemeData kLightTheme=ThemeData.light().copyWith(
  scaffoldBackgroundColor: Color(0xffe2e2e2),

  appBarTheme: AppBarTheme(
    backgroundColor: Colors.white,
    elevation: 0,
    textTheme:TextTheme(
      headline6: TextStyle(
         color: Colors.black
      )
    ),
    actionsIconTheme:IconThemeData(
      color: Colors.black
    ),
  ),
);

// ThemeData kLightTheme=ThemeData(
//   primarySwatch: Colors.black,
//   // primaryTextTheme: TextTheme(
//   //   headline6: TextStyle(
//   //     color: Colors.black
//   //   )
//   // )
// );
// #171e30   //For dark theme


// https://remotive.io/api/remote-jobs
