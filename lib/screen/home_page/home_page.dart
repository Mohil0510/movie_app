import 'package:flutter/material.dart';
import 'package:movie_app/theme_data.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: scaffoldBackgroundColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        title: Image(
          image: AssetImage('assets/logos/Logo2.png'),
          height: 27,
        ),
        centerTitle: true,
      ),
      body: Container(),
      drawer: Drawer(),
    );
  }
}
