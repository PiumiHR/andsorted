import 'package:flutter/material.dart';
import 'package:sorted/shared/widgets/primary_button.dart';

import '../../app/theme/app_theme.dart';
import '../../features/reminder/pages/reminder_from.dart';

class EmptyStateView extends StatelessWidget {
  const EmptyStateView({super.key});
  @override
  Widget build(BuildContext c) => Center(
    child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: 140,
          height: 140,
          decoration: const BoxDecoration(
            color: secondary,
            shape: BoxShape.circle,
          ),
          child: const Icon(Icons.event_available, size: 64, color: primary),
        ),
        const SizedBox(height: 24),
        const Text(
          'No reminders yet',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8),
        const Text(
          'Create your first reminder and\nnever miss what matters.',
          textAlign: TextAlign.center,
          style: TextStyle(color: grey),
        ),
        const SizedBox(height: 24),
        SizedBox(
          width: 200,
          child: PrimaryButton(
            'Add Reminder',
            onTap: () => Navigator.push(
              c,
              MaterialPageRoute(builder: (_) => const ReminderForm()),
            ),
          ),
        ),
      ],
    ),
  );
}

// Standalone empty screen (screen 9) if you want it as its own route
class EmptyScreen extends StatelessWidget {
  const EmptyScreen({super.key});
  @override
  Widget build(BuildContext c) =>
      const Scaffold(body: SafeArea(child: EmptyStateView()));
}
