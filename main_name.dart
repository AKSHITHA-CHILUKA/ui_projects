mport 'package:flutter/material.dart';

void main() {
runApp(const MyApp());
}

class MyApp extends StatelessWidget {
const MyApp({super.key});

// This widget is the root of your application.
@override
Widget build(BuildContext context) {
return MaterialApp(
home: Scaffold(
appBar: AppBar(
title: Text('Welcome to my page'),
),
body: Center(
child: Text(
'Akshitha!!',
style: TextStyle(fontSize: 24),
),
),
),
);
}
}
