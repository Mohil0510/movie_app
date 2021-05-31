import 'package:flutter/material.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart';
import 'package:movie_app/screen/bottom_bar/bottom_bar.dart';
import 'package:movie_app/screen/login_page/components/login_text_field.dart';
import 'package:movie_app/screen/register_page/register_page.dart';
import 'package:movie_app/theme_data.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: scaffoldBackgroundColor,
      resizeToAvoidBottomInset: false,
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/Login Bg.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: SingleChildScrollView(
          child: Container(
            height: MediaQuery.of(context).size.height,
            child: Padding(
              padding: const EdgeInsets.all(25),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 110,
                    width: 110,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(
                          'assets/logos/Logo.png',
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  LoginTextField(),
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
                          'LOGIN',
                          style: boldText2,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Divider(
                          color: secondaryTextColor,
                          thickness: 1.5,
                          endIndent: 10,
                        ),
                      ),
                      Text(
                        "Social Logins",
                        style: TextStyle(
                          color: primaryTextColor,
                          fontSize: 16,
                        ),
                      ),
                      Expanded(
                        child: Divider(
                          color: secondaryTextColor,
                          thickness: 1.5,
                          indent: 10,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CircleAvatar(
                        backgroundColor: primaryColor,
                        child: Image(
                          image: Svg(
                            'assets/icons/facebook.svg',
                            color: Colors.black,
                            size: Size(23, 23),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 25,
                      ),
                      CircleAvatar(
                        backgroundColor: primaryColor,
                        child: Image(
                          image: Svg(
                            'assets/icons/google.svg',
                            color: Colors.black,
                            size: Size(23, 23),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 35,
                  ),
                  Text(
                    'Don’t have an account? ',
                    style: text2,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => RegisterPage(),
                        ),
                      );
                    },
                    child: Text(
                      'REGISTER',
                      style: boldText2,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
