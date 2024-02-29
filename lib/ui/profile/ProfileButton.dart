import 'package:flutter/material.dart';

class ProfileButton extends StatelessWidget {
  String buttonText;
  String routeName;
  String? additionalText;
  final IconData iconData; // Add a field to store the icon data

  ProfileButton({
    super.key,
    required this.buttonText,
    required this.routeName,
    required this.iconData,
    this.additionalText,// Pass the icon data in the constructor
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 3),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start, // Align buttons to the left
        children: [
          Expanded(
            child: ElevatedButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
                elevation: MaterialStateProperty.all<double>(0.0), // Set elevation to 0
                shadowColor: MaterialStateProperty.all<Color>(Colors.transparent), // Remove shadow
              ),
              onPressed: () => Navigator.pushNamed(context, routeName),
              child: Row(// Use a Row as the child
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Icon(iconData,
                      color: Colors.black,
                      ),
                      const SizedBox(width: 15.0), // Add a spacer between icon and text
                      Text(buttonText,
                        style: TextStyle(color: Colors.black),
                        textAlign: TextAlign.left, // Align text to the left
                      ),
                    ],
                  ), // Add the icon
                  Text(
                    additionalText ??"",
                    style: TextStyle(color: Colors.black),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
