import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List data = [];
  bool loading = false;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text(
            "package",
            style: TextStyle(color: Colors.black54, fontSize: 20),
          ),
          elevation: 20,
          shadowColor: Colors.pinkAccent,
        ),
        body: ListView(
          children: [
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 10),
              child: MaterialButton(
                color: Colors.pinkAccent,
                textColor: Colors.white12,
                onPressed: () async {
                  loading = true;
                  setState(() {});
                  final response = await get(
                    Uri.parse("https://jsonplaceholder.typicode.com/posts"),
                  );
                  final responseBody = jsonDecode(response.body);
                  data.addAll(responseBody);
                  loading = false;
                  setState(() {});
                },
                child: const Text('Http Request'),
              ),
            ),
            if (loading)
              Center(child: CircularProgressIndicator()),
            ...List.generate(
              data.length,
              (index) =>
                  Card(child: ListTile(title: Text("${data[index]['title']}"))),
            ),
          ],
        ),
      ),
    );
  }
}
