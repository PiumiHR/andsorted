import 'package:flutter/material.dart';
import 'package:sorted/features/category/pages/category_selection_screen.dart';
import 'package:sorted/shared/widgets/primary_button.dart';

import '../../../app/theme/app_theme.dart';
import '../../../shared/widgets/icon_bubblt.dart';

class DetailScreen extends StatelessWidget {
  const DetailScreen({super.key});
  Widget row(IconData i, String t, [String? sub]) => Padding(
    padding: const EdgeInsets.symmetric(vertical: 12),
    child: Row(
      children: [
        Icon(i, color: grey),
        const SizedBox(width: 16),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(t, style: const TextStyle(fontSize: 14)),
            if (sub != null)
              Text(sub, style: const TextStyle(color: grey, fontSize: 12)),
          ],
        ),
      ],
    ),
  );
  @override
  Widget build(BuildContext c) => Scaffold(
    appBar: AppBar(
      actions: [
        IconButton(
          icon: const Icon(Icons.more_vert),
          onPressed: () => Navigator.push(
            c,
            MaterialPageRoute(builder: (_) => const CategorySelectionScreen()),
          ),
        ),
      ],
    ),
    body: ListView(
      padding: const EdgeInsets.all(20),
      children: [
        const Align(
          alignment: Alignment.centerLeft,
          child: IconBubble(Icons.directions_car, secondary, size: 72),
        ),
        const SizedBox(height: 14),
        const Text(
          'Car insurance renewal',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8),
        Align(
          alignment: Alignment.centerLeft,
          child: Chip(
            avatar: const Icon(Icons.credit_card, size: 14, color: primary),
            label: const Text(
              'Payments',
              style: TextStyle(color: primary, fontSize: 12),
            ),
            backgroundColor: secondary,
            side: BorderSide.none,
            shape: const StadiumBorder(),
          ),
        ),
        row(Icons.calendar_today_outlined, 'Apr 28, 2025', 'In 10 days'),
        row(Icons.access_time, '10:00 AM'),
        row(Icons.repeat, 'Repeats yearly'),
        row(Icons.notifications_none, 'Notifications enabled'),
        const SizedBox(height: 8),
        const Text('Notes', style: TextStyle(color: grey, fontSize: 12)),
        const SizedBox(height: 4),
        const Text(
          'Renewal for my car insurance policy.\nPolicy number: 123456789.',
          style: TextStyle(color: grey, fontSize: 13),
        ),
        const SizedBox(height: 40),
        PrimaryButton('Mark as Completed', onTap: () => Navigator.pop(c)),
        const SizedBox(height: 12),
        PrimaryButton(
          'Delete',
          outlined: true,
          icon: Icons.delete_outline,
          onTap: () => Navigator.pop(c),
        ),
      ],
    ),
  );
}
