import 'package:flutter/material.dart';

import '../../app/theme/app_theme.dart';

class FieldTile extends StatelessWidget {
  final IconData icon;
  final String text;
  final VoidCallback? onTap;
  const FieldTile(this.icon, this.text, {super.key, this.onTap});
  @override
  Widget build(BuildContext c) => InkWell(
    onTap: onTap,
    borderRadius: BorderRadius.circular(12),
    child: Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 14),
      decoration: BoxDecoration(
        border: Border.all(color: const Color(0xFFE2E8F0)),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Icon(icon, size: 20, color: grey),
          const SizedBox(width: 12),
          Expanded(child: Text(text, style: const TextStyle(fontSize: 14))),
          const Icon(Icons.chevron_right, size: 20, color: grey),
        ],
      ),
    ),
  );
}
