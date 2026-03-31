import 'package:flutter/material.dart';
import '../widgets/main_button.dart';
import '../utils/route_names.dart';

class DetailView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final String message = ModalRoute.of(context)!.settings.arguments as String;
    ;

    return Scaffold(
      appBar: AppBar(title: Text('Detail Screen')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(message, style: TextStyle(fontSize: 24)),
            MainButton(
              title: 'Go to Profile',
              onPressed: () {
                Navigator.pushNamed(context, '/profile');
              },
            ),
            SizedBox(height: 20),
            MainButton(
              title: 'Back to Home',
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}
