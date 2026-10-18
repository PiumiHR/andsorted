// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:go_router/go_router.dart';
//
// import '../../../app/theme/app_theme.dart';
// import '../../../core/widgets/design_system_widgets.dart';
// import '../../reminders/domain/entities/reminder.dart';
// import '../../reminders/presentation/reminders_provider.dart';
//
// class CreateReminderPage extends ConsumerStatefulWidget {
//   const CreateReminderPage({super.key});
//
//   @override
//   ConsumerState<CreateReminderPage> createState() => _CreateReminderPageState();
// }
//
// class _CreateReminderPageState extends ConsumerState<CreateReminderPage> {
//   final _titleController = TextEditingController();
//   final _noteController = TextEditingController();
//   DateTime _dueDate = DateTime(2026, 10, 30);
//   ReminderCategory _category = ReminderCategory.personal;
//
//   @override
//   void dispose() {
//     _titleController.dispose();
//     _noteController.dispose();
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         leading: IconButton(
//           tooltip: 'Close',
//           onPressed: context.pop,
//           icon: const Icon(Icons.close_rounded),
//         ),
//         title: const Text('New reminder'),
//       ),
//       body: SafeArea(
//         child: ListView(
//           padding: const EdgeInsets.fromLTRB(
//             AppSpacing.page,
//             12,
//             AppSpacing.page,
//             32,
//           ),
//           children: [
//             Text(
//               'What do you want to remember?',
//               style: Theme.of(context).textTheme.headlineSmall,
//             ),
//             const SizedBox(height: 8),
//             Text(
//               'Keep it simple. You can add more detail later.',
//               style: Theme.of(context).textTheme.bodyMedium,
//             ),
//             const SizedBox(height: 28),
//             TextField(
//               controller: _titleController,
//               autofocus: true,
//               textCapitalization: TextCapitalization.sentences,
//               decoration: const InputDecoration(
//                 hintText: 'e.g. Renew passport',
//                 labelText: 'Reminder',
//               ),
//             ),
//             const SizedBox(height: 20),
//             Text('Category', style: Theme.of(context).textTheme.titleMedium),
//             const SizedBox(height: 10),
//             Wrap(
//               spacing: 8,
//               runSpacing: 8,
//               children:
//                   ReminderCategory.values
//                       .map(
//                         (category) => ChoiceChip(
//                           label: Text(category.label),
//                           selected: _category == category,
//                           onSelected:
//                               (_) => setState(() => _category = category),
//                         ),
//                       )
//                       .toList(),
//             ),
//             const SizedBox(height: 20),
//             InkWell(
//               borderRadius: BorderRadius.circular(AppRadii.button),
//               onTap: _pickDate,
//               child: InputDecorator(
//                 decoration: const InputDecoration(labelText: 'Due date'),
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     Text(_formatDate(_dueDate)),
//                     const Icon(Icons.calendar_today_outlined, size: 20),
//                   ],
//                 ),
//               ),
//             ),
//             const SizedBox(height: 20),
//             TextField(
//               controller: _noteController,
//               maxLines: 3,
//               textCapitalization: TextCapitalization.sentences,
//               decoration: const InputDecoration(
//                 labelText: 'Note (optional)',
//                 hintText: 'Add useful context',
//               ),
//             ),
//             const SizedBox(height: 32),
//             AppPrimaryButton(label: 'Save reminder', onPressed: _save),
//           ],
//         ),
//       ),
//     );
//   }
//
//   Future<void> _pickDate() async {
//     final picked = await showDatePicker(
//       context: context,
//       firstDate: DateTime(2026),
//       lastDate: DateTime(2035),
//       initialDate: _dueDate,
//     );
//     if (picked != null) setState(() => _dueDate = picked);
//   }
//
//   void _save() {
//     final title = _titleController.text.trim();
//     if (title.isEmpty) {
//       ScaffoldMessenger.of(context).showSnackBar(
//         const SnackBar(content: Text('Add a title to save this reminder.')),
//       );
//       return;
//     }
//
//     ref
//         .read(remindersProvider.notifier)
//         .add(
//           Reminder(
//             id: DateTime.now().microsecondsSinceEpoch.toString(),
//             title: title,
//             dueDate: _dueDate,
//             category: _category,
//             note:
//                 _noteController.text.trim().isEmpty
//                     ? null
//                     : _noteController.text.trim(),
//           ),
//         );
//     context.pop();
//   }
//
//   String _formatDate(DateTime date) => '${date.day}/${date.month}/${date.year}';
// }
