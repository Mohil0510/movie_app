import 'package:flutter/material.dart';

// class GlobalData {
//   static ThemeData themeData = ThemeData(
//     scaffoldBackgroundColor: Colors.grey,
//     primaryColor: Colors.teal,
//     textTheme: TextTheme(
//       bodyText2: TextStyle(color: Colors.black),
//     ),
//   );

//   static ThemeData darkThemeData = ThemeData(
//     scaffoldBackgroundColor: Color(0XffFFFFFF),
//     primaryColor: Color(0xffFF1900),
//     textTheme: TextTheme(
//       bodyText1: TextStyle(color: Colors.black),
//     ),
//   );

//   static ThemeMode themeMode = ThemeMode.dark;
// }

const Color scaffoldBackgroundColor = Color(0Xff000000); //black
const Color primaryColor = Color(0xffFF1900); //red
const Color secondaryColor = Color(0xff212121); //dark grey
const Color primaryTextColor = Color(0xffFFFFFF); //white
const Color secondaryTextColor = Color(0XffA2A2A2); //light grey

const Decoration redContainerDecoration = BoxDecoration(
  color: primaryColor,
  borderRadius: BorderRadius.all(
    Radius.circular(10),
  ),
);
const Decoration greyContainerDecoration = BoxDecoration(
  color: secondaryColor,
  borderRadius: BorderRadius.all(
    Radius.circular(13),
  ),
);

const TextStyle boldText1 = TextStyle(
  color: Color(0xffFFFFFF),
  fontSize: 13,
  fontWeight: FontWeight.bold,
);

const TextStyle boldText2 = TextStyle(
  color: Color(0xffFFFFFF),
  fontSize: 15,
  fontWeight: FontWeight.bold,
);

const TextStyle text1 = TextStyle(
  color: Color(0XffA2A2A2),
  fontSize: 16,
);

const TextStyle text2 = TextStyle(
  color: Color(0XffA2A2A2),
  fontSize: 15,
);
