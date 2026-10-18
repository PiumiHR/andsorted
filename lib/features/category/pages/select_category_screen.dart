import 'package:flutter/material.dart';
import 'package:sorted/shared/widgets/primary_button.dart';

import '../../../app/theme/app_theme.dart';
import '../../../constants/app_constants.dart';
import '../../../shared/widgets/icon_bubblt.dart';

class SelectCategoryScreen extends StatefulWidget {
  const SelectCategoryScreen({super.key});
  @override
  State<SelectCategoryScreen> createState() => _SelectCategoryScreenState();
}

class _SelectCategoryScreenState extends State<SelectCategoryScreen> {
  int sel = 0;
  static const tints = [
    secondary,
    successBg,
    errorBg,
    Color(0xFFFFEBDD),
    Color(0xFFECE7F8),
  ];
  @override
  Widget build(BuildContext c) => Scaffold(
    appBar: AppBar(
      title: const Text(
        'Select Category',
        style: TextStyle(fontSize: 17, fontWeight: FontWeight.w600),
      ),
    ),
    body: Column(
      children: [
        Expanded(
          child: ListView.separated(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            itemCount: categories.length,
            separatorBuilder: (_, __) =>
                const Divider(height: 1, color: Color(0xFFEEF2F6)),
            itemBuilder: (_, i) => ListTile(
              contentPadding: EdgeInsets.zero,
              leading: IconBubble(categories[i].icon, tints[i]),
              title: Text(
                categories[i].title,
                style: const TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 14,
                ),
              ),
              subtitle: Text(
                categories[i].subtitle,
                style: const TextStyle(color: grey, fontSize: 12),
              ),
              trailing: sel == i
                  ? const Icon(Icons.check_circle, color: primary)
                  : null,
              onTap: () => setState(() => sel = i),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(20),
          child: PrimaryButton('Continue', onTap: () => Navigator.pop(c)),
        ),
      ],
    ),
  );
}
