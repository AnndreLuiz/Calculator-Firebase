import 'package:calculator_app/myapp.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp();

  final fcmToken = await FirebaseMessaging.instance.getToken();

  print(fcmToken);

  FirebaseMessaging.instance.onTokenRefresh.listen((fcmToken) {
    print('Push Notification recived');
  }).onError((err) {
    print(err);
  });
  runApp(const MyApp());
}
