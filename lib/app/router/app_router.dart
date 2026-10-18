import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sorted/features/reminder/pages/all_reminders_screen.dart';

import '../../features/home/presentation/home_screen.dart';

final GoRouter appRouter = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(path: '/', builder: (context, state) => const HomeScreen()),
    GoRoute(
      path: '/allReminders',
      pageBuilder: (context, state) => const MaterialPage(
        fullscreenDialog: true,
        child: AllRemindersScreen(),
      ),
    ),
  ],
);
