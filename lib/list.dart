import 'package:flutter/material.dart';

class ListGenerate extends StatefulWidget {
  ListGenerate({super.key});
  List username = [
    {"username": "Mariam", "age": 20},
    {"username": "Ali", "age": 19},
    {"username": "Rabab", "age": 17},
  ];
  @override
  State<ListGenerate> createState() => _ListGenerateState();
}

class _ListGenerateState extends State<ListGenerate> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "List Generate",
          style: TextStyle(color: Colors.black54, fontSize: 20),
        ),
        elevation: 20,
        shadowColor: Colors.pinkAccent,
      ),
      body: ListView(
        children: List.generate(
          widget.username.length,
          (index) {
            return Card(
              child: ListTile(
                title: Text(widget.username[index]["username"]),
                subtitle: Text('Age: ${widget.username[index]["age"]}'),
              ),
            );
          },
        ),
      ),
    );
  }
}
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: ListGenerate());
  }
}

class ListGenerate extends StatefulWidget {
  ListGenerate({super.key});
 
  @override
  State<ListGenerate> createState() => _ListGenerateState();
}

class _ListGenerateState extends State<ListGenerate> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "SearchDelegate",
          style: TextStyle(color: Colors.black54, fontSize: 20),
        ),
        elevation: 20,
        shadowColor: Colors.pinkAccent,
        actions: [
         
        ],
      ),
      body: const SizedBox(),
    );
  }
}

class CustomSearch extends SearchDelegate {
  final List<String> users = ["Mariam", "Ali", "Rabab", "Sara", "Ahmed"];

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(onPressed: () => query = '', icon: const Icon(Icons.clear)),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () => close(context, null),
      icon: const Icon(Icons.arrow_back),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return Text("Result: $query");
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    if (query == "") {
      return InkWell(
        onTap: () {
          showResults(context);
        },
        child: Card(
          child: Padding(
            padding: EdgeInsets.all(18),
            child: ListView.builder(
              itemCount: users.length,
              itemBuilder: (context, i) {
                return Text("${users[i]}");
              },
            ),
          ),
        ),
      );
    } else {
      var filterlist = users
          .where((element) => element.contains(query))
          .toList();
      return InkWell(
        onTap: () {
          showResults(context);
        },
        child: Card(
          child: Padding(
            padding: EdgeInsets.all(18),
            child: ListView.builder(
              itemCount: filterlist.length,
              itemBuilder: (context, i) {
                return Text("${filterlist[i]}");
              },
            ),
          ),
        ),
      );
    }
  }
}

