
import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  final String name;
  final String rank;
  final String militaryId;
  final String nationalId;
  final String bloodType;

  ProfilePage({
    required this.name,
    required this.rank,
    required this.militaryId,
    required this.nationalId,
    required this.bloodType,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('الملف الشخصي')),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('الاسم: $name', style: TextStyle(fontSize: 18)),
            Text('الرتبة: $rank', style: TextStyle(fontSize: 18)),
            Text('الرقم العسكري: $militaryId', style: TextStyle(fontSize: 18)),
            Text('رقم الهوية: $nationalId', style: TextStyle(fontSize: 18)),
            Text('فصيلة الدم: $bloodType', style: TextStyle(fontSize: 18)),
          ],
        ),
      ),
    );
  }
}
