import 'package:flutter/material.dart';

import '../../../theme_data.dart';

class LoginTextField extends StatefulWidget {
  @override
  _LoginTextFieldState createState() => _LoginTextFieldState();
}

class _LoginTextFieldState extends State<LoginTextField> {
  bool _hidePass = false;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
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
      ],
    );
  }
}
