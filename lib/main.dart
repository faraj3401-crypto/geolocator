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

void main() => runApp(const MaterialApp(home: FormScreen()));

class FormScreen extends StatefulWidget {
  const FormScreen({super.key});

  @override
  State<FormScreen> createState() => _FormScreenState();
}

class _FormScreenState extends State<FormScreen> {
  final _formKey = GlobalKey<FormState>();
  String? selectedCity;
  final List<String> cities = ['عمّان', 'دمشق', 'بيروت'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('DropdownButtonFormField')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              DropdownButtonFormField<String>(
                value: selectedCity,
                decoration: const InputDecoration(
                  labelText: 'المدينة',
                  border: OutlineInputBorder(),
                ),
                items: cities.map((city) {
                  return DropdownMenuItem<String>(
                    value: city,
                    child: Text(city),
                  );
                }).toList(),
                onChanged: (String? newValue) {
                  setState(() => selectedCity = newValue);
                },
                validator: (String? value) {
                  if (value == null) return 'من فضلك اختر مدينة';
                  return null;
                },
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('تم اختيار $selectedCity')),
                    );
                  }
                },
                child: const Text('إرسال'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

