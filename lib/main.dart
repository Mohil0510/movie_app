import 'package:flutter/material.dart';
import 'package:movie_app/screen/bottom_bar/bottom_bar.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // theme: GlobalData.themeData,
      // darkTheme: GlobalData.darkThemeData,
      // themeMode: GlobalData.themeMode,
      home: BottomBarPage(),
    );
  }
}
