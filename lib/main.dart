import 'package:flutter/material.dart';
import 'package:viksera/config/routes/routes.dart';
import 'package:viksera/config/themes/app_themes.dart';
import 'features/home/presentation/screens/business_owner_search/business_owner_search_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'Viksera',
      theme: AppThemes.buildThemeData(),
      routerConfig: router,
    );
  }
}
