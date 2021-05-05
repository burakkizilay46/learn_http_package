import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';
import 'package:learn_http_lib/models/album_model.dart';

Future<Album> fetchAlbum() async {
  final response =
      await http.get(Uri.https('jsonplaceholder.typicode.com', 'albums/1'));

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON
    return Album.fromJson(jsonDecode(response.body));
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load album');
  }
}

class HttpPage extends StatefulWidget {
  @override
  _HttpPageState createState() => _HttpPageState();
}

class _HttpPageState extends State<HttpPage> {
  late Future<Album> futureAlbum;

  @override
  void initState() {
    super.initState();
    futureAlbum = fetchAlbum();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("HTTP 1 Data Page"),
      ),
      body: Center(
        child: FutureBuilder<Album>(
            future: futureAlbum,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                        snapshot.data!.title),
                        Text(
                        snapshot.data!.id.toString()),
                  ],
                ); 
              } else if (snapshot.hasError) {
                return Text("${snapshot.error}");
              }

              return CircularProgressIndicator();
            }),
      ),
    );
  }
}
