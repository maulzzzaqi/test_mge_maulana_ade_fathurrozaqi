import 'dart:async';
import 'package:flutter/material.dart';
import 'package:test_mge_maulana_ade_fathurrozaqi/authentication/login_page.dart';

class SplashPage extends StatefulWidget {
  static const String route = '/splash';
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 3), () {
      Navigator.pushReplacementNamed(context, LoginPage.route);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.asset('assets/img/login.png')
      ),
    );
  }
}
