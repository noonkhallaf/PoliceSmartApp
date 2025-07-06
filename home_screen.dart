import 'profile_page.dart';
import 'package:flutter/material.dart';
import 'posts_page.dart';
import 'emergency_report_page.dart';

class HomeScreen extends StatefulWidget {
  final Map<String, dynamic> userData;
  HomeScreen({required this.userData});
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;
  final List<Widget> _pages = [
    PostsPage(),
    EmergencyReportPage(),
    Center(child: Text('البلاغات القادمة')),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('الرئيسية')),
      body: _pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.article), label: 'المنشورات'),
          BottomNavigationBarItem(icon: Icon(Icons.warning), label: 'بلاغ طارئ'),
          BottomNavigationBarItem(icon: Icon(Icons.report), label: 'تقارير'),
        ],
        onTap: (index) {
          setState(() => _currentIndex = index);
        },
      ),
    );
  }
}