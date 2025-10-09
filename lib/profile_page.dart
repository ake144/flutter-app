import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  void onPressed() {
    Navigator.pop(context);
  }

  bool isOpen = false;
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile Page'),
        automaticallyImplyLeading: false,
        leading: IconButton(onPressed: onPressed, icon: Icon(Icons.arrow_back)),
        actions: [
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Settings button pressed!'),
                  duration: Duration(seconds: 2),
                ),
              );
            },
          ),
        ],
        backgroundColor: Theme.of(context).useMaterial3
            ? const Color.fromARGB(240, 89, 0, 241)
            : Colors.blue,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        textBaseline: TextBaseline.alphabetic,
        children: [
          const SizedBox(height: 20),

          Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                CircleAvatar(
                  radius: 50,
                  backgroundImage: AssetImage(
                    'images/photo.jpg',
                  ),
                ),
                const SizedBox(height: 7),
                const Text('Profile Information'),
                const SizedBox(height: 16),
                const Text('Name: John Doe'),
                const Text('Email: john.doe@example.com'),
              ],
            ),
          ),

          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text(
                    'Profile updated successfully!',
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Color.fromARGB(255, 212, 212, 212)),
                  ),
                  duration: Duration(seconds: 20),
                  backgroundColor: Colors.green,
                ),
              );
            },
            child: const Text('Update Profile'),
          ),
          const SizedBox(height: 20),
          GestureDetector(
            onTap: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('GestureDetector tapped!'),
                  duration: Duration(seconds: 2),
                ),
              );
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  icon: const Icon(Icons.edit),
                  onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Edit button pressed!'),
                      duration: Duration(seconds: 2),
                    ),
                  );
                },
              ),

              TextButton(onPressed: () {}, child: Text('Delete')),
              ElevatedButton(onPressed: () {}, child: Text('Save')),
              OutlinedButton(onPressed: () {}, child: Text('Cancel')),
            ],
          ),
        ),

         Switch(
            value: isOpen,
            onChanged: (value) {
              setState(() {
                isOpen = value;
              });
            },
          ),

          Checkbox(
            value: isChecked,
            onChanged: (bool? value) {
              setState(() {
                isChecked = value ?? false;
              });
            },
          ),
      
        ]

      ),

      
    );
  }
}
