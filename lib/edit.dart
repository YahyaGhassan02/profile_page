import 'package:flutter/material.dart';

class User {
  String name;
  String email;
  String bio;

  User({required this.name, required this.email, required this.bio});
}

class Edit extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: EditProfilePage(
          user: User(
              name: "User Name",
              email: "User@example.com",
              bio: "Your bio")),
    );
  }
}

class EditProfilePage extends StatefulWidget {
  final User user;

  EditProfilePage({required this.user});

  @override
  _EditProfilePageState createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  late TextEditingController nameController;
  late TextEditingController emailController;
  late TextEditingController bioController;

  @override
  void initState() {
    super.initState();
    nameController = TextEditingController(text: widget.user.name);
    emailController = TextEditingController(text: widget.user.email);
    bioController = TextEditingController(text: widget.user.bio);
  }

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
            const CircleAvatar(
              radius: 60,
              backgroundImage: NetworkImage(
                  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRtEbTLfMii3TQW5ambR0PD6FlRMPcUFzDy_g&usqp=CAU.jpg'),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: nameController,
              decoration: const InputDecoration(labelText: 'Name'),
            ),
            const SizedBox(height: 8),
            TextField(
              controller: emailController,
              decoration: const InputDecoration(labelText: 'Email'),
            ),
            const SizedBox(height: 8),
            TextField(
              controller: bioController,
              decoration: const InputDecoration(labelText: 'Bio'),
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(

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
                    print('Updated User Information: $updatedUser');

                    // You might want to navigate back to the previous screen or perform other actions here
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Colors.deepOrange,
                  ),
                  child: const Text('Save'),
                ),
                TextButton(
                  style: ElevatedButton.styleFrom(
                    primary: Colors.deepOrange,
                    foregroundColor: Colors.white,
                  ),
                  onPressed: () {
                    // Simply navigate back without saving changes
                    Navigator.pop(context);
                  },
                  child: const Text('Discard'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    bioController.dispose();
    super.dispose();
  }
}
