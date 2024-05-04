import 'package:flutter/material.dart';

class PhoneFieldWidget {
  static Widget buildPhoneFormField(TextEditingController phoneController) {
    return Row(
      children: [
        Expanded(
          flex: 1,
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 12, vertical: 16),
            child: Text(
              generateCountryFlag() + ' +20',
              style: TextStyle(
                fontSize: 18,
                letterSpacing: 2,
              ),
            ),
          ),
        ),
        Expanded(
          flex: 2,
          child: TextFormField(
            style: TextStyle(
                height: 1,
                fontSize: 18,
                letterSpacing: 2
            ),
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.yellow,
                ),
              ),
            ),
            controller: phoneController,
            keyboardType: TextInputType.phone,
            validator: (value) {
              if (value!.isEmpty) {
                return 'please enter your phone number';
              } else if (value.length < 11) {
                return 'too short for a phone number';
              }
              return null;
            },
            onSaved: (value) {
              // phoneNumber = value!;
            },
          ),
        )
      ],
    );
  }

  static String generateCountryFlag() {
    String countryCode = 'eg';
    String flag = countryCode.toUpperCase().replaceAllMapped(
        RegExp(r'[A-z]'), (match) => String.fromCharCode(match.group(0)!.codeUnitAt(0) + 127397));
    return flag;
  }
}
