
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';

class FirebaseNotificationHandler {
  static Future<void> initializeFCM(BuildContext context) async {
    FirebaseMessaging messaging = FirebaseMessaging.instance;

    // طلب صلاحيات الإشعارات
    NotificationSettings settings = await messaging.requestPermission(
      alert: true,
      badge: true,
      sound: true,
    );

    // الحصول على التوكن
    String? token = await messaging.getToken();
    print("FCM Token: \$token");

    // عند استلام الإشعار والتطبيق مفتوح
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      _showAlert(context, message);
    });

    // عند الضغط على الإشعار والتطبيق بالخلفية
    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      _showAlert(context, message);
    });
  }

  static void _showAlert(BuildContext context, RemoteMessage message) {
    final title = message.notification?.title ?? 'تنبيه';
    final body = message.notification?.body ?? '';
    final isHighPriority = message.data['from'] == 'admin';

    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: Text(
          title,
          style: TextStyle(
            color: isHighPriority ? Colors.red : Colors.black,
          ),
        ),
        content: Text(body),
        actions: [
          TextButton(
            child: Text('تم'),
            onPressed: () => Navigator.of(context).pop(),
          ),
        ],
      ),
    );
  }
}
