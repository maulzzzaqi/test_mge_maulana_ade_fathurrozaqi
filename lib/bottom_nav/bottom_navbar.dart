import 'package:flutter/material.dart';
import 'package:test_mge_maulana_ade_fathurrozaqi/authentication/login_page.dart';
import 'package:test_mge_maulana_ade_fathurrozaqi/home/home_page.dart';
import 'package:test_mge_maulana_ade_fathurrozaqi/profile/profile_page.dart';

class BottomNavbar extends StatefulWidget {
  final String username;
  const BottomNavbar({super.key, required this.username});

  @override
  State<BottomNavbar> createState() => _BottomNavbarState();
}

class _BottomNavbarState extends State<BottomNavbar> {
  int currentIndex = 0;
  final List<Widget> page = [
    HomePage(),
    ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Welcome, ${widget.username}',
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w500
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const LoginPage()));
            },
            icon: const Icon(Icons.logout, color: Colors.white,),
          )
        ],
        backgroundColor: Colors.blue,
      ),
      body: page[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.blue,
        type: BottomNavigationBarType.fixed,
        currentIndex: currentIndex,
        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.list, color: Colors.white),
            label: ''
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle, color: Colors.white),
            label: ''
          ),
        ],
      ),
    );
  }
}
