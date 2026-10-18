import 'package:flutter/material.dart';

import '../../app/theme/app_theme.dart' hide Reminder;
import '../../entities/reminder.dart';
import '../../features/reminder/pages/detail_screen.dart';
import 'icon_bubblt.dart';

class ReminderTile extends StatelessWidget {
  final Reminder r;
  const ReminderTile(this.r, {super.key});
  @override
  Widget build(BuildContext c) => ListTile(
    contentPadding: EdgeInsets.zero,
    leading: IconBubble(r.icon, r.color),
    title: Text(
      r.title,
      style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 14),
    ),
    subtitle: Text(r.sub, style: const TextStyle(color: grey, fontSize: 12)),
    trailing: const Icon(Icons.chevron_right, color: grey),
    onTap: () => Navigator.push(
      c,
      MaterialPageRoute(builder: (_) => const DetailScreen()),
    ),
  );
}
