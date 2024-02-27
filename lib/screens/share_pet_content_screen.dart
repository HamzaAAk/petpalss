import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io'; // Import the 'dart:io' library

class SharePetContentScreen extends StatefulWidget {
  @override
  _SharePetContentScreenState createState() => _SharePetContentScreenState();
}

class _SharePetContentScreenState extends State<SharePetContentScreen> {
  final ImagePicker _imagePicker = ImagePicker();
  XFile? _selectedImage;

  Future<void> _pickImage() async {
    final XFile? image =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (image != null) {
      setState(() {
        _selectedImage = image;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Share Pet Content'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Share Your Pet Content',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            _selectedImage == null
                ? ElevatedButton(
                    onPressed: _pickImage,
                    child: Text('Pick an Image'),
                  )
                : Image.file(
                    File(_selectedImage!.path), // Convert XFile to File
                    height: 200,
                    width: 200,
                    fit: BoxFit.cover,
                  ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Implement logic to upload and share pet content
                // For example, you can use Firebase Storage to upload the image.
              },
              child: Text('Share'),
            ),
          ],
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: SharePetContentScreen(),
  ));
}
