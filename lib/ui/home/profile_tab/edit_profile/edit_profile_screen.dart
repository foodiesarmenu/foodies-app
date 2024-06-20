import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodies_app/di/di.dart';
import 'package:foodies_app/ui/common/button_in_profile.dart';
import 'package:foodies_app/ui/common/custom_app_bar.dart';
import 'package:foodies_app/ui/home/profile_tab/cubit/profile_view_model.dart';
import 'package:foodies_app/ui/utils/image_functions.dart';

import '../../../common/form_input_field.dart';
import 'cubit/edit_profile_states.dart';
import 'cubit/edit_profile_view_model.dart';

enum Gender { male, female }

class EditProfileScreen extends StatefulWidget {
  static const String routeName = 'edit-profile';

  const EditProfileScreen({super.key});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  TextEditingController genderController = TextEditingController();
  TextEditingController birthDateController = TextEditingController();

  DateTime? selectedDate;
  DateTime date = DateTime.now();
  Gender selectedGender = Gender.male;

  var viewModel = getIt<EditProfileViewModel>();
  var args;
  File? pickedImage;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    args = ModalRoute.of(context)!.settings.arguments as ProfileViewModel?;
  }

  @override
  void initState() {
    viewModel..getProfileData();
    super.initState();
  }

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

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<EditProfileViewModel, EditProfileStates>(
      listener: (context, state) async {
        if (state is UpdateProfileImageSuccessState ||
            state is UpdateProfileSuccessState) {
          await args.getProfileData();
          Navigator.pop(context);
        } else if (state is UpdateProfileImageErrorState) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.errorMessage),
              backgroundColor: Colors.red,
            ),
          );
        } else if (state is UpdateProfileErrorState) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.errorMessage),
              backgroundColor: Colors.red,
            ),
          );
        } else if (state is EditProfileLoadingState) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.loadingMessage ?? 'Loading'),
              backgroundColor: Colors.blue,
            ),
          );
        }
      },
      bloc: viewModel,
      builder: (context, state) {
        return (state is GetProfileDataSuccessState)
            ? Scaffold(
                appBar: CustomAppBar.buildAppBar(context, 'Edit Profile'),
                body: SingleChildScrollView(
                  child: Form(
                    key: viewModel.formKey,
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
                                  image: pickedImage != null
                                      ? DecorationImage(
                                          image: FileImage(pickedImage!),
                                          fit: BoxFit.cover,
                                        )
                                      : null,
                                ),
                                child: pickedImage == null
                                    ? ClipOval(
                                        child: CachedNetworkImage(
                                          width: 80,
                                          height: 80,
                                          fit: BoxFit.cover,
                                          imageUrl: state.user.image ?? '',
                                          placeholder: (context, url) =>
                                              CircularProgressIndicator(),
                                          errorWidget: (context, url, error) =>
                                              Container(),
                                        ),
                                      )
                                    : null,
                              ),
                              Positioned(
                                height: 40,
                                width: 40,
                                bottom: 0,
                                right: 0,
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: Theme.of(context).primaryColor,
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
                                      ),
                                      onPressed: () {
                                        editPhotoBottomSheet();
                                      },
                                      iconSize: 18.0,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 20.0),
                          FormInputField(
                            icon: Icons.person_outlined,
                            controller: viewModel.nameController,
                            label: 'Full Name',
                            floatingLabelBehavior: FloatingLabelBehavior.always,
                            hint: state.user.name ?? 'Yehya Gamal',
                          ),
                          SizedBox(height: 12.0),
                          FormInputField(
                            icon: Icons.phone_outlined,
                            controller: viewModel.phoneController,
                            label: 'Phone',
                            hint: state.user.phoneNumber ?? '01000000000',
                            floatingLabelBehavior: FloatingLabelBehavior.always,
                            keyboardType: TextInputType.number,
                          ),
                          SizedBox(height: 12.0),
                          Row(
                            children: [
                              Expanded(
                                child: ButtonInProfile(
                                  borderColor: Theme.of(context).primaryColor,
                                  text: 'Cancel',
                                  textColor: Theme.of(context).primaryColor,
                                  backgroundColor: Colors.white,
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                ),
                              ),
                              Expanded(
                                child: ButtonInProfile(
                                  text: 'Save',
                                  textColor: Colors.white,
                                  backgroundColor:
                                      Theme.of(context).primaryColor,
                                  onPressed: () {
                                    if (pickedImage != null) {
                                      viewModel.updateProfileImage(
                                          image: pickedImage!.path);
                                    } else if (viewModel.phoneController.text !=
                                            '' ||
                                        viewModel.nameController.text != '') {
                                      viewModel.updateProfile(
                                          name: viewModel.nameController.text,
                                          phone:
                                              viewModel.phoneController.text);
                                    } else {
                                      return null;
                                    }
                                  },
                                ),
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

  void editPhotoBottomSheet() {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return Wrap(
          children: [
            ListTile(
              leading: Icon(Icons.camera_alt),
              title: Text('Take Photo'),
              onTap: () {
                ImageFunctions.cameraPicker().then((pickedFile) {
                  if (pickedFile != null) {
                    setState(() {
                      pickedImage = pickedFile;
                    });
                  }
                });
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.photo_library),
              title: Text('Choose from Gallery'),
              onTap: () {
                ImageFunctions.galleryPicker().then((pickedFile) {
                  if (pickedFile != null) {
                    setState(() {
                      pickedImage = pickedFile;
                    });
                  }
                });
                Navigator.pop(context);
              },
            ),
          ],
        );
      },
    );
  }
}
