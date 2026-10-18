import 'package:flutter/material.dart';

import '../../../app/theme/app_theme.dart';
import '../../../shared/widgets/field_tile.dart';
import '../../../shared/widgets/primary_button.dart';

class SelectDateTimeScreen extends StatefulWidget {
  const SelectDateTimeScreen({super.key});
  @override
  State<SelectDateTimeScreen> createState() => _SelectDateTimeScreenState();
}

class _SelectDateTimeScreenState extends State<SelectDateTimeScreen> {
  int day = 28;
  @override
  Widget build(BuildContext c) {
    // April 2025 starts on Tuesday -> 2 leading days from March (30, 31)
    final cells = <int?>[-30, -31, ...List.generate(30, (i) => i + 1)];
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Select Date & Time',
          style: TextStyle(fontSize: 17, fontWeight: FontWeight.w600),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Icon(Icons.chevron_left, color: grey),
                Text(
                  'April 2025',
                  style: TextStyle(fontWeight: FontWeight.w600),
                ),
                Icon(Icons.chevron_right, color: grey),
              ],
            ),
            const SizedBox(height: 12),
            Row(
              children: [
                for (final d in [
                  'Sun',
                  'Mon',
                  'Tue',
                  'Wed',
                  'Thu',
                  'Fri',
                  'Sat',
                ])
                  Expanded(
                    child: Center(
                      child: Text(
                        d,
                        style: const TextStyle(fontSize: 11, color: grey),
                      ),
                    ),
                  ),
              ],
            ),
            GridView.count(
              crossAxisCount: 7,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              children: [
                for (final d in cells)
                  if (d! < 0)
                    Center(
                      child: Text(
                        '${-d}',
                        style: const TextStyle(color: Color(0xFFCBD5E1)),
                      ),
                    )
                  else
                    GestureDetector(
                      onTap: () => setState(() => day = d),
                      child: Container(
                        margin: const EdgeInsets.all(4),
                        decoration: BoxDecoration(
                          color: day == d ? primary : null,
                          shape: BoxShape.circle,
                        ),
                        alignment: Alignment.center,
                        child: Text(
                          '$d',
                          style: TextStyle(
                            fontSize: 13,
                            color: day == d ? Colors.white : ink,
                          ),
                        ),
                      ),
                    ),
              ],
            ),
            const SizedBox(height: 16),
            const Text('Time', style: TextStyle(fontWeight: FontWeight.w600)),
            const SizedBox(height: 8),
            FieldTile(
              Icons.access_time,
              '10:00 AM',
              onTap: () => showTimePicker(
                context: c,
                initialTime: const TimeOfDay(hour: 10, minute: 0),
              ),
            ),
            const Spacer(),
            PrimaryButton('Done', onTap: () => Navigator.pop(c)),
          ],
        ),
      ),
    );
  }
}
