import 'package:flutter/material.dart';

const kCardColorDark = Color(0xff1c253b);
const kCardColorLight=Colors.white;


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
ThemeData kLightTheme=ThemeData.light().copyWith(
  scaffoldBackgroundColor: Color(0xffe2e2e2),

  appBarTheme: AppBarTheme(
    backgroundColor: Colors.white,
    elevation: 5,
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
