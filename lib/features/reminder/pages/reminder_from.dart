import 'package:flutter/material.dart';
import 'package:sorted/shared/widgets/primary_button.dart';

import '../../../app/theme/app_theme.dart';
import '../../../constants/app_constants.dart';
import '../../../shared/widgets/field_tile.dart';
import '../../datetime/pages/select_date_time_screen.dart';

class ReminderForm extends StatefulWidget {
  final bool edit;
  final int cat0;
  final String? sub;
  const ReminderForm({super.key, this.edit = false, this.cat0 = 0, this.sub});
  @override
  State<ReminderForm> createState() => _ReminderFormState();
}

class _ReminderFormState extends State<ReminderForm> {
  late int cat = widget.cat0;
  bool notify = true;
  late final title = TextEditingController(
    text: widget.edit ? 'Car insurance renewal' : (widget.sub ?? ''),
  );
  late final notes = TextEditingController(
    text: widget.edit
        ? 'Renewal for my car insurance policy.\nPolicy number: 123456789.'
        : '',
  );
  @override
  Widget build(BuildContext c) => Scaffold(
    appBar: AppBar(
      title: Text(
        widget.edit ? 'Edit Reminder' : 'Create Reminder',
        style: const TextStyle(fontSize: 17, fontWeight: FontWeight.w600),
      ),
    ),
    body: ListView(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      children: [
        label('Title', req: true),
        TextField(
          controller: title,
          decoration: InputDecoration(
            hintText: 'e.g. Car insurance renewal',
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
          ),
        ),
        label('Category'),
        Wrap(
          spacing: 10,
          runSpacing: 10,
          children: [
            for (var i = 0; i < categories.length; i++)
              GestureDetector(
                onTap: () => setState(() => cat = i),
                child: Container(
                  width: (MediaQuery.of(c).size.width - 60) / 3,
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  decoration: BoxDecoration(
                    color: cat == i ? secondary : bg,
                    borderRadius: BorderRadius.circular(14),
                    border: Border.all(
                      color: cat == i ? primary : Colors.transparent,
                    ),
                  ),
                  child: Column(
                    children: [
                      Icon(categories[i].icon, color: primary),
                      const SizedBox(height: 6),
                      Text(
                        categories[i].name,
                        style: const TextStyle(fontSize: 11),
                      ),
                    ],
                  ),
                ),
              ),
          ],
        ),
        if (widget.sub != null) ...[
          label('Type'),
          FieldTile(
            Icons.label_outline,
            widget.sub!,
            onTap: () => Navigator.pop(c),
          ),
        ],
        label('Date', req: true),
        FieldTile(
          Icons.calendar_today_outlined,
          'Apr 28, 2025',
          onTap: () => Navigator.push(
            c,
            MaterialPageRoute(builder: (_) => const SelectDateTimeScreen()),
          ),
        ),
        label('Time (optional)'),
        FieldTile(Icons.access_time, '10:00 AM'),
        label('Repeat'),
        FieldTile(Icons.repeat, widget.edit ? 'Yearly' : 'Does not repeat'),
        const SizedBox(height: 8),
        Row(
          children: [
            const Icon(Icons.notifications_none, color: grey),
            const SizedBox(width: 12),
            const Expanded(child: Text('Notifications')),
            Switch(
              value: notify,
              activeColor: primary,
              onChanged: (v) => setState(() => notify = v),
            ),
          ],
        ),
        label('Notes (optional)'),
        TextField(
          controller: notes,
          maxLines: 3,
          decoration: InputDecoration(
            hintText: 'Add any extra details...',
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
          ),
        ),
        const SizedBox(height: 20),
        PrimaryButton(
          widget.edit ? 'Save Changes' : 'Save Reminder',
          onTap: () => Navigator.popUntil(c, (r) => r.isFirst),
        ),
        const SizedBox(height: 20),
      ],
    ),
  );
}
