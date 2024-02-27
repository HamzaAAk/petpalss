import 'package:flutter/material.dart';

class GdprDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('GDPR Agreement'),
      content:
          Text('By using this app, you agree to our GDPR terms and policies.'),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.pop(context); // Close the dialog
          },
          child: Text('I Agree'),
        ),
      ],
    );
  }
}
