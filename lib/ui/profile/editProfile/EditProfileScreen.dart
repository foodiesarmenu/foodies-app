
import 'package:flutter/material.dart';
import 'package:foodies_app/ui/profile/ProfileScreen.dart';

import '../../../validation_utils.dart';
import '../../common/form_input_field.dart';

enum Gender { male, female } // Define the gender options

class EditProfileScreen extends StatefulWidget {
  static const String routeName = 'edit-profile';
  const EditProfileScreen({super.key});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  TextEditingController fullNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController genderController = TextEditingController();
  TextEditingController birthDateController = TextEditingController();
  TextEditingController bioController = TextEditingController();
  var formKey = GlobalKey<FormState>();

  //date
  DateTime? selectedDate;
  DateTime date = DateTime.now();
  Future<void> selectedTimePicker(BuildContext context) async {
    final DateTime? pickedDate  =   await showDatePicker(context: context,
      initialDate: selectedDate ?? DateTime.now(),
      firstDate: DateTime(1900, 1),
      lastDate: DateTime.now(),
    );
    if (pickedDate != null) {
      selectedDate = pickedDate;
      birthDateController.text =
      "${pickedDate.day}/${pickedDate.month}/${pickedDate.year}";
    }
  }
  //gender
  Gender selectedGender = Gender.male; // Initially selected gender

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:const Text('Edit Profile'),
        centerTitle: true, // Center the title for a balanced look
      ),
      body: SingleChildScrollView(
        child: Form(
          key: formKey,
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start, // Align content to the left
              children: [
                Stack(
                  //alignment: Alignment.center, // Center the Stack within its parent
                  children: [
                    const CircleAvatar(
                      radius: 50.0,
                      backgroundImage: AssetImage('assets/images/7oda.png'), // Replace with your asset path
                    ),
                    Positioned(
                      height: 40,
                      width: 40,
                      bottom: 0.0,
                      right: 0.0,
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.grey[200], // Light grey background
                          shape: BoxShape.circle,
                        ),
                        child: Container(
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                              width: 2,
                              color: Colors.grey,
                            ),

                          ),
                          child: IconButton(
                            icon: const Icon(Icons.edit,
                            color: Colors.grey,), // Edit icon
                            onPressed: () {
                              // Handle image selection or camera functionality
                            },
                            iconSize: 18.0,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),//profile photo
                const SizedBox(height: 20.0), // Space between sections
                FormInputField(
                  controller: fullNameController,
                  label: 'Full Name',
                  hint: 'Mahmoud Hossam',
                  validator: (text) {
                    if (text == null || text.trim().isEmpty) {
                      return 'Please enter full name';
                    }
                    return null;
                  },
                ),
                FormInputField(
                    controller: emailController,
                    label: 'Email',
                    hint: 'mahmoud77mezo@gmail.com',
                    keyboardType: TextInputType.emailAddress,
                    validator: (text) {
                      if (text == null || text.trim().isEmpty) {
                        return 'Please enter full name';
                      }
                      if (!ValidationUtils.isValidEmail(text)) {
                        return 'Please enter valid email';
                      }
                      return null;
                    }),
                FormInputField(
                  controller: phoneController,
                  label: 'Phone',
                  hint: '+20 1143327364',
                  keyboardType: TextInputType.number,
                  validator: (text) {
                    if (text == null || text.trim().isEmpty) {
                      return 'Please enter full name';
                    }
                    if (text.length < 9) {
                      return 'Please enter valid phone number';
                    }
                    return null;
                  },
                ),
                Row(
                  children: [
                    Text('Gender',style: TextStyle(
                        fontSize: 14,
                        color: Colors.black
                    ),),
                    Radio<Gender>(
                      value: Gender.male,
                      groupValue: selectedGender,
                      onChanged: (Gender? value) {
                        if (value != null) {
                          setState(() => selectedGender = value);
                        }
                      },                    ),
                    Text('Male',style: TextStyle(
                        fontSize: 14,
                        color: Colors.black
                    ),),
                    SizedBox(width: 10.0),
                    Radio<Gender>(
                      value: Gender.female,
                      groupValue: selectedGender,
                      onChanged: (Gender? value) {
                        if (value != null) {
                          setState(() => selectedGender = value);
                        }
                      },                    ),
                    Text('Female',style: TextStyle(
                        fontSize: 14,
                        color: Colors.black
                    ),),
                  ],
                ),//Gender Selection
                Row(
                  children: [
                    Expanded(
                      child: FormInputField(
                        controller: birthDateController,
                        keyboardType: TextInputType.datetime,
                        label: 'Birth-Date',
                        hint: selectedDate != null
                            ? "${selectedDate!.day}/${selectedDate!.month}/${selectedDate!.year}"
                            : 'DD/MM/YYYY',
                        validator: (text) {
                          if (text == null || text.trim().isEmpty) {
                            return 'Please enter your birth date';
                          }
                          return null;
                        },
                      ),
                    ),
                    const SizedBox(width: 10.0),
                    IconButton(
                      icon: const Icon(Icons.calendar_today, color: Color(0xFFFFA500),),
                      onPressed: () => selectedTimePicker(context),
                    ),
                  ],
                ),//Birth date
               const SizedBox(height: 10.0), // Space before the button
                ElevatedButton(
                  onPressed: editAccount,
                  style: ElevatedButton.styleFrom(
                    minimumSize: const Size(double.infinity, 50.0), // Full-width button
                  ),
                  child:const Text('Save'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void editAccount() {
    if (formKey.currentState?.validate() == false) {
      return;
    }
    Navigator.of(context).pushNamed(ProfileScreen.routeName);
  }
}
