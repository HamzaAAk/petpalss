import 'package:flutter/material.dart';
import 'package:petpals/gdpr_message.dart';
import 'package:petpals/screens/onboarding_screen.dart'; // Import your onboarding screen

class AppInitializationScreen extends StatefulWidget {
  @override
  _AppInitializationScreenState createState() =>
      _AppInitializationScreenState();
}

class _AppInitializationScreenState extends State<AppInitializationScreen> {
  bool _isNewUser =
      true; // Replace with your logic to determine if the user is new or not

  @override
  Widget build(BuildContext context) {
    return _isNewUser ? showGDPRMessage() : OnboardingScreen();
  }

  Widget showGDPRMessage() {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pet Pals - GDPR Compliance'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Text(
              'We value your privacy and data protection.',
              style: TextStyle(fontSize: 18),
            ),
          ),
          SizedBox(height: 20),
          Center(
            child: Text(
              'By continuing, you agree to our Privacy Policy and Data Processing Agreement.',
              style: TextStyle(fontSize: 14, color: Colors.grey),
            ),
          ),
          SizedBox(height: 20),
          Center(
            child: ElevatedButton(
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => OnboardingScreen()),
                );
              },
              child: Text('Agree and Get Started'),
            ),
          ),
        ],
      ),
    );
  }
}
