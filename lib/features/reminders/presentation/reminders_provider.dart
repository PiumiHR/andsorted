import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../data/in_memory_reminder_repository.dart';
import '../domain/entities/reminder.dart';
import '../domain/repositories/reminder_repository.dart';

final reminderRepositoryProvider = Provider<ReminderRepository>(
  (ref) => InMemoryReminderRepository(),
);

final remindersProvider = NotifierProvider<RemindersController, List<Reminder>>(
  RemindersController.new,
);

class RemindersController extends Notifier<List<Reminder>> {
  ReminderRepository get _repository => ref.read(reminderRepositoryProvider);

  @override
  List<Reminder> build() => _sorted(_repository.getReminders());

  void add(Reminder reminder) {
    _repository.saveReminder(reminder);
    state = _sorted(_repository.getReminders());
  }

  void toggle(String id) {
    final reminder = state.firstWhere((item) => item.id == id);
    _repository.saveReminder(
      reminder.copyWith(isCompleted: !reminder.isCompleted),
    );
    state = _sorted(_repository.getReminders());
  }

  void delete(String id) {
    _repository.deleteReminder(id);
    state = _sorted(_repository.getReminders());
  }

  List<Reminder> _sorted(List<Reminder> reminders) {
    return [...reminders]..sort((a, b) => a.dueDate.compareTo(b.dueDate));
  }
}
