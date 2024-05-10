import 'package:flutter/material.dart';

class ProfileButtonNotification extends StatelessWidget {
  final String buttonText;
  final String routeName;
  final IconData iconData; // Add a field to store the icon data
  final String additionalText; // Add a field to store the additional text

  ProfileButtonNotification({
    super.key,
    required this.buttonText,
    required this.routeName,
    required this.iconData, // Pass the icon data in the constructor
    required this.additionalText, // Pass the additional text
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 3),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Expanded(
            child: ElevatedButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
                elevation: MaterialStateProperty.all<double>(0.0),
                shadowColor:
                    MaterialStateProperty.all<Color>(Colors.transparent),
              ),
              onPressed: () => Navigator.pushNamed(context, routeName),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                // Use a Row as the child
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
                  ),
                  // Add the icon

                  //const SizedBox(width: 160.0), // Add a spacer between icon and text
                  Container(
                    alignment: Alignment.center,
                    padding: const EdgeInsets.all(6.0),
                    // Add padding for content
                    decoration: const BoxDecoration(
                      color: Colors.red, // Set background color to red
                      shape: BoxShape.circle, // Set the shape to circle
                    ),
                    child: Text(
                      additionalText,
                      //textAlign: ,
                      style: const TextStyle(
                        color: Colors.white, // Set text color to white
                        fontSize: 12.0, // Adjust font size as needed
                      ),
                    ),
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
