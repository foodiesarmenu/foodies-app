import 'package:flutter/material.dart';

class ButtonInProfile extends StatelessWidget {
  final String text; // Variable for button text
  final Color textColor; // Variable for text color
  final Color backgroundColor; // Variable for background color
  Color? borderColor; // Variable for background color
  final Function() onPressed; // Function to execute on button press
  final double? width; // Optional variable for button width

  ButtonInProfile({
    required this.text,
    required this.textColor,
    required this.backgroundColor,
    this.borderColor,
    required this.onPressed,
    this.width, // Optional width parameter
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(8),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          minimumSize: width != null ? Size(width!, 50.0) : const Size(double.infinity, 50.0), // Full-width button if width is null
          backgroundColor: backgroundColor,
          foregroundColor: textColor, //text color
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16.0),
            side: borderColor != null ? BorderSide(color: borderColor!) : BorderSide.none, // Set to no border if borderColor is null
          ),
        ),
        child: Text(text), // Set button text
      ),
    );
  }
}
