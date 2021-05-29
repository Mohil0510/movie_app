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


// class CustomTheme {
//   static ThemeData get lightTheme {
//     Color secondaryColor = Color(0xff212121);
//     return ThemeData(
//       //2
//       primaryColor: primaryColor,

//       scaffoldBackgroundColor: Color(0Xff141414),
//       textTheme: TextTheme(
        
//       ),
//     );
//   }

//   static ThemeData get darkTheme {
//     return ThemeData(
//         primaryColor: primaryColor,
//         scaffoldBackgroundColor: Colors.black,
//         fontFamily: 'Montserrat',
//         textTheme: ThemeData.dark().textTheme,
//         buttonTheme: ButtonThemeData(
//           shape:
//               RoundedRectangleBorder(borderRadius: BorderRadius.circular(18.0)),
//           buttonColor: primaryColor,
//         ));
//   }
// }

const Color scaffoldBackgroundColor = Color(0Xff141414); //black
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
  color: primaryTextColor,
  fontSize: 13,
  fontWeight: FontWeight.bold,
);

const TextStyle boldText2 = TextStyle(
  color: primaryTextColor,
  fontSize: 15,
  fontWeight: FontWeight.bold,
);


const TextStyle text1 = TextStyle(
  color: secondaryTextColor,
  fontSize: 16,
);

const TextStyle text2 = TextStyle(
  color: secondaryTextColor,
  fontSize: 15,
);
