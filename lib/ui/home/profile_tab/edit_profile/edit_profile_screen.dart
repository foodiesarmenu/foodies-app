import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodies_app/ui/common/button_in_profile.dart';
import 'package:foodies_app/ui/common/custom_app_bar.dart';

import '../../../../di/di.dart';
import '../../../common/form_input_field.dart';
import '../../../utils/validation_utils.dart';
import '../profile_tab.dart';
import 'cubit/edit_profile_states.dart';
import 'cubit/edit_profile_view_model.dart';

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
    final DateTime? pickedDate = await showDatePicker(
      context: context,
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

  var viewModel = getIt<EditProfileViewModel>();

  @override
  void initState() {
    viewModel..getProfileData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<EditProfileViewModel, EditProfileStates>(
      bloc: viewModel,
      builder: (context, state) {
        return (state is GetProfileDataSuccessState)
            ? Scaffold(
                appBar: CustomAppBar.buildAppBar(context, 'Edit Profile'),
                body: SingleChildScrollView(
                  child: Form(
                    key: formKey,
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        children: [
                          Stack(
                            children: [
                              Container(
                                width: 130,
                                height: 130,
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    width: 3,
                                    color: Theme.of(context)
                                        .scaffoldBackgroundColor,
                                  ),
                                  boxShadow: [
                                    BoxShadow(
                                      spreadRadius: 2,
                                      blurRadius: 10,
                                      color: Colors.black.withOpacity(0.1),
                                      offset: Offset(0, 10),
                                    ),
                                  ],
                                  shape: BoxShape.circle,
                                  image: const DecorationImage(
                                      fit: BoxFit.cover,
                                      image:
                                          AssetImage('assets/images/7oda.png')),
                                ),
                              ),
                              Positioned(
                                height: 40,
                                width: 40,
                                bottom: 0,
                                right: 0,
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: Theme.of(context)
                                        .primaryColor, // Light grey background
                                    shape: BoxShape.circle,
                                  ),
                                  child: Container(
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      border: Border.all(
                                        width: 3,
                                        color: Colors.white,
                                      ),
                                    ),
                                    child: IconButton(
                                      icon: const Icon(
                                        Icons.edit,
                                        color: Colors.white,
                                      ), // Edit icon
                                      onPressed: () {},
                                      iconSize: 18.0,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ), //profile photo
                          const SizedBox(
                              height: 20.0), // Space between sections
                          FormInputField(
                            controller: fullNameController,
                            label: 'Full Name',
                            hint: state.user.name ?? 'Yehya Gamal',
                            validator: (text) {
                              if (text == null || text.trim().isEmpty) {
                                return 'Please enter full name';
                              }
                              return null;
                            },
                            isPassword: false,
                            isEmail: false,
                          ),
                          FormInputField(
                              isPassword: false,
                              isEmail: false,
                              controller: emailController,
                              label: 'Email',
                              hint: state.user.email ?? 'yungy@gmail.com',
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
                            isPassword: false,
                            isEmail: false,
                            controller: phoneController,
                            label: 'Phone',
                            hint: state.user.phoneNumber ?? '01000000000',
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
                              Text(
                                'Gender ',
                                style: TextStyle(
                                    fontSize: 14, color: Colors.black),
                              ),
                              Radio<Gender>(
                                value: Gender.male,
                                groupValue: selectedGender,
                                onChanged: (Gender? value) {
                                  if (value != null) {
                                    setState(() => selectedGender = value);
                                  }
                                },
                              ),
                              Text(
                                'Male',
                                style: TextStyle(
                                    fontSize: 14, color: Colors.black),
                              ),
                              SizedBox(width: 10.0),
                              Radio<Gender>(
                                value: Gender.female,
                                groupValue: selectedGender,
                                onChanged: (Gender? value) {
                                  if (value != null) {
                                    setState(() => selectedGender = value);
                                  }
                                },
                              ),
                              Text(
                                'Female',
                                style: TextStyle(
                                    fontSize: 14, color: Colors.black),
                              ),
                            ],
                          ), //Gender Selection
                          Row(
                            children: [
                              Expanded(
                                child: FormInputField(
                                  isPassword: false,
                                  isEmail: false,
                                  controller: birthDateController,
                                  keyboardType: TextInputType.datetime,
                                  label: 'Birth-Date',
                                  hint: state.user.dateOfBirth != null
                                      ? '${state.user.dateOfBirth}'
                                      : 'DD/MM/YYYY',
                                  validator: (text) {
                                    if (text == null || text.trim().isEmpty) {
                                      return 'Please enter your birth date';
                                    }
                                    return null;
                                  },
                                ),
                              ),
                              //const SizedBox(width: 10.0),
                              IconButton(
                                icon: const Icon(
                                  Icons.calendar_today,
                                  color: Color(0xFFFFA500),
                                ),
                                onPressed: () => selectedTimePicker(context),
                              ),
                            ],
                          ), //Birth date
                          const SizedBox(
                              height: 10.0), // Space before the button
                          /*ElevatedButton(
                    onPressed: editAccount,
                    style: ElevatedButton.styleFrom(
                      minimumSize: const Size(double.infinity, 50.0), // Full-width button
                    ),
                    child:const Text('Save'),
                  ),*/
                          Row(
                            children: [
                              Expanded(
                                child: ButtonInProfile(
                                    //width: 60,
                                    borderColor: Theme.of(context).primaryColor,
                                    text: 'Cancel',
                                    textColor: Theme.of(context).primaryColor,
                                    backgroundColor: Colors.white,
                                    onPressed: () {
                                      Navigator.pop(context);
                                    }),
                              ),
                              Expanded(
                                child: ButtonInProfile(
                                    // width: 60,
                                    text: 'Save',
                                    textColor: Colors.white,
                                    backgroundColor:
                                        Theme.of(context).primaryColor,
                                    onPressed: () {
                                      Navigator.pop(context);
                                    }),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              )
            : Scaffold(body: const Center(child: CircularProgressIndicator()));
      },
    );
  }

  void editAccount() {
    if (formKey.currentState?.validate() == false) {
      return;
    }
    Navigator.of(context).pushNamed(ProfileTab.routeName);
  }
}
