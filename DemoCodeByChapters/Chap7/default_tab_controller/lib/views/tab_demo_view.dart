import 'package:flutter/material.dart';
import '../widgets/tab_content.dart';
import '../utils/tab_data.dart';

class TabDemoView extends StatelessWidget {
  const TabDemoView({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: TabData.tabs.length,
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Tab Demo"),
          bottom: TabBar(
            tabs: TabData.tabs.map((tab) {
              return Tab(icon: Icon(tab.icon), text: tab.title);
            }).toList(),
          ),
        ),
        body: TabBarView(
          children: TabData.tabs.map((tab) {
            return TabContent(title: tab.title, icon: tab.icon);
          }).toList(),
        ),
      ),
    );
  }
}
