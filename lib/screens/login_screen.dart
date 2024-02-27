import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:petpals/screens/home_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:petpals/screens/pet_posts_screen.dart';
import 'package:petpals/screens/reset_password_screen.dart';

class LoginScreen extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  Future<bool> geriDonusTusu(BuildContext context) async {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => HomeScreen(isRegistered: true)),
    );

    return false;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Firebase.initializeApp(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return Scaffold(
            appBar: AppBar(
              title: Text('Login'),
            ),
            body: WillPopScope(
              onWillPop: () => geriDonusTusu(context),
              child: Padding(
                padding: EdgeInsets.all(16.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    TextField(
                      controller:
                          emailController, // Use the TextEditingController
                      decoration: InputDecoration(labelText: 'Email'),
                    ),
                    SizedBox(height: 20),
                    TextField(
                      controller:
                          passwordController, // Use the TextEditingController
                      obscureText: true,
                      decoration: InputDecoration(labelText: 'Password'),
                    ),
                    SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: () async {
                        try {
                          await FirebaseAuth.instance
                              .signInWithEmailAndPassword(
                                  email: emailController.text,
                                  password: passwordController.text);

                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => PetPostsScreen()),
                          );
                        } catch (error) {
                          print("Error: $error");
                        }
                      },
                      child: Text('Log In'),
                    ),
                    SizedBox(height: 10),
                    TextButton(
                      onPressed: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ResetPasswordScreen()),
                          // Implement forgot password functionality
                        );
                      },
                      child: Text('Forgot Password?'),
                    ),
                  ],
                ),
              ),
            ),
          );
        } else {
          return CircularProgressIndicator(); // Show a loading indicator while Firebase initializes
        }
      },
    );
  }
}
