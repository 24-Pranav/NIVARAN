import 'package:flutter/material.dart';
import 'package:nivaran/providers/document_provider.dart';
import 'package:nivaran/screens/splash_screen.dart';
import 'package:nivaran/utils/app_theme.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => DocumentProvider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Nivaran',
        theme: AppTheme.lightTheme,
        home: const SplashScreen(),
      ),
    );
  }
}
