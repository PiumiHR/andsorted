import 'package:flutter/material.dart';

import '../../../app/theme/app_theme.dart';
import '../../../constants/app_constants.dart';
import '../../../core/widgets/empty_screen.dart';
import '../../../shared/widgets/reminder_tile.dart';

class AllRemindersScreen extends StatefulWidget {
  const AllRemindersScreen({super.key});
  @override
  State<AllRemindersScreen> createState() => _AllRemindersScreenState();
}

class _AllRemindersScreenState extends State<AllRemindersScreen> {
  int f = 0;
  @override
  Widget build(BuildContext c) => Padding(
    padding: const EdgeInsets.all(20),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'All Reminders',
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 14),
        TextField(
          decoration: InputDecoration(
            hintText: 'Search reminders...',
            prefixIcon: const Icon(Icons.search),
            filled: true,
            fillColor: bg,
            contentPadding: EdgeInsets.zero,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(24),
              borderSide: BorderSide.none,
            ),
          ),
        ),
        const SizedBox(height: 12),
        Row(
          children: [
            for (var i = 0; i < 3; i++)
              Padding(
                padding: const EdgeInsets.only(right: 8),
                child: ChoiceChip(
                  label: Text(['All', 'Upcoming', 'Completed'][i]),
                  selected: f == i,
                  selectedColor: primary,
                  backgroundColor: bg,
                  labelStyle: TextStyle(
                    color: f == i ? Colors.white : grey,
                    fontSize: 12,
                  ),
                  showCheckmark: false,
                  side: BorderSide.none,
                  shape: const StadiumBorder(),
                  onSelected: (_) => setState(() => f = i),
                ),
              ),
          ],
        ),
        Expanded(
          child: f == 2
              ? const EmptyStateView()
              : ListView(children: reminders.map(ReminderTile.new).toList()),
        ),
      ],
    ),
  );
}
