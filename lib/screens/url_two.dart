import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../modals/users.dart';

Future<Users> fetchData() async {
  final response = await http.get(Uri.parse("https://reqres.in/api/users?delay=3"));

  if (response.statusCode == 200) {
    return Users.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('Failed to load url');
  }
}

class UrlTwo extends StatefulWidget {
  const UrlTwo({Key? key}) : super(key: key);

  @override
  State<UrlTwo> createState() => _UrlTwoState();
}

class _UrlTwoState extends State<UrlTwo> {
  late Future<Users> posts;

  @override
  void initState() {
    posts = fetchData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Fetching data from URL 2'),
        ),
        body: Center(
          child: FutureBuilder<Users>(
            future: posts,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return SingleChildScrollView(
                  child: Column(
                    children: [
                      Text("${snapshot.data!.page}"),
                      Text("${snapshot.data!.email}"),
                      Text("${snapshot.data!.first_name} ${snapshot.data!.last_name}"),
                      Image.network(snapshot.data!.avatar!),
                    ],
                  ),
                );
              } else if (snapshot.hasError) {
                return Text('${snapshot.error}');
              }
              // By default, show a loading spinner.
              return const CircularProgressIndicator();
            },
          ),
        ),
      ),
    );
  }
}
