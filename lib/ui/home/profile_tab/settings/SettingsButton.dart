import 'package:flutter/material.dart';

class SettingsButton extends StatelessWidget {
  String buttonText;
  String routeName;
  String? additionalText;
  final IconData iconData;
  IconData? righticon;
  final Color itemColor; // Add a field to store the item color
  Function? onPressed;

  SettingsButton(
      {super.key,
      required this.buttonText,
      required this.routeName,
      required this.iconData,
      this.additionalText,
      this.righticon,
      required this.itemColor,
      this.onPressed // Pass the color in the constructor
      });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 3),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Expanded(
            child: ElevatedButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
                elevation: MaterialStateProperty.all<double>(0.0),
                shadowColor:
                    MaterialStateProperty.all<Color>(Colors.transparent),
              ),
              onPressed: () {
                onPressed != null
                    ? onPressed!()
                    : Navigator.pushNamed(context, routeName);
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Icon(iconData, color: itemColor),
                      // Use the itemColor for icon
                      const SizedBox(width: 15.0),
                      Text(
                        buttonText,
                        style: TextStyle(color: itemColor),
                        // Use itemColor for text
                        textAlign: TextAlign.left,
                      ),
                      const SizedBox(width: 8),
                      Text(
                        additionalText ?? "",
                        style: TextStyle(color: Colors.grey),
                      ),
                    ],
                  ),
                  Icon(righticon, color: Colors.black, size: 24),
                  // Use itemColor for right icon
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
