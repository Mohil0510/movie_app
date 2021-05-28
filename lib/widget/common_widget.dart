import 'package:flutter/material.dart';
import 'package:movie_app/theme_data.dart';

class CommonWidget {
  static Widget category({
    String categoryname,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            '$categoryname',
            style: TextStyle(
              color: primaryTextColor,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          TextButton(
            onPressed: () {},
            child: Text(
              'View all',
              style: TextStyle(
                color: primaryColor,
                fontSize: 16,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
