import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(height: 20),
          const CircleAvatar(
            radius: 50,
            backgroundImage: AssetImage(
              "assets/images/students.jpg",
            ),
          ),
          const SizedBox(height: 20),
          const Text(
            'Nicolas Adams',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              // Upgrade to Pro functionality
            },
            child: const Text('Upgrade to Pro'),
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                onPressed: () {
                  // Friends functionality
                },
                child: const Text('Friends'),
              ),
              ElevatedButton(
                onPressed: () {
                  // Help & Support functionality
                },
                child: const Text('Help & Support'),
              ),
              ElevatedButton(
                onPressed: () {
                  // Privacy & Policy functionality
                },
                child: const Text('Privacy & Policy'),
              ),
            ],
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              // Buy Pro functionality
            },
            child: const Text('Buy Pro'),
          ),
        ],
      ),
    );
  }
}
