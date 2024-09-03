import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            height: 300,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/img/login.png'),
                fit: BoxFit.cover,
              )
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(60),
            child: Column(
              children: [
                Column(
                  children: [
                    const Row(
                      children: [
                        Icon(Icons.person),
                        SizedBox(width: 8),
                        Text('Username', style: TextStyle(fontSize: 16),)
                      ],
                    ),  
                    const SizedBox(height: 10.0),
                    TextFormField(
                      decoration: const InputDecoration(
                        labelText: 'Your Username',
                        border: UnderlineInputBorder()
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 40),
                Column(
                  children: [
                    const Row(
                      children: [
                        Icon(Icons.key),
                        SizedBox(width: 8),
                        Text('Password', style: TextStyle(fontSize: 16),)
                      ],
                    ),  
                    const SizedBox(height: 10.0),
                    TextFormField(
                      obscureText: true,
                      decoration: const InputDecoration(
                        labelText: 'Your Password',
                        border: UnderlineInputBorder()
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 40),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue,
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                        ),
                      ),
                      onPressed: () {},
                      child: const Text('Submit', style: TextStyle(color: Colors.white),),
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}