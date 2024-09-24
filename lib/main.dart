import 'package:flutter/material.dart';
import 'package:viksera/config/themes/app_themes.dart';
import 'package:viksera/features/home/presentation/screens/business_owner_home/buisiness_owner_home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Viksera',
      theme: AppThemes.buildThemeData(),
      home: const BusinessOwnerHomeScreen(),
    );
  }
}
