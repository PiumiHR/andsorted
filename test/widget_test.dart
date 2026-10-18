import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sorted/app/app.dart';
import 'package:sorted/core/widgets/design_system_widgets.dart';

void main() {
  testWidgets('shows upcoming reminders', (tester) async {
    await tester.pumpWidget(const ProviderScope(child: ReminderApp()));

    expect(find.text('Stay on top of life.'), findsOneWidget);
    expect(find.text('Pay apartment rent'), findsOneWidget);
    expect(find.text('New reminder'), findsOneWidget);
  });

  testWidgets('creates a reminder from the primary action', (tester) async {
    await tester.pumpWidget(const ProviderScope(child: ReminderApp()));
    await tester.tap(find.text('New reminder'));
    await tester.pumpAndSettle();

    expect(find.text('What do you want to remember?'), findsOneWidget);
    await tester.enterText(find.byType(TextField).first, 'Renew passport');
    expect(find.text('Renew passport'), findsOneWidget);
    tester.testTextInput.hide();
    await tester.pump();
    await tester.ensureVisible(find.byType(AppPrimaryButton));
    await tester.tap(find.byType(AppPrimaryButton));
    await tester.pumpAndSettle();

    expect(find.text('What do you want to remember?'), findsNothing);
    await tester.drag(find.byType(CustomScrollView), const Offset(0, -500));
    await tester.pumpAndSettle();
    expect(find.text('Renew passport'), findsOneWidget);
  });
}
