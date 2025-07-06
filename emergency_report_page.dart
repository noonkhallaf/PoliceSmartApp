import 'package:flutter/material.dart';

class EmergencyReportPage extends StatelessWidget {
  final _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16),
      child: Column(
        children: [
          TextField(
            controller: _controller,
            maxLines: 4,
            decoration: InputDecoration(
              hintText: 'اكتب تفاصيل الحالة الطارئة هنا...',
              border: OutlineInputBorder(),
            ),
          ),
          SizedBox(height: 10),
          ElevatedButton.icon(
            onPressed: () => _submitReport(context),
            icon: Icon(Icons.send),
            label: Text('إرسال البلاغ'),
          ),
        ],
      ),
    );
  }

  void _submitReport(BuildContext context) {
    // سيتم لاحقًا رفع البلاغ إلى قاعدة البيانات
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('تم إرسال البلاغ بنجاح')),
    );
    _controller.clear();
  }
}