import '../entities/reminder.dart';

abstract interface class ReminderRepository {
  List<Reminder> getReminders();
  void saveReminder(Reminder reminder);
  void deleteReminder(String id);
}
