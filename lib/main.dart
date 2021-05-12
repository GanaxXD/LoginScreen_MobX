import 'package:flutter/material.dart';
import 'package:login_mobx/screens/login-screen.dart';
import 'package:login_mobx/screens/taskScreen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      color: Colors.blueAccent.shade400,
      title: 'Meu MobX App',
      debugShowCheckedModeBanner: false,
      home: LoginScreen(),
    );
  }
}
