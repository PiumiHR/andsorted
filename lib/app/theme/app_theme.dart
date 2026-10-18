// ---------- Palette ----------
import 'package:flutter/material.dart';

const primary = Color(0xFF5C9EC1);
const secondary = Color(0xFFE7F2F9);
const bg = Color(0xFFF5F7FA);
const ink = Color(0xFF1F2937);
const grey = Color(0xFF64748B);
const successBg = Color(0xFFE6F4EE);
const errorBg = Color(0xFFFFE7E7);

// ---------- Shared widgets ----------

Widget label(String t, {bool req = false}) => Padding(
  padding: const EdgeInsets.only(top: 16, bottom: 6),
  child: Text.rich(
    TextSpan(
      text: t,
      style: const TextStyle(fontSize: 12, color: grey),
      children: [
        if (req)
          const TextSpan(
            text: ' *',
            style: TextStyle(color: Colors.red),
          ),
      ],
    ),
  ),
);
