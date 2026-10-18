import 'package:flutter/material.dart';
import 'package:sorted/features/category/pages/category_selection_screen.dart';
import 'package:sorted/shared/widgets/primary_button.dart';

import '../../app/theme/app_theme.dart';
import '../home/presentation/home_screen.dart';
import '../reminder/pages/all_reminders_screen.dart';
import '../settings/pages/setting_screen.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});
  @override
  Widget build(BuildContext c) => Scaffold(
    body: SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [
            const Spacer(flex: 3),
            GridView.count(
              crossAxisCount: 2,
              shrinkWrap: true,
              mainAxisSpacing: 4,
              crossAxisSpacing: 4,
              padding: const EdgeInsets.symmetric(horizontal: 130),
              children: const [
                _Sq(primary),
                _Sq(Color(0xFF7FB5D3)),
                _Sq(Color(0xFF7FB5D3)),
                _Sq(primary),
              ],
            ),
            const Text(
              'mindful',
              style: TextStyle(
                fontSize: 40,
                fontWeight: FontWeight.w600,
                color: ink,
              ),
            ),
            const SizedBox(height: 12),
            const Text(
              'All your important things,\nin one place.',
              textAlign: TextAlign.center,
              style: TextStyle(color: grey),
            ),
            const Spacer(flex: 4),
            PrimaryButton(
              'Get Started',
              onTap: () => Navigator.pushReplacement(
                c,
                MaterialPageRoute(builder: (_) => const Shell()),
              ),
            ),
            TextButton(
              onPressed: () => Navigator.pushReplacement(
                c,
                MaterialPageRoute(builder: (_) => const Shell()),
              ),
              child: const Text('Sign In', style: TextStyle(color: primary)),
            ),
          ],
        ),
      ),
    ),
  );
}

class _Sq extends StatelessWidget {
  final Color c;
  const _Sq(this.c);
  @override
  Widget build(BuildContext x) => Container(
    decoration: BoxDecoration(
      color: c,
      borderRadius: BorderRadius.circular(10),
    ),
  );
}

// ---------- Shell with bottom nav ----------
class Shell extends StatefulWidget {
  const Shell({super.key});
  @override
  State<Shell> createState() => _ShellState();
}

class _ShellState extends State<Shell> {
  int i = 0;
  @override
  Widget build(BuildContext c) => Scaffold(
    body: SafeArea(
      child: [
        const HomeScreen(),
        const AllRemindersScreen(),
        const SettingsScreen(),
      ][i],
    ),
    floatingActionButton: i == 2
        ? null
        : FloatingActionButton(
            backgroundColor: primary,
            shape: const CircleBorder(),
            onPressed: () => Navigator.push(
              c,
              MaterialPageRoute(
                builder: (_) => const CategorySelectionScreen(),
              ),
            ),
            child: const Icon(Icons.add, color: Colors.white),
          ),
    bottomNavigationBar: NavigationBar(
      backgroundColor: Colors.white,
      indicatorColor: Colors.transparent,
      selectedIndex: i,
      onDestinationSelected: (v) => setState(() => i = v),
      destinations: const [
        NavigationDestination(
          icon: Icon(Icons.home_outlined),
          selectedIcon: Icon(Icons.home, color: primary),
          label: 'Home',
        ),
        NavigationDestination(
          icon: Icon(Icons.grid_view),
          selectedIcon: Icon(Icons.grid_view_rounded, color: primary),
          label: 'All',
        ),
        NavigationDestination(
          icon: Icon(Icons.settings_outlined),
          selectedIcon: Icon(Icons.settings, color: primary),
          label: 'Settings',
        ),
      ],
    ),
  );
}
