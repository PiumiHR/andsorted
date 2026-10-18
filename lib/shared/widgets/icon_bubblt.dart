import 'package:flutter/material.dart';

import '../../app/theme/app_theme.dart';

class IconBubble extends StatelessWidget {
  final IconData icon;
  final Color bgc;
  final double size;
  const IconBubble(this.icon, this.bgc, {super.key, this.size = 44});
  @override
  Widget build(BuildContext c) => Container(
    width: size,
    height: size,
    decoration: BoxDecoration(color: bgc, shape: BoxShape.circle),
    child: Icon(icon, color: primary, size: size * .5),
  );
}
