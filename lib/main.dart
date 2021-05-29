import 'package:flutter/material.dart';
import 'package:movie_app/screen/login_page/login_page.dart';

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
      home: LoginPage(),
    );
  }
}
