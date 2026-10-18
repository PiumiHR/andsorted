import 'package:flutter/material.dart';
import 'package:sorted/app/theme/app_theme.dart';

import '../features/splash/splash_screen.dart';

class MindfulApp extends StatelessWidget {
  const MindfulApp({super.key});
  @override
  Widget build(BuildContext c) => MaterialApp(
    debugShowCheckedModeBanner: false,
    title: 'mindful',
    theme: ThemeData(
      useMaterial3: true,
      scaffoldBackgroundColor: Colors.white,
      colorScheme: ColorScheme.fromSeed(seedColor: primary, primary: primary),
      appBarTheme: const AppBarTheme(
        backgroundColor: Colors.white,
        elevation: 0,
        scrolledUnderElevation: 0,
        foregroundColor: ink,
      ),
    ),
    home: const SplashScreen(),
  );
}
