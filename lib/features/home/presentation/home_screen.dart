import 'package:flutter/material.dart';

import '../../../app/theme/app_theme.dart';
import '../../../constants/app_constants.dart';
import '../../../shared/widgets/reminder_tile.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  Widget stat(String n, String l, Color bgc, Color fg) => Expanded(
    child: Container(
      margin: const EdgeInsets.symmetric(horizontal: 4),
      padding: const EdgeInsets.symmetric(vertical: 16),
      decoration: BoxDecoration(
        color: bgc,
        borderRadius: BorderRadius.circular(14),
      ),
      child: Column(
        children: [
          Text(
            n,
            style: TextStyle(
              fontSize: 26,
              fontWeight: FontWeight.bold,
              color: fg,
            ),
          ),
          Text(l, style: TextStyle(fontSize: 11, color: fg)),
        ],
      ),
    ),
  );
  Widget head(String t, {bool all = false}) => Padding(
    padding: const EdgeInsets.only(top: 20, bottom: 4),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          t,
          style: const TextStyle(fontWeight: FontWeight.w700, fontSize: 16),
        ),
        if (all)
          const Text('See all', style: TextStyle(color: primary, fontSize: 12)),
      ],
    ),
  );
  @override
  Widget build(BuildContext c) => ListView(
    padding: const EdgeInsets.all(20),
    children: [
      Row(
        children: [
          const Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Good morning,', style: TextStyle(color: grey)),
                Text(
                  'Alex ☀️',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          const CircleAvatar(
            radius: 20,
            backgroundColor: secondary,
            child: Icon(Icons.person, color: primary),
          ),
        ],
      ),
      head('Upcoming', all: true),
      Row(
        children: [
          stat('5', 'Today', secondary, primary),
          stat('2', 'This week', successBg, const Color(0xFF2E7D5B)),
          stat('1', 'Overdue', errorBg, Colors.red),
        ],
      ),
      head('Due soon'),
      ...reminders.take(3).map(ReminderTile.new),
      head('Upcoming'),
      ...reminders.skip(3).take(2).map(ReminderTile.new),
      const SizedBox(height: 60),
    ],
  );
}
