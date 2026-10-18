import 'package:flutter/material.dart';
import 'package:sorted/constants/app_constants.dart';
import 'package:sorted/entities/category.dart';
import 'package:sorted/features/reminder/pages/reminder_from.dart';
import 'package:sorted/shared/widgets/primary_button.dart';

import '../../../app/theme/app_theme.dart';

class CategorySelectionScreen extends StatefulWidget {
  const CategorySelectionScreen({super.key});
  @override
  State<CategorySelectionScreen> createState() =>
      _CategorySelectionScreenState();
}

class _CategorySelectionScreenState extends State<CategorySelectionScreen> {
  int? cat;

  void pick(String s) => Navigator.push(
    context,
    MaterialPageRoute(
      builder: (_) => ReminderForm(cat0: cat!, sub: s),
    ),
  );

  Future<void> custom() async {
    final t = TextEditingController();
    final s = await showDialog<String>(
      context: context,
      builder: (d) => AlertDialog(
        title: const Text('Create your own'),
        content: TextField(
          controller: t,
          autofocus: true,
          decoration: const InputDecoration(hintText: 'e.g. Dog licence'),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(d),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () => Navigator.pop(d, t.text.trim()),
            child: const Text('Continue'),
          ),
        ],
      ),
    );
    if (s != null && s.isNotEmpty && mounted) pick(s);
  }

  Widget tile(SubCategory s) => Material(
    color: bg,
    borderRadius: BorderRadius.circular(16),
    child: InkWell(
      borderRadius: BorderRadius.circular(16),
      onTap: () => pick(s.name),
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(s.icon, color: primary, size: 28),
            const SizedBox(height: 8),
            Text(
              s.name,
              textAlign: TextAlign.center,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
            ),
          ],
        ),
      ),
    ),
  );

  @override
  Widget build(BuildContext c) {
    final page = cat == null ? null : categories[cat!];
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'New Reminder',
          style: TextStyle(fontSize: 17, fontWeight: FontWeight.w600),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          label('Category'),
          DropdownMenu<int>(
            expandedInsets: EdgeInsets.zero,
            hintText: 'Search or select a category',
            enableFilter: true,
            requestFocusOnTap: true,
            leadingIcon: Icon(
              cat == null ? Icons.search : categories[cat!].icon,
              color: primary,
            ),
            initialSelection: cat,
            inputDecorationTheme: InputDecorationTheme(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            dropdownMenuEntries: [
              for (var i = 0; i < categories.length; i++)
                DropdownMenuEntry(
                  value: i,
                  label: categories[i].name,
                  leadingIcon: Icon(categories[i].icon, color: primary),
                ),
            ],
            onSelected: (v) => setState(() => cat = v),
          ),
          if (page == null)
            const Padding(
              padding: EdgeInsets.only(top: 60),
              child: Center(
                child: Text(
                  'Pick a category to see your options.',
                  style: TextStyle(color: grey),
                ),
              ),
            )
          else ...[
            const SizedBox(height: 24),
            Text(
              page.title,
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 4),
            Text(page.subtitle, style: const TextStyle(color: grey)),
            for (final g in page.groups) ...[
              Padding(
                padding: const EdgeInsets.only(top: 22, bottom: 10),
                child: Text(
                  g.heading,
                  style: const TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 14,
                  ),
                ),
              ),
              GridView.count(
                crossAxisCount: 3,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
                children: g.items.map(tile).toList(),
              ),
            ],
            const SizedBox(height: 28),
            PrimaryButton(
              'Can\'t find it? Create your own',
              outlined: true,
              icon: Icons.edit_outlined,
              onTap: custom,
            ),
          ],
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}
