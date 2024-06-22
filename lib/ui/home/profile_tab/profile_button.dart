import 'package:flutter/material.dart';

class ProfileButton extends StatelessWidget {
  String buttonText;
  String? additionalText;
  final IconData iconData;
  Function()? onPressed;

  ProfileButton({
    super.key,
    required this.buttonText,
    this.onPressed,
    required this.iconData,
    this.additionalText, // Pass the icon data in the constructor
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
                elevation: MaterialStateProperty.all<double>(0.0),
                // Set elevation to 0
                shadowColor: MaterialStateProperty.all<Color>(
                    Colors.transparent), // Remove shadow
              ),
              onPressed: () => onPressed!(),
              child: Row(
                // Use a Row as the child
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Icon(
                        iconData,
                        color: Colors.black,
                      ),
                      const SizedBox(width: 15.0),
                      // Add a spacer between icon and text
                      Text(
                        buttonText,
                        style: const TextStyle(color: Colors.black),
                        textAlign: TextAlign.left, // Align text to the left
                      ),
                    ],
                  ), // Add the icon
                  Text(
                    additionalText ?? "0",
                    style: const TextStyle(color: Colors.black),
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
