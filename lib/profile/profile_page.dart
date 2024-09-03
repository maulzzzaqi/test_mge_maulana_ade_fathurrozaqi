import 'package:flutter/material.dart';
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
    });
  }

  Future<void> saveProfileData() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('username', usernameController.text);
    await prefs.setString('phone', phoneController.text);
    await prefs.setString('address', addressController.text);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
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
