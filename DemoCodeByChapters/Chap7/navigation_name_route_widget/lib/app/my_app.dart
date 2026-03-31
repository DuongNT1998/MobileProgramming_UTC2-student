import 'package:flutter/material.dart';
import 'package:navigation_name_route_widget/views/detail_view.dart';
import 'package:navigation_name_route_widget/views/home_view.dart';
import 'package:navigation_name_route_widget/views/profile_view.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Named Routes Demo',

      routes: {
        '/': (context) => HomeView(),
        '/detail': (context) => DetailView(),
        '/profile': (context) => ProfileView(),
      },
      initialRoute: '/',

      debugShowCheckedModeBanner: false,
    );
  }
}
