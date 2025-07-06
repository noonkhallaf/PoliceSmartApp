import 'package:flutter/material.dart';

class PostsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.all(16),
      children: [
        _buildPost('الإدارة', 'يرجى أخذ الحيطة خلال المناوبة القادمة.', true),
        _buildPost('الشرطي محمد', 'تم ضبط حالة شغب في المنطقة الجنوبية.', false),
      ],
    );
  }

  Widget _buildPost(String sender, String content, bool isAdmin) {
    return Card(
      color: isAdmin ? Colors.indigo.shade50 : Colors.white,
      child: ListTile(
        title: Text(sender, style: TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text(content),
        trailing: Icon(Icons.comment),
      ),
    );
  }
}