import 'package:flutter/material.dart';

class ButtonInProfile extends StatelessWidget {
  final String text; // Variable for button text
  final Color textColor; // Variable for text color
  final Color backgroundColor; // Variable for background color
  Color? borderColor; // Variable for background color
  final Function() onPressed; // Function to execute on button press
  final double? width; // Optional variable for button width
  final double? height; // Optional variable for button height
  final IconData? icon; // Optional variable for button icon



  ButtonInProfile({
    required this.text,
    required this.textColor,
    required this.backgroundColor,
    this.borderColor,
    required this.onPressed,
    this.width, // Optional width parameter
    this.height,
    this.icon,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      //margin: const EdgeInsets.all(8),
      padding: const EdgeInsets.all(8),
      child: ElevatedButton.icon(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          minimumSize: Size(width ?? double.infinity, height ?? 50.0), // Use width if provided, otherwise full width
          //minimumSize: width != null ? Size(width!, 50.0) : const Size(double.infinity, 50.0), // Full-width button if width is null
          //minimumSize: const Size(double.infinity, 50.0), // Full-width button
          backgroundColor: backgroundColor,
          foregroundColor: textColor, //text color
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
            side: borderColor != null ? // Check if borderColor is not null
            BorderSide(color: borderColor!) : // Use null-safe operator
            BorderSide.none, // Set to no border if borderColor is null // Adjust radius as desired
          ),
        ),
        label: Text(text), // Set button text
        icon: icon != null ? Icon(icon, color: textColor) : const SizedBox(width: 0,),
      ),
    );
  }
}