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
      appBar: currentIndex != 1
          ? AppBar(
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
            )
          : null,
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
      drawer: Container(
        width: 270,
        child: Drawer(
          child: Container(
            color: scaffoldBackgroundColor,
            child: SafeArea(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      height: 140,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: secondaryColor,
                        shape: BoxShape.circle,
                        border: Border.all(
                          width: 3,
                          color: primaryColor,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Mohil Thummar',
                          style: TextStyle(
                            color: primaryTextColor,
                            fontSize: 23,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        // IconButton(
                        //   onPressed: () {},
                        //   icon: Icon(Icons.edit),
                        //   color: primaryTextColor,
                        //   iconSize: 25,
                        // ),
                      ],
                    ),
                    SizedBox(
                      height: 40,
                    ),
                    InkWell(
                      onTap: () {},
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 17),
                            child: Image(
                              image: AssetImage('assets/icons/profile.png'),
                              height: 20,
                              color: primaryTextColor,
                            ),
                          ),
                          Text(
                            'Account',
                            style: text3,
                          )
                        ],
                      ),
                    ),
                    Divider(
                      color: Colors.white24,
                      thickness: 1.5,
                      height: 30,
                      endIndent: 20,
                    ),
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 17),
                          child: Image(
                            image: AssetImage('assets/icons/notification.png'),
                            height: 20,
                            color: primaryTextColor,
                          ),
                        ),
                        Text(
                          'Notifications',
                          style: text3,
                        )
                      ],
                    ),
                    Divider(
                      color: Colors.white24,
                      thickness: 1.5,
                      height: 30,
                      endIndent: 20,
                    ),
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 17),
                          child: Image(
                            image: AssetImage('assets/icons/settings.png'),
                            height: 20,
                            color: primaryTextColor,
                          ),
                        ),
                        Text(
                          'Settings',
                          style: text3,
                        )
                      ],
                    ),
                    Divider(
                      color: Colors.white24,
                      thickness: 1.5,
                      height: 30,
                      endIndent: 20,
                    ),
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 17),
                          child: Image(
                            image: AssetImage('assets/icons/information.png'),
                            height: 20,
                            color: primaryTextColor,
                          ),
                        ),
                        Text(
                          'Help',
                          style: text3,
                        )
                      ],
                    ),
                    Divider(
                      color: Colors.white24,
                      thickness: 1.5,
                      height: 30,
                      endIndent: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: Text(
                        'Privacy Policy',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.white38,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 40,
                    ),
                    Align(
                      alignment: Alignment.center,
                      child: Container(
                        height: 40,
                        width: 180,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: primaryColor,
                          borderRadius: BorderRadius.all(
                            Radius.circular(20),
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image(
                              image: AssetImage('assets/icons/off.png'),
                              height: 17,
                            ),
                            SizedBox(
                              width: 7,
                            ),
                            Text(
                              'Sign Out',
                              style: boldText2,
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
