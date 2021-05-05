import 'package:flutter/material.dart';
import 'package:learn_http_lib/screens/home_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fetch Data Example',
      home: HomePage(),
    );
  }
}
