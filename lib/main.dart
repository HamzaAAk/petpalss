import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:petpals/screens/app_initialization_screen.dart'; // Import your app initialization screen

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pet Pals App',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: AppInitializationScreen(),
    );
  }
}
