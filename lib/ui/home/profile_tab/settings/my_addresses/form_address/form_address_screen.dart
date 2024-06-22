import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodies_app/ui/common/edit_text_in_profile.dart';
import 'package:foodies_app/ui/home/home_screen.dart';

import '../../../../../../di/di.dart';
import '../../../../../common/button_in_profile.dart';
import '../../../../../common/custom_app_bar.dart';
import 'cubit/form_address_states.dart';
import 'cubit/form_address_view_model.dart';

class FormAddressScreen extends StatefulWidget {
  static const String routeName = "FormAddressScreen";

  FormAddressScreen({super.key});

  @override
  State<FormAddressScreen> createState() => _FormAddressScreenState();
}

class _FormAddressScreenState extends State<FormAddressScreen> {

var viewModel = getIt<FormAddressViewModel>();
  var args;

  @override
  Widget build(BuildContext context) {
    args = ModalRoute.of(context)!.settings.arguments as String?;
    return BlocListener<FormAddressViewModel,FormAddressStates>(
      bloc: viewModel,
      listener: (context, state) {
        if (state is AddAddressSuccessState) {
          Navigator.pushReplacementNamed(context, HomeScreen.routeName);
        }
      },
      child:Scaffold(
          appBar: CustomAppBar.buildAppBar(context, 'Confirm address'),
          body: SingleChildScrollView(
            child: Form(
              key: viewModel.formKey,
              child: Container(
                padding: const EdgeInsets.all(12),
                child: Column(
                  children: [
                    EditTextInProfile(
                      keyboardType: TextInputType.phone,
                      isTextFieldEnabled: false,
                      controller: viewModel.phoneNumberController,
                      label: 'Phone Number',
                      hint: '01279197334',
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
                      controller: viewModel.firstAddressController = TextEditingController(text: args),
                      label: 'Address',
                      hint: '',
                      isSecured: false,
                        validator: (text) {
                          if (text == null || text.trim().isEmpty) {
                            return 'Please enter address';
                          }
                          return null;
                        }
                    ),
                    // EditTextInProfile(
                    //   keyboardType: TextInputType.emailAddress,
                    //   isTextFieldEnabled: true,
                    //   controller: viewModel.secondAddressController,
                    //   label: 'Second Address',
                    //   hint: 'Al haram...',
                    //   isSecured: false,
                    //   validator: (text) {
                    //     if (text == null || text.trim().isEmpty) {
                    //       return 'Please enter Second Address';
                    //     }
                    //     return null;
                    //   },
                    // ),
            
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: EditTextInProfile(
                            keyboardType: TextInputType.text,
                            isTextFieldEnabled: true,
                            controller: viewModel.buildingNoController,
                            label: 'Building no./name',
                            //hint: 'Building 9',
                            width: 160, // Specify the width here

                            isSecured: false,
                              validator: (text) {
                                if (text == null || text.trim().isEmpty) {
                                  return 'Please enter building no./name';
                                }
                                return null;
                              }
                          ),
                        ),
                        Expanded(
                          child: EditTextInProfile(
                            keyboardType: TextInputType.text,
                            isTextFieldEnabled: true,
                            controller: viewModel.streetNameController,
                            label: 'Street no./name',
                            //hint: 'Optional',
                            width: 160, // Specify the width here
                            isSecured: false,
                              validator: (text) {
                                if (text == null || text.trim().isEmpty) {
                                  return 'Please enter street no./name';
                                }
                                return null;
                              }

                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: EditTextInProfile(
                            keyboardType: TextInputType.number,
                            isTextFieldEnabled: true,
                            controller: viewModel.floorNoController,
                            label: 'Floor (optional)',
                            //hint: 'Floor 9',
                            width: 160, // Specify the width here
                            isSecured: false,
                          ),
                        ),
                        Expanded(
                          child: EditTextInProfile(
                            keyboardType: TextInputType.number,
                            isTextFieldEnabled: true,
                            controller: viewModel.apartmentNoController,
                            label: 'Apartment',
                            //hint: 'Optional',
                            width: 160, // Specify the width here
                            isSecured: false,
                              validator: (text) {
                                if (text == null || text.trim().isEmpty) {
                                  return 'Please enter apartment no.';
                                }
                                return null;
                              }

                          ),
                        ),
                      ],
                    ),
                    EditTextInProfile(
                      keyboardType: TextInputType.text,
                      isTextFieldEnabled: true,
                      controller: viewModel.othersController,
                      label: 'Anything else (optional)',
                      //hint: 'optional',
                      isSecured: false,
                    ),
                    const SizedBox(height: 10.0), // Space before the button
                    ButtonInProfile(
                      backgroundColor: Theme.of(context).primaryColor,
                      textColor: Colors.white,
                      text: 'Save Address',
                      onPressed: () {
                        viewModel.addAddress();
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),

        ),
    );
  }
// void checkPass() {
//     if (formKey.currentState?.validate() == false) {
//       return;
//     }
//     Navigator.of(context).pushNamed(AddAddress.routeName);
//   }
}
