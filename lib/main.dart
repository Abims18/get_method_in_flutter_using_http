import 'package:api_task_get_method/post_method.dart';
import 'package:api_task_get_method/screens/url_one.dart';
import 'package:api_task_get_method/screens/url_two.dart';
import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Fetch Data Example',
        theme: ThemeData(
          primarySwatch: Colors.amber,
        ),
        home: Scaffold(
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Builder(
                  builder: (context) => ElevatedButton(
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(
                              builder: (context) => UrlOne()));
                    },
                    child: Text('Get data from URL 1'),
                  ),
                ),
                Builder(
                  builder: (context) => ElevatedButton(
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(
                              builder: (context) => UrlTwo()));
                    },
                    child: Text('Get data from URL 2'),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
