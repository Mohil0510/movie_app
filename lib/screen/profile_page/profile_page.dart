import 'package:flutter/material.dart';
import 'package:movie_app/theme_data.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: scaffoldBackgroundColor,
      body: Container(
        child: SafeArea(
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
                    child: Center(
                      child: Icon(
                        Icons.camera_alt_outlined,
                        color: secondaryTextColor,
                        size: 50,
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
                  GestureDetector(
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
                  // Align(
                  //   alignment: Alignment.center,
                  //   child: Container(
                  //     height: 40,
                  //     width: 180,
                  //     alignment: Alignment.center,
                  //     decoration: BoxDecoration(
                  //       color: primaryColor,
                  //       borderRadius: BorderRadius.all(
                  //         Radius.circular(20),
                  //       ),
                  //     ),
                  //     child: Row(
                  //       mainAxisAlignment: MainAxisAlignment.center,
                  //       children: [
                  //         Image(
                  //           image: AssetImage('assets/icons/off.png'),
                  //           height: 17,
                  //         ),
                  //         SizedBox(
                  //           width: 7,
                  //         ),
                  //         Text(
                  //           'Sign Out',
                  //           style: boldText2,
                  //         ),
                  //       ],
                  //     ),
                  //   ),
                  // ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
