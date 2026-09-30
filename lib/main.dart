/*import 'package:flutter/material.dart';
//import 'package:drop_down_list/drop_down_list.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => MyAppState();
}

class MyAppState extends State<MyApp> {
  String? selectedcity="jordan";
  List<String> cities = ["Syria", "Turkey", "Egypt"];
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text(
            "Repository",
            style: TextStyle(
              color: Colors.black54,
              fontSize: 40,
              fontWeight: FontWeight.bold,
            ),
          ),
          elevation: 20,
          shadowColor: Colors.pinkAccent,
        ),
        body: DropdownButton(
          value: selectedcity,
          hint: Text("Choose city to visit "),
          items: cities.map((city) {
            return DropdownMenuItem(value: city, child: Text(city));
          }).toList(),
          onChanged: (String? newvalue) {
            setState(() {
              selectedcity = newvalue;
            });
          },
        ),
      ),
    );
  }
}*/
import 'package:flutter/material.dart';

void main() => runApp(const MaterialApp(home: MyScreen()));

class MyScreen extends StatefulWidget {
  const MyScreen({super.key});

  @override
  State<MyScreen> createState() => _MyScreenState();
}

class _MyScreenState extends State<MyScreen> {
  String? selectedCity;
  final List<String> cities = ['عمّان', 'دمشق', 'بيروت'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('DropdownButton')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            DropdownButton<String>(
              value: selectedCity,
              hint: const Text('اختر المدينة'),
              isExpanded: true,
              items: cities.map((city) {
                return DropdownMenuItem<String>(
                  value: city,
                  child: Text(city),
                );
              }).toList(),
              onChanged: (String? newValue) {
                setState(() {
                  selectedCity = newValue;
                });
              },
            ),
            const SizedBox(height: 20),
            Text('المدينة المختارة: ${selectedCity ?? "لا شي"}'),
          ],
        ),
      ),
    );
  }
}

