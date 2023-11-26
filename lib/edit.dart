import 'package:flutter/material.dart';
import 'package:profile_page/layout/home_layout.dart';

class User {
  String name = "User Name";
  String email = "User Email";
  String bio = "User Bio";

  User({required this.name, required this.email, required this.bio});
}

class Edit extends StatelessWidget {
  final FocusNode _focusNode = FocusNode();
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController bioController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            // Pop until you reach the HomeLayout page
            Navigator.pop(context);
          },
        ),
        backgroundColor: Colors.deepOrange,
        title: const Text('Edit Profile'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Column(
                children: [
                  CircleAvatar(
                    radius: 60,
                    backgroundImage: const NetworkImage(
                        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRtEbTLfMii3TQW5ambR0PD6FlRMPcUFzDy_g&usqp=CAU.jpg'),
                    child: Stack(
                      children: [
                        // Edit Button
                        Positioned(
                          bottom: -10,
                          right: -10,
                          child: IconButton(
                            icon: Icon(
                              Icons.add_a_photo,
                              color: Colors.grey[700],
                            ),
                            onPressed: () {},
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: TextField(
                      maxLines: 1,
                      controller: nameController,
                      decoration: const InputDecoration(hintText: 'Name'),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Expanded(
                    child: TextField(
                      maxLines: 1,
                      controller: emailController,
                      decoration: const InputDecoration(hintText: 'Email'),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Expanded(
                    child: TextField(
                      maxLines: 1,
                      controller: bioController,
                      decoration: const InputDecoration(hintText: 'Bio'),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: Column(
                children: [
                  Container(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        // Save the edited information
                        User updatedUser = User(
                          name: nameController.text,
                          email: emailController.text,
                          bio: bioController.text,
                        );

                        // Update the user information
                        // You can save it to a database or perform any other necessary actions
                        // For now, we'll just print the updated information

                        // You might want to navigate back to the previous screen or perform other actions here
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.deepOrange,
                      ),
                      child: const Text('Save'),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
