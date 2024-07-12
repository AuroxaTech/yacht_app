import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yacht_app/views/auth_screens/welcome_screen.dart';
import 'package:yacht_app/views/booking_screen/booking_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Yacht',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      home:  const BookingScreen()
    );
  }
}

