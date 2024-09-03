import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_mge_maulana_ade_fathurrozaqi/authentication/login_page.dart';
import 'package:test_mge_maulana_ade_fathurrozaqi/home/list_bloc/list_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => ListBloc(),
        )
      ],
      child: MaterialApp(
        initialRoute: LoginPage.route,
        routes: {
          LoginPage.route: (context) => const LoginPage(),
        },
      ),
    );
  }
}
