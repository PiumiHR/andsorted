import 'package:flutter/material.dart';

import '../../app/theme/app_theme.dart';

class PrimaryButton extends StatelessWidget {
  final String text;
  final VoidCallback? onTap;
  final bool outlined;
  final IconData? icon;
  const PrimaryButton(
    this.text, {
    super.key,
    this.onTap,
    this.outlined = false,
    this.icon,
  });
  @override
  Widget build(BuildContext c) => SizedBox(
    width: double.infinity,
    height: 50,
    child: outlined
        ? OutlinedButton.icon(
            onPressed: onTap,
            icon: Icon(icon, size: 18, color: grey),
            label: Text(text, style: const TextStyle(color: ink)),
            style: OutlinedButton.styleFrom(
              shape: const StadiumBorder(),
              side: const BorderSide(color: Color(0xFFE2E8F0)),
            ),
          )
        : ElevatedButton(
            onPressed: onTap,
            style: ElevatedButton.styleFrom(
              backgroundColor: primary,
              foregroundColor: Colors.white,
              elevation: 0,
              shape: const StadiumBorder(),
            ),
            child: Text(
              text,
              style: const TextStyle(fontWeight: FontWeight.w600),
            ),
          ),
  );
}
