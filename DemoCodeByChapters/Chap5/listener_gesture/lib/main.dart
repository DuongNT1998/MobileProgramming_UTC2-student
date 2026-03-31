import 'package:flutter/material.dart';

class PointerEventExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Listener(
          onPointerDown: (event) => print('Down: ${event.position}'),
          onPointerMove: (event) => print('Move: ${event.position}'),
          onPointerUp: (event) => print('Up: ${event.position}'),
          onPointerCancel: (event) => print('Canceled'),
          child: Container(
            width: 200,
            height: 200,
            color: Colors.lightBlueAccent,
            child: Center(child: Text('Touch Me')),
          ),
        ),
      ),
    );
  }
}
