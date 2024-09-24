import 'package:flutter/material.dart';
import 'package:flutter_application_todolist/screens/login_page.dart';

void main() {
  runApp(MyWidget());
}

class MyWidget extends StatelessWidget {
  const MyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return (MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginPage(),
    ));
  }
}
