import '../pages/profile.dart';
import 'package:flutter/material.dart';

class drawer extends StatelessWidget {
  const drawer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ListView(
          padding: const EdgeInsets.only(left: 10, top: 100),
          children: [
            ListTile(
              title: const Text('Profile'),
              onTap: () {
                Navigator.push<void>(
                    context,
                    MaterialPageRoute<void>(
                        builder: (BuildContext context) =>
                            const ProfilePage()));
              },
            ),
            ListTile(
              title: const Text('About Us'),
              onTap: () {},
            ),
          ],
        ),
        Positioned(
          top: 16,
          right: 16,
          child: IconButton(
            icon: const Icon(Icons.close),
            onPressed: () {
              Navigator.pop(context); // Close the drawer
            },
          ),
        ),
      ],
    );
  }
}
