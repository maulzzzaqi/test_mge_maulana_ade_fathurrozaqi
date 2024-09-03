import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:test_mge_maulana_ade_fathurrozaqi/authentication/login_page.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final usernameController = TextEditingController();
  final phoneController = TextEditingController();
  final addressController = TextEditingController();
  File? profileImage;
  final ImagePicker imagePicker = ImagePicker();

  @override
  void initState() {
    super.initState();
    loadProfileData();
  }

  Future<void> loadProfileData() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      usernameController.text = prefs.getString('username') ?? '';
      phoneController.text = prefs.getString('phone') ?? '';
      addressController.text = prefs.getString('address') ?? '';
      final imagePath = prefs.getString('profileImage');
      if (imagePath != null) {
        profileImage = File(imagePath);
      }
    });
  }

  Future<void> saveProfileData() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('username', usernameController.text);
    await prefs.setString('phone', phoneController.text);
    await prefs.setString('address', addressController.text);
    if (profileImage != null) {
      await prefs.setString('profileImage', profileImage!.path);
    }
  }

  Future<void> pickImage(ImageSource source) async {
    try {
      final pickedFile = await imagePicker.pickImage(source: source);
      if (pickedFile != null) {
        setState(() {
          profileImage = File(pickedFile.path);
        });
        await saveProfileData();
      } else {
        print('No image selected.');
      }
    } catch (e) {
      print('Error picking image: $e');
    }
  }

  void showImagePickerDialog() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Select Profile Picture'),
          actions: [
            TextButton(
              onPressed: () {
                pickImage(ImageSource.camera);
                Navigator.of(context).pop();
              },
              child: const Text('Camera'),
            ),
            TextButton(
              onPressed: () {
                pickImage(ImageSource.gallery);
                Navigator.of(context).pop();
              },
              child: const Text('Gallery'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Cancel'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: () => showImagePickerDialog(),
              child: CircleAvatar(
                radius: 50,
                backgroundImage: profileImage != null ? FileImage(profileImage!) : null,
                child: profileImage == null ? const Icon(Icons.supervisor_account, size: 50) : null,
              ),
            ),
            const SizedBox(height: 20),
            Column(
              children: [
                const Row(
                  children: [
                    Icon(Icons.person),
                    SizedBox(width: 8),
                    Text('Username', style: TextStyle(fontSize: 16),)
                  ],
                ),
                TextField(
                  controller: usernameController,
                  decoration: const InputDecoration(hintText: 'Username'),
                  keyboardType: TextInputType.text,
                ),
              ],
            ),
            const SizedBox(height: 20),
            Column(
              children: [
                const Row(
                  children: [
                    Icon(Icons.phone),
                    SizedBox(width: 8),
                    Text('Phone', style: TextStyle(fontSize: 16),)
                  ],
                ),
                TextField(
                  controller: phoneController,
                  decoration: const InputDecoration(hintText: '+628123456789'),
                  keyboardType: TextInputType.phone,
                ),
              ],
            ),
            const SizedBox(height: 20),
            Column(
              children: [
                const Row(
                  children: [
                    Icon(Icons.home),
                    SizedBox(width: 8),
                    Text('Address', style: TextStyle(fontSize: 16),)
                  ],
                ),
                TextField(
                  controller: addressController,
                  decoration: const InputDecoration(hintText: 'Surabaya, Indonesia'),
                  keyboardType: TextInputType.text,
                ),
              ],
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          saveProfileData();
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Profile updated')));
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const LoginPage()));
        },
        backgroundColor: Colors.blue,
        shape: const CircleBorder(),
        child: const Icon(Icons.save, color: Colors.white,),
      ),
    );
  }
}
