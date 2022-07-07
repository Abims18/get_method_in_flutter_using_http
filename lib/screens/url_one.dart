import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter/material.dart';
import '../modals/single_user.dart';

Future<SingleUser> fetchData() async {
  final response = await http.get(Uri.parse("https://reqres.in/api/users/2"));

  if (response.statusCode == 200) {
    return SingleUser.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('Failed to load url');
  }
}

class UrlOne extends StatefulWidget {
  const UrlOne({Key? key}) : super(key: key);

  @override
  State<UrlOne> createState() => _UrlOneState();
}

class _UrlOneState extends State<UrlOne> {
  late Future<SingleUser> userDetails;

  @override
  void initState() {
    userDetails = fetchData();
    // posts = fetchDataTwo();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Fetch Data Example'),
        ),
        body: Center(
          child: FutureBuilder<SingleUser>(
            future: userDetails,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return SingleChildScrollView(
                  child: Column(
                    children: [
                      Text("${snapshot.data!.id}"),
                      Text("${snapshot.data!.email}"),
                      Text("${snapshot.data!.first_name} ${snapshot.data!.last_name}"),
                      Image.network(snapshot.data!.avatar!),
                      Text("${snapshot.data!.support}"),
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

