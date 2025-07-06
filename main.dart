import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'firebase_messaging_setup.dart';
import 'login_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(PoliceSmartApp());
}

class PoliceSmartApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    FirebaseNotificationHandler.initializeFCM(context);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'PoliceSmart',
      theme: ThemeData(
        primarySwatch: Colors.indigo,
      ),
      home: LoginScreen(),
    );
  }
}