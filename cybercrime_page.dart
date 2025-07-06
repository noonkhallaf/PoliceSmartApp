import 'package:flutter/material.dart';

class CyberCrimePage extends StatelessWidget {
  final _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16),
      child: Column(
        children: [
          Text('الإبلاغ عن جريمة إلكترونية', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          SizedBox(height: 10),
          TextField(
            controller: _controller,
            maxLines: 4,
            decoration: InputDecoration(
              hintText: 'وصف الجريمة أو رابط الموقع أو تفاصيل التهديد الإلكتروني...',
              border: OutlineInputBorder(),
            ),
          ),
          SizedBox(height: 10),
          ElevatedButton(
            onPressed: () => _submitCyberReport(context),
            child: Text('إرسال البلاغ'),
          )
        ],
      ),
    );
  }

  void _submitCyberReport(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('تم إرسال البلاغ الإلكتروني')),
    );
    _controller.clear();
  }
}