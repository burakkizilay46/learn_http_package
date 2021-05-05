import 'package:flutter/material.dart';
import 'package:learn_http_lib/screens/http_page.dart';

import 'http_listpage.dart';

class HomePage extends StatelessWidget {
  const HomePage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(centerTitle: true, title: Text("Http Packages")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => HttpPage()));
                },
                child: Text("One Data")),
            ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => HttpListPage()),
                  );
                },
                child: Text("Data List")),
          ],
        ),
      ),
    );
  }
}
