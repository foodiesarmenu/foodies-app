import 'package:flutter/material.dart';
import 'package:foodies_app/ui/profile/ProfileScreen.dart';

class EditProfileScreen extends StatelessWidget {
  static const String routeName = 'edit-profile';
  const EditProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:const Text('Edit Profile'),
        centerTitle: true, // Center the title for a balanced look
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start, // Align content to the left
            children: [
              // Profile picture section
              Stack(
                //alignment: Alignment.center, // Center the Stack within its parent
                children: [
                  const CircleAvatar(
                    radius: 50.0,
                    backgroundImage: AssetImage('assets/images/7oda.png'), // Replace with your asset path
                  ),
                  Positioned(
                    bottom: 0.0,
                    right: 0.0,
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.grey[200], // Light grey background
                        shape: BoxShape.circle,
                      ),
                      child: IconButton(
                        icon: const Icon(Icons.camera_alt_outlined), // Edit icon
                        onPressed: () {
                          // Handle image selection or camera functionality
                        },
                        iconSize: 18.0,
                      ),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 20.0), // Space between sections


              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, ProfileScreen.routeName);
                },
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(double.infinity, 50.0), // Full-width button
                ),
                child:const Text('Save'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
