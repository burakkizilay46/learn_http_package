import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';
import 'package:learn_http_lib/models/album_model.dart';

Future<List<Album>> fetchAlbums(http.Client client) async {
  final response = await client
      .get(Uri.parse('https://jsonplaceholder.typicode.com/albums'));

  // Use the compute function to run parsePhotos in a separate isolate.
  return compute(parseAlbums, response.body);
}

List<Album> parseAlbums(String responseBody) {
  final parsed = jsonDecode(responseBody).cast<Map<String, dynamic>>();

  return parsed.map<Album>((json) => Album.fromJson(json)).toList();
}

class HttpListPage extends StatelessWidget {
  const HttpListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Http Data List Page"),
      ),
      body: FutureBuilder<List<Album>>(
        future: fetchAlbums(http.Client()),
        builder: (context, snapshot) {
          if (snapshot.hasError) print(snapshot.error);
          return snapshot.hasData
              ? DataList(albums: snapshot.data!.toList())
              : Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}

class DataList extends StatelessWidget {
  final List<Album> albums;

  const DataList({Key? key, required this.albums}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: albums.length,
        itemBuilder: (context, index) {
          return Card(
            child: ListTile(
              title: Text(albums[index].title),
              subtitle: Text(albums[index].id.toString()),
              trailing: Text(albums[index].userId.toString()),
            ),
          );
        });
  }
}

//PhotosList(photos: snapshot.data)
