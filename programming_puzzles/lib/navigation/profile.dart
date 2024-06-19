import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class ProfileScreen extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfileScreen> {
  File? _image;
  final picker = ImagePicker();
  bool _notificationsEnabled = false;

  Future<void> _pickImage() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      }
    });
  }

    Future<void> _takePhoto() async {
    final pickedFile = await picker.pickImage(source: ImageSource.camera);

    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      }
    });
  }

   void _showImageSourceActionSheet() {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return SafeArea(
          child: Wrap(
            children: <Widget>[
              ListTile(
                leading: Icon(Icons.photo_library),
                title: Text('Gallery'),
                onTap: () {
                  _pickImage();
                  Navigator.of(context).pop();
                },
              ),
              ListTile(
                leading: Icon(Icons.photo_camera),
                title: Text('Camera'),
                onTap: () {
                  _takePhoto();
                  Navigator.of(context).pop();
                },
              ),
            ],
          ),
        );
      },
    );
  }


  void _showDeleteConfirmationDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Delete Account'),
          content: Text('Are you sure you want to delete your account? This action cannot be undone.'),
          actions: <Widget>[
            TextButton(
              child: Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: Text('Delete'),
              onPressed: () {
                // Handle account deletion logic here
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[

                SizedBox(height: 60),

                Padding(
            padding: const EdgeInsets.only(left: 130.0),
            child: const Text(
              'Profil',
              style: TextStyle(
                fontSize: 45,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
                  SizedBox(height: 30),

                Center(
                  child: GestureDetector(
                    onTap: _showImageSourceActionSheet,
                    child: Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: Colors.pink.shade400, // Border color
                          width: 3, // Border width
                        ),
                      ),
                      child: CircleAvatar(
                        radius: 100,
                        backgroundColor: Colors.white,
                        foregroundColor: Colors.white,
                        backgroundImage: _image != null 
                          ? FileImage(_image!) 
                          : AssetImage('assets/images/robot.png') as ImageProvider, // Default image asset
                      ),
                    ),
                  ),
                ),


                SizedBox(height: 40),
                
                Padding(
            padding: const EdgeInsets.only(left: 60.0),
            child: const Text(
              'Salut, Ana Maria!',
              style: TextStyle(
                fontSize: 28,
                fontFamily: 'Poppins',
              
              ),
            ),
          ),

                SizedBox(height: 40),

                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 16.0),
                  width: double.infinity,
                  child: Row(
                    children: <Widget>[
                      Text(
                        'Notificări',
                        style: TextStyle(fontSize: 24, fontFamily: 'Poppins'),
                      ),
                      Spacer(),
                      Switch(
                      value: _notificationsEnabled,
                      onChanged: (value) {
                        setState(() {
                          _notificationsEnabled = value;
                        });
                      },
                      activeColor: Colors.pink[400], // Change this color to whatever you prefer
                    ),
                    ],
                  ),
                ),
                SizedBox(height: 40),

                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 16.0),
                  width: double.infinity,
                  height: 60,
                  child: ElevatedButton(
                    onPressed: () {
                      // Navigate to the feedback page
                    },
                    child: Text('Feedback'),
                style: ElevatedButton.styleFrom(
                backgroundColor: Colors.teal[200],
                foregroundColor: Colors.black, 
                fixedSize: Size(260, 58),
                textStyle: TextStyle(
                  fontSize: 22,
                  fontFamily: 'Poppins',
                
                ),
                ),
                  ),
                ),

                SizedBox(height: 20),

                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 16.0),
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      // Handle logout logic here
                    },
                    child: Text('Iesi din cont'),
                style: ElevatedButton.styleFrom(
                backgroundColor: Colors.yellow[300],
                foregroundColor: Colors.black, 
                fixedSize: Size(260, 58),
                textStyle: TextStyle(
                  fontSize: 22,
                  fontFamily: 'Poppins',
                
                ),
                ),
                  ),
                ),

                SizedBox(height: 100),

                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 16.0),
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: _showDeleteConfirmationDialog,
                    child: Text('Stergere cont'),
                style: ElevatedButton.styleFrom(
                backgroundColor: Colors.black,
                foregroundColor: Colors.white, 
                fixedSize: Size(260, 58),
                textStyle: TextStyle(
                  fontSize: 22,
                  fontFamily: 'Poppins',
                
                ),
                ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
