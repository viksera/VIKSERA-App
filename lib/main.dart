import 'package:flutter/material.dart';
import 'package:viksera/home/presentation/screens/business_owner_home/buisiness_owner_home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Viksera',
      home: const BusinessOwnerHomeScreen(),
    );
  }
}
