enum ReminderCategory { payment, renewal, health, personal }

extension ReminderCategoryLabel on ReminderCategory {
  String get label => switch (this) {
    ReminderCategory.payment => 'Payment',
    ReminderCategory.renewal => 'Renewal',
    ReminderCategory.health => 'Health',
    ReminderCategory.personal => 'Personal',
  };

  String get icon => switch (this) {
    ReminderCategory.payment => '€',
    ReminderCategory.renewal => '↻',
    ReminderCategory.health => '＋',
    ReminderCategory.personal => '✓',
  };
}

class Reminder {
  const Reminder({
    required this.id,
    required this.title,
    required this.dueDate,
    required this.category,
    this.note,
    this.isCompleted = false,
  });

  final String id;
  final String title;
  final DateTime dueDate;
  final ReminderCategory category;
  final String? note;
  final bool isCompleted;

  Reminder copyWith({
    String? title,
    DateTime? dueDate,
    ReminderCategory? category,
    String? note,
    bool? isCompleted,
  }) {
    return Reminder(
      id: id,
      title: title ?? this.title,
      dueDate: dueDate ?? this.dueDate,
      category: category ?? this.category,
      note: note ?? this.note,
      isCompleted: isCompleted ?? this.isCompleted,
    );
  }
}
