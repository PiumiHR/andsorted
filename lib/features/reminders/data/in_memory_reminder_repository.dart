import '../domain/entities/reminder.dart';
import '../domain/repositories/reminder_repository.dart';

class InMemoryReminderRepository implements ReminderRepository {
  final List<Reminder> _reminders = [
    Reminder(
      id: 'rent',
      title: 'Pay apartment rent',
      dueDate: DateTime(2026, 10, 18),
      category: ReminderCategory.payment,
      note: 'Monthly payment',
    ),
    Reminder(
      id: 'insurance',
      title: 'Car insurance renewal',
      dueDate: DateTime(2026, 10, 24),
      category: ReminderCategory.renewal,
    ),
    Reminder(
      id: 'appointment',
      title: 'Dentist appointment',
      dueDate: DateTime(2026, 10, 28),
      category: ReminderCategory.health,
      note: 'Bring previous x-ray',
    ),
  ];

  @override
  List<Reminder> getReminders() => List.unmodifiable(_reminders);

  @override
  void saveReminder(Reminder reminder) {
    final index = _reminders.indexWhere((item) => item.id == reminder.id);
    if (index == -1) {
      _reminders.add(reminder);
    } else {
      _reminders[index] = reminder;
    }
  }

  @override
  void deleteReminder(String id) {
    _reminders.removeWhere((reminder) => reminder.id == id);
  }
}
