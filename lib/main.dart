import 'package:flutter/material.dart';
import 'package:tjl_app/screens/login_screen.dart';
// import 'package:tjl_app/screens/login_screen.dart';
// import 'package:tjl_app/screens/welcome_screen.dart';
// import 'package:tjl_app/screens/register_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'The Jagger Lounge',
      theme: ThemeData(),
      home: LoginForm(),
    );
  }
}
