import 'package:flutter/material.dart';
import 'package:petpals/main.dart';
import 'package:petpals/screens/app_initialization_screen.dart';
import 'package:petpals/screens/home_screen.dart'; // Import your home screen

class OnboardingScreen extends StatelessWidget {
  Future<bool> geriDonusTusu(BuildContext context) async {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => AppInitializationScreen()),
    );

    return false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pet Pals - Onboarding'),
      ),
      body: WillPopScope(
        onWillPop: () => geriDonusTusu(context),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Text(
                'Welcome to Pet Pals!',
                style: TextStyle(fontSize: 24),
              ),
            ),
            SizedBox(height: 20),
            Center(
              child: Text(
                'Familiarize yourself with our app features and purpose.',
                style: TextStyle(fontSize: 18),
              ),
            ),
            SizedBox(height: 20),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  // Set isRegistered to true (Logged In)
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) => HomeScreen(isRegistered: true)),
                  );
                },
                child: Text('You are logged in'),
              ),
            ),
            SizedBox(height: 20),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  // Set isRegistered to false (Sign In)
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) => HomeScreen(isRegistered: false)),
                  );
                },
                child: Text('Sign In'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
