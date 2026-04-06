import 'package:flutter/material.dart';

class TabItem {
  final String title;
  final IconData icon;

  TabItem({required this.title, required this.icon});
}

class TabData {
  static final List<TabItem> tabs = [
    TabItem(title: "Home", icon: Icons.home),
    TabItem(title: "Search", icon: Icons.search),
    TabItem(title: "Profile", icon: Icons.person),
  ];
}
