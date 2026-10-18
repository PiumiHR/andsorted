import 'package:flutter/material.dart';

class SubCategory {
  final String name;
  final IconData icon;
  const SubCategory(this.name, this.icon);
}

class Group {
  final String heading;
  final List<SubCategory> items;
  const Group(this.heading, this.items);
}

class MainCategory {
  final String name; // shown in the dropdown
  final String desc; // short description for lists
  final IconData icon; // main category icon
  final String title, subtitle; // page heading above the subcategory grid
  final List<Group> groups;
  const MainCategory({
    required this.name,
    required this.desc,
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.groups,
  });
}
