import 'package:flutter/material.dart';
class ButtonWidget {
  static Widget buildNextBtn(VoidCallback? onPressed, String buttonText) {
    return Align(
      alignment: Alignment.center,
      child: ElevatedButton(
        onPressed: onPressed,
        child: Text(
          buttonText,
          style: TextStyle(color: Colors.white, fontSize: 16),
        ),
        style: ElevatedButton.styleFrom(
          maximumSize: Size(110, 50),
          primary: Color(0xFFFFA500),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
      ),
    );
  }
}
