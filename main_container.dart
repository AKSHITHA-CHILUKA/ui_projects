import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Row Layout Example'),
        ),
        body: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(20),
              color: Colors.red,
              child: Text('Item 1'),
            ),
            Container(
              padding: EdgeInsets.all(20),
              color: Colors.green,
              child: Text('Item 2'),
            ),
            Container(
              padding: EdgeInsets.all(20),
              color: Colors.blue,
              child: Text('Item'),
            ),
          ],
        ),
      ),
    );
  }
}
