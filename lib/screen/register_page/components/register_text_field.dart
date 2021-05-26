import 'package:flutter/material.dart';
import 'package:movie_app/theme_data.dart';

class RegisterTextField extends StatefulWidget {
  @override
  _RegisterTextFieldState createState() => _RegisterTextFieldState();
}

class _RegisterTextFieldState extends State<RegisterTextField> {
  bool _hidePass = false;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'FIRST NAME',
          style: boldText1,
        ),
        SizedBox(
          height: 10,
        ),
        Container(
          decoration: greyContainerDecoration,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: TextFormField(
              keyboardType: TextInputType.name,
              cursorColor: primaryColor,
              style: TextStyle(
                color: secondaryTextColor,
              ),
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: 'first name here',
                hintStyle: text1,
              ),
            ),
          ),
        ),
        SizedBox(
          height: 25,
        ),
        Text(
          'LAST NAME',
          style: boldText1,
        ),
        SizedBox(
          height: 10,
        ),
        Container(
          decoration: greyContainerDecoration,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: TextFormField(
              keyboardType: TextInputType.name,
              cursorColor: primaryColor,
              style: TextStyle(
                color: secondaryTextColor,
              ),
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: 'last name here',
                hintStyle: text1,
              ),
            ),
          ),
        ),
        SizedBox(
          height: 25,
        ),
        Text(
          'EMAIL',
          style: boldText1,
        ),
        SizedBox(
          height: 10,
        ),
        Container(
          decoration: greyContainerDecoration,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: TextFormField(
              keyboardType: TextInputType.emailAddress,
              cursorColor: primaryColor,
              style: TextStyle(
                color: secondaryTextColor,
              ),
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: 'email here',
                hintStyle: text1,
              ),
            ),
          ),
        ),
        SizedBox(
          height: 25,
        ),
        Text(
          'PASSWORD',
          style: boldText1,
        ),
        SizedBox(
          height: 10,
        ),
        Container(
          decoration: greyContainerDecoration,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: TextFormField(
              keyboardType: TextInputType.emailAddress,
              cursorColor: primaryColor,
              style: TextStyle(
                color: secondaryTextColor,
              ),
              obscureText: _hidePass,
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: 'password here',
                hintStyle: text1,
                suffixIcon: GestureDetector(
                  child: Icon(
                    _hidePass ? Icons.lock_open : Icons.lock_outline,
                    color: Colors.grey,
                    size: 23,
                  ),
                  onLongPress: () => {
                    setState(() => _hidePass = false),
                  },
                  onLongPressEnd: (_) {
                    setState(() => _hidePass = true);
                  },
                ),
              ),
            ),
          ),
        ),
        SizedBox(
          height: 25,
        ),
        Text(
          'CONFIRM PASSWORD',
          style: boldText1,
        ),
        SizedBox(
          height: 10,
        ),
        Container(
          decoration: greyContainerDecoration,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: TextFormField(
              keyboardType: TextInputType.emailAddress,
              cursorColor: primaryColor,
              style: TextStyle(
                color: secondaryTextColor,
              ),
              obscureText: _hidePass,
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: 'confirm password here',
                hintStyle: text1,
                suffixIcon: GestureDetector(
                  child: Icon(
                    _hidePass ? Icons.lock_open : Icons.lock_outline,
                    color: Colors.grey,
                    size: 23,
                  ),
                  onLongPress: () => {
                    setState(() => _hidePass = false),
                  },
                  onLongPressEnd: (_) {
                    setState(() => _hidePass = true);
                  },
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
