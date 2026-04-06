import 'package:flutter/material.dart';

class TabContent extends StatelessWidget {
  final String title;
  final IconData icon;

  const TabContent({super.key, required this.title, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, size: 80),
          const SizedBox(height: 20),
          Text(title, style: const TextStyle(fontSize: 24)),
        ],
      ),
    );
  }
}
