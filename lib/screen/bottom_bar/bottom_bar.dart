import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
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
      backgroundColor: scaffoldBackgroundColor,
      
      appBar:  currentIndex != 1 ? AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        title: Image(
          image: AssetImage('assets/logos/Logo2.png'),
          height: 27,
          color: primaryColor,
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: CircleAvatar(
              backgroundColor: Colors.white,
              minRadius: 18,
            ),
          ),
        ],
        centerTitle: true,
      ):null,
      body: currentPage[currentIndex],
      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: scaffoldBackgroundColor,
        height: 53,
        buttonBackgroundColor: secondaryColor,
        color: secondaryColor,
        items: [
          Image(
            image: AssetImage(
              'assets/icons/home.png',
            ),
            color: currentIndex == 0 ? primaryColor : primaryTextColor,
            height: 20,
          ),
          Image(
            image: AssetImage(
              'assets/icons/search.png',
            ),
            color: currentIndex == 1 ? primaryColor : primaryTextColor,
            height: 20,
          ),
          Image(
            image: AssetImage(
              'assets/icons/download.png',
            ),
            color: currentIndex == 2 ? primaryColor : primaryTextColor,
            height: 20,
          ),
          Image(
            image: AssetImage(
              'assets/icons/profile.png',
            ),
            color: currentIndex == 3 ? primaryColor : primaryTextColor,
            height: 20,
          ),
        ],
        index: currentIndex,
        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
        },
      ),
      drawer: Drawer(
        child: Container(
          width: 270,
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(60),
              topRight: Radius.circular(60),
            ),
          ),
        ),
      ),
    );
  }
}
