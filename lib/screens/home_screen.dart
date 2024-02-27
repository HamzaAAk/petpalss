import 'package:flutter/material.dart';
import 'package:petpals/screens/sign_in_screen.dart'; // Import the registration screen
import 'package:petpals/screens/login_screen.dart'; // Import the login screen
import 'package:petpals/screens/onboarding_screen.dart'; // Import the login screen

class HomeScreen extends StatelessWidget {
  Future<bool> geriDonusTusu(BuildContext context) async {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => OnboardingScreen()),
    );

    return false;
  }

  final bool
      isRegistered; // Replace with your logic to determine if the user is registered

  HomeScreen({required this.isRegistered});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pet Pals Home'),
      ),
      body: WillPopScope(
        onWillPop: () => geriDonusTusu(context),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Welcome to Pet Pals App'),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  if (isRegistered) {
                    // Navigate to the LoginScreen if registered
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (context) => LoginScreen()));
                  } else {
                    // Navigate to the RegistrationScreen if not registered
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => SignInScreen()));
                  }
                },
                child: Text(isRegistered ? 'Log In' : 'Register'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
