import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart';
import 'package:movie_app/screen/downlode_page/downlode_page.dart';
import 'package:movie_app/screen/home_page/home_page.dart';
import 'package:movie_app/screen/profile_page/profile_page.dart';
import 'package:movie_app/screen/search_page/search_page.dart';
import 'package:movie_app/theme_data.dart';

class BottomBarPage extends StatefulWidget {
  @override
  _BottomBarPageState createState() => _BottomBarPageState();
}

class _BottomBarPageState extends State<BottomBarPage> {
  int currentIndex = 0;

  List<Widget> currentPage = [
    HomePage(),
    SearchPage(),
    DownlodePage(),
    ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: currentPage[currentIndex],
      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: scaffoldBackgroundColor,
        height: 53,
        buttonBackgroundColor: secondaryColor,
        color: secondaryColor,
        items: [
          Image(
            image: Svg(
              'assets/icons/home.svg',
              color: currentIndex == 0 ? primaryTextColor : secondaryColor,
              size: Size(20, 20),
            ),
          ),
          Image(
            image: Svg(
              'assets/icons/search.svg',
              color: primaryTextColor,
              size: Size(20, 20),
            ),
          ),
          Image(
            image: Svg(
              'assets/icons/download.svg',
              color: primaryTextColor,
              size: Size(20, 20),
            ),
          ),
          Image(
            image: Svg(
              'assets/icons/profile.svg',
              color: primaryTextColor,
              size: Size(20, 20),
            ),
          ),
  
        ],
        index: currentIndex,
        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
        },
      ),
    );
  }
}
