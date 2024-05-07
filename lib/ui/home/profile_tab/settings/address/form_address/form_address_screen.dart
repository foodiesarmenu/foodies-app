import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodies_app/ui/common/EditTextInProfile.dart';
import 'package:foodies_app/ui/home/profile_tab/settings/address/form_address/cubit/form_address_states.dart';
import '../../../../../../di/di.dart';
import '../../../../../common/ButtonInProfile.dart';
import '../../../../../common/custom_app_bar.dart';
import '../add_address.dart';
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
    return BlocBuilder<FormAddressViewModel,FormAddressStates>(
      bloc: viewModel,
      builder: (context, state) {
        return Scaffold(
          appBar: CustomAppBar.buildAppBar(context, 'Confirm address'),
          body: ListView(
            children: [
              Form(
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
                        hint: '0123456789',
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
                        controller: viewModel.firstAddressController,
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
                        controller: viewModel.secondAddressController,
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
                            controller: viewModel.buildingNoController,
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
                            controller: viewModel.streetNameController,
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
                            controller: viewModel.floorNoController,
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
                            controller: viewModel.apartmentNoController,
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
                        controller: viewModel.othersController,
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
                          viewModel.addAddress().then((_) {
                            Navigator.of(context).pushNamed(AddAddress.routeName);
                          });
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),

        );
      },
    );
  }
// void checkPass() {
//     if (formKey.currentState?.validate() == false) {
//       return;
//     }
//     Navigator.of(context).pushNamed(AddAddress.routeName);
//   }
}
