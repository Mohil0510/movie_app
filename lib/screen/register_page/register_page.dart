
import 'package:flutter/material.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart';
import 'package:movie_app/screen/bottom_bar/bottom_bar.dart';
import 'package:movie_app/screen/register_page/components/register_text_field.dart';
import 'package:movie_app/theme_data.dart';

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: scaffoldBackgroundColor,
      body: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          child: SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextButton.icon(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Icon(
                    Icons.arrow_back_ios_rounded,
                    color: primaryTextColor,
                    size: 20,
                  ),
                  label: Text(
                    'BACK',
                    style: boldText2,
                  ),
                ),
                Align(
                  alignment: Alignment.center,
                  child: Column(
                    children: [
                      CircleAvatar(
                        backgroundColor: secondaryColor,
                        maxRadius: 50,
                        child: Image(
                          image: Svg(
                            'assets/icons/user.svg',
                            color: primaryColor,
                            size: Size(45, 58),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        'Add profile picture',
                        style: text1,
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    children: [
                      RegisterTextField(),
                      SizedBox(
                        height: 25,
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => BottomBarPage(),
                            ),
                          );
                        },
                        child: Container(
                          height: 45,
                          width: double.infinity,
                          decoration: redContainerDecoration,
                          child: Center(
                            child: Text(
                              'REGISTER',
                              style: boldText2,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 25,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

}
