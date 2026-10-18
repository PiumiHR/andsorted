import 'package:flutter/material.dart';

import '../../../app/theme/app_theme.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});
  Widget item(IconData i, String t, [String? s]) => ListTile(
    leading: Icon(i, color: grey),
    title: Text(t, style: const TextStyle(fontSize: 14)),
    subtitle: s == null
        ? null
        : Text(s, style: const TextStyle(fontSize: 12, color: grey)),
    trailing: const Icon(Icons.chevron_right, color: grey),
  );
  @override
  Widget build(BuildContext c) => ListView(
    padding: const EdgeInsets.all(12),
    children: [
      const Padding(
        padding: EdgeInsets.all(8),
        child: Text(
          'Settings',
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
        ),
      ),
      ListTile(
        leading: const CircleAvatar(
          radius: 24,
          backgroundColor: secondary,
          child: Icon(Icons.person, color: primary),
        ),
        title: const Text(
          'Alex Carter',
          style: TextStyle(fontWeight: FontWeight.w600),
        ),
        subtitle: const Text(
          'alex@example.com',
          style: TextStyle(fontSize: 12, color: grey),
        ),
        trailing: const Icon(Icons.chevron_right, color: grey),
      ),
      const Divider(),
      item(
        Icons.notifications_none,
        'Notifications',
        'Manage reminder notifications',
      ),
      item(Icons.grid_view, 'Categories', 'Manage your categories'),
      item(Icons.dark_mode_outlined, 'Appearance', 'Light mode'),
      item(Icons.info_outline, 'About', 'App version 1.0.0'),
      const Divider(),
      item(Icons.shield_outlined, 'Help & Support'),
      item(Icons.lock_outline, 'Privacy Policy'),
    ],
  );
}
