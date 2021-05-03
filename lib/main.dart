import 'package:flutter/material.dart';
import 'package:learn_http_lib/screens/http_listpage.dart';
//import 'package:learn_http_lib/screens/http_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fetch Data Example',
      home: HttpListPage(),
    );
  }
}
