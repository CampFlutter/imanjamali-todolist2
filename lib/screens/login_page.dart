import 'package:flutter/material.dart';
import 'package:flutter_application_todolist/screens/second.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  final Map<String, String> _map = {
    'iman': '17384',
    'fateme': '181183',
    'test': '1234'
  };

  void login() {
    final username = usernameController.text;
    final password = passwordController.text;

    if (_map.containsKey(username) && _map[username] == password) {
      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return Center(
            child: CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(Colors.red),
            ),
          );
        },
      );

      Future.delayed(Duration(seconds: 3), () {
        Navigator.of(context).pop();
        Navigator.of(context).push(
          MaterialPageRoute(builder: (BuildContext context) {
            return Second();
          }),
        );
      });
    } else {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Error'),
            content: const Text('نام کاربری و رمز عبور اشتباه است'),
            actions: <Widget>[
              TextButton(
                child: const Text('Close'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/22.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Container(
          color: Colors.white.withOpacity(0.5), // رنگی روی تصویر
          child: SafeArea(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 250,
                  child: TextField(
                    controller: usernameController,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue,
                    ),
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Username',
                      hintStyle: TextStyle(
                        color: Colors.blueGrey.withOpacity(0.5),
                      ),
                    ),
                  ),
                ),
                Container(
                  width: 250,
                  child: TextField(
                    controller: passwordController,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue,
                    ),
                    obscureText: true,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Password',
                      hintStyle: TextStyle(
                        color: Colors.blueGrey.withOpacity(0.5),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 25,),
                ElevatedButton(
                  onPressed: login,
                  child: const Text('Login',style: TextStyle(color: Colors.blue,fontWeight: FontWeight.bold),),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
