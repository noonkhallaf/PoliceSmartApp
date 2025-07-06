
import 'package:flutter/material.dart';
import 'home_screen.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  String error = '';

  final users = {
    'noor': {
      'password': '123123',
      'name': 'نور الدين وائل عرجان',
      'rank': 'ملازم أول',
      'militaryId': '121417890',
      'nationalId': '408629962',
      'bloodType': 'O+',
    },
  };

  void _login() {
    final username = _emailController.text.trim();
    final password = _passwordController.text.trim();

    if (users.containsKey(username) && users[username]!['password'] == password) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (_) => HomeScreen(userData: users[username]!),
        ),
      );
    } else {
      setState(() {
        error = 'بيانات الدخول غير صحيحة.';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('تسجيل الدخول')),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            TextField(
              controller: _emailController,
              decoration: InputDecoration(labelText: 'اسم المستخدم'),
            ),
            TextField(
              controller: _passwordController,
              obscureText: true,
              decoration: InputDecoration(labelText: 'كلمة المرور'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _login,
              child: Text('دخول'),
            ),
            SizedBox(height: 10),
            Text(error, style: TextStyle(color: Colors.red)),
          ],
        ),
      ),
    );
  }
}
