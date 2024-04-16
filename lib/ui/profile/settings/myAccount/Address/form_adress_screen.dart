import 'package:flutter/material.dart';
import 'package:foodies_app/ui/common/EditTextInProfile.dart';

import '../../../../common/ButtonInProfile.dart';
import '../../../../common/custom_app_bar.dart';
import 'add_address.dart';

class FormAddressScreen extends StatefulWidget {
  static const String routeName = "FormAddressScreen";
   FormAddressScreen({super.key});

  @override
  State<FormAddressScreen> createState() => _FormAddressScreenState();
}

class _FormAddressScreenState extends State<FormAddressScreen> {
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController firstAddressController = TextEditingController();
  TextEditingController secondAddressController = TextEditingController();
  TextEditingController buildingNoController = TextEditingController();
  TextEditingController streetNameController = TextEditingController();
  TextEditingController floorNoController = TextEditingController();
  TextEditingController apartmentNoController = TextEditingController();
  TextEditingController othersController = TextEditingController();

  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar.buildAppBar(context, 'Confirm address'),
      body: ListView(
        children: [
          Form(
            key: formKey,
            child: Container(
              padding: const EdgeInsets.all(12),
              child: Column(
                children: [
                  EditTextInProfile(
                    keyboardType: TextInputType.phone,
                    isTextFieldEnabled: false,
                    controller: phoneNumberController,
                    label: 'Phone Number',
                    hint: '01xxxxxxxx',
                    isSecured: false,
                    /*validator: (text) {
                      if (text == null || text.trim().isEmpty) {
                        return 'Please enter phone number';
                      }
                      /*if (!ValidationUtils.isValidEmail(text)) {
                  return 'Please enter valid email';
                }*/
                      return null;
                    },*/
                  ),
                  EditTextInProfile(
                    keyboardType: TextInputType.text,
                    isTextFieldEnabled: true,
                    controller: firstAddressController,
                    label: 'first address',
                    hint: 'cairo..',
                    isSecured: false,
                    validator: (text) {
                      if (text == null || text.trim().isEmpty) {
                        return 'Please enter first address';
                      }
                      return null;
                    },
                  ),
                  EditTextInProfile(
                    keyboardType: TextInputType.emailAddress,
                    isTextFieldEnabled: true,
                    controller: secondAddressController,
                    label: 'Second Address',
                    hint: 'Al haram...',
                    isSecured: false,
                    validator: (text) {
                      if (text == null || text.trim().isEmpty) {
                        return 'Please enter Second Address';
                      }
                      return null;
                    },
                  ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      EditTextInProfile(
                        keyboardType: TextInputType.number,
                        isTextFieldEnabled: true,
                        controller: buildingNoController,
                        label: 'Building Number',
                        hint: 'Building 9',
                        width: 160, // Specify the width here
                        isSecured: false,
                        validator: (text) {
                          if (text == null || text.trim().isEmpty) {
                            return 'Please enter building Number';
                          }
                          return null;
                        },
                      ),
                      EditTextInProfile(
                        keyboardType: TextInputType.number,
                        isTextFieldEnabled: true,
                        controller: streetNameController,
                        label: 'Street Number',
                        hint: 'optional',
                        width: 160, // Specify the width here
                        isSecured: false,
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      EditTextInProfile(
                        keyboardType: TextInputType.number,
                        isTextFieldEnabled: true,
                        controller: floorNoController,
                        label: 'Floor Number',
                        hint: 'Floor 9',
                        width: 160, // Specify the width here
                        isSecured: false,
                        validator: (text) {
                          if (text == null || text.trim().isEmpty) {
                            return 'Please enter Floor Number';
                          }
                          return null;
                        },
                      ),
                      EditTextInProfile(
                        keyboardType: TextInputType.number,
                        isTextFieldEnabled: true,
                        controller: apartmentNoController,
                        label: 'Apartment Number',
                        hint: 'optional',
                        width: 160, // Specify the width here
                        isSecured: false,
                      ),
                    ],
                  ),
                  EditTextInProfile(
                    keyboardType: TextInputType.text,
                    isTextFieldEnabled: true,
                    controller: othersController,
                    label: 'Anything else',
                    hint: 'optional',
                    isSecured: false,
                  ),
                  const SizedBox(height: 10.0), // Space before the button
                  ButtonInProfile(
                    backgroundColor: Theme.of(context).primaryColor,
                    textColor: Colors.white,
                    text: 'Save Address',
                    onPressed: () {
                      checkPass();
                      //Navigator.of(context).pushNamed(AddAddress.routeName);
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),

    );
  }
void checkPass() {
    if (formKey.currentState?.validate() == false) {
      return;
    }
    Navigator.of(context).pushNamed(AddAddress.routeName);
  }
}
