import 'package:flutter/material.dart';

class IntroTextWidget {
  static Widget buildIntroText(String title, String description, {String? spanText}) {
    return Column(
      children: [
        Text(
          title,
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        SizedBox(
          height: 20,
        ),
        Container(
          margin: EdgeInsets.symmetric(horizontal: 2),
          child: RichText(
            text: TextSpan(
              text: description,
              style: TextStyle(
                fontSize: 18,
                color: Colors.black,
              ),
              children: spanText != null
                  ? [
                TextSpan(
                  text: spanText,
                  style: TextStyle(
                    //fontWeight: FontWeight.bold,
                    color: Colors.blue, // Customize the color as needed
                  ),
                ),
              ]
                  : [],
            ),
          ),
        )
      ],
    );
  }
}
