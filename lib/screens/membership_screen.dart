import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:petpals/screens/login_screen.dart';

class MembershipScreen extends StatefulWidget {
  @override
  _MembershipScreenState createState() => _MembershipScreenState();
}

class _MembershipScreenState extends State<MembershipScreen> {
  final User? user = FirebaseAuth.instance.currentUser;
  final TextEditingController _oldPasswordController = TextEditingController();
  final TextEditingController _newPasswordController = TextEditingController();
  bool _showPasswordForm = false;

  Future<void> _changePassword(BuildContext context) async {
    final AuthCredential credential = EmailAuthProvider.credential(
      email: user!.email!,
      password: _oldPasswordController.text,
    );

    try {
      // Verify the old password first
      await user!.reauthenticateWithCredential(credential);

      // Change the password
      await user!.updatePassword(_newPasswordController.text);
      _newPasswordController.clear();
      _oldPasswordController.clear();

      setState(() {
        _showPasswordForm = false;
      });

      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text('Password Changed'),
          content: Text('Your password has been successfully changed.'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('OK'),
            ),
          ],
        ),
      );
    } catch (e) {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text('Password Change Failed'),
          content: Text('An error occurred. Please try again later.'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('OK'),
            ),
          ],
        ),
      );
    }
  }

  Future<void> _signOut(BuildContext context) async {
    try {
      await FirebaseAuth.instance.signOut();
      Navigator.pop(context); // Return to the previous screen after signing out
    } catch (e) {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text('Sign Out'),
          content: Text('An error occurred. Please try again later.'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('OK'),
            ),
          ],
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Membership'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Account Details',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            Text('Email: ${user?.email ?? "Not logged in"}'),
            SizedBox(height: 20),
            if (_showPasswordForm)
              Column(
                children: [
                  TextField(
                    controller: _oldPasswordController,
                    obscureText: true,
                    decoration: InputDecoration(labelText: 'Old Password'),
                  ),
                  SizedBox(height: 10),
                  TextField(
                    controller: _newPasswordController,
                    obscureText: true,
                    decoration: InputDecoration(labelText: 'New Password'),
                  ),
                  SizedBox(height: 10),
                  ElevatedButton(
                    onPressed: () => _changePassword(context),
                    child: Text('Change Password'),
                  ),
                ],
              ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  _showPasswordForm = !_showPasswordForm;
                });
              },
              child: Text(_showPasswordForm
                  ? 'Cancel Password Change'
                  : 'Change Password'),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => LoginScreen()),
                );
              },
              child: Text('Log Out'),
            ),
          ],
        ),
      ),
    );
  }
}
