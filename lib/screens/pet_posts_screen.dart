import 'package:flutter/material.dart';
import 'package:petpals/screens/membership_screen.dart';
import 'package:petpals/screens/share_pet_content_screen.dart';

class PetPostsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pet Posts'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: 20),
          Text(
            'Welcome to Pet Posts!',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 20),
          Expanded(
            child: ListView.builder(
              itemCount: petPosts.length,
              itemBuilder: (context, index) {
                final petPost = petPosts[index];
                return ListTile(
                  title: Text(petPost.title),
                  subtitle: Text(petPost.description),
                );
              },
            ),
          ),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => MembershipScreen()),
              );
            },
            child: Text('Manage Membership'),
          ),
          SizedBox(height: 30),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => SharePetContentScreen()),
              );
            },
            child: Text('share your photos and videos'),
          ),
          SizedBox(height: 20),
        ],
      ),
    );
  }
}

class PetPost {
  final String title;
  final String description;

  PetPost(this.title, this.description);
}

List<PetPost> petPosts = [
  PetPost('Adorable Puppy', 'Check out this cute puppy!'),
  PetPost('Playful Kittens', 'These kittens are full of energy.'),
  // Add more pet posts
];
