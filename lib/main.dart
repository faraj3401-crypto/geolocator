import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => MyAppState();
}

class MyAppState extends State<MyApp> {
  String locationText = "جاري تحديد الموقع...";

  Future<Position> _determinePosition() async {
    bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('Location services are disabled.');
    }

    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return Future.error(
        'Location permissions are permanently denied, we cannot request permissions.',
      );
    }

    // هون بتقبل whileInUse و always
    return await Geolocator.getCurrentPosition();
  }

  Future<void> _getLocation() async {
    try {
      final position = await _determinePosition();
      print(position.latitude);
      print(position.longitude);
      setState(() {
        locationText =
            "Lat: ${position.latitude}\nLng: ${position.longitude}";
      });
    } catch (e) {
      setState(() {
        locationText = "خطأ: $e";
      });
    }
  }

  @override
  void initState() {
    super.initState();
    _getLocation();
  }

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
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "Mariam Faraj",
                style: TextStyle(fontFamily: 'PlaywriteCAGuides'),
              ),
              const SizedBox(height: 20),
              Text(locationText, textAlign: TextAlign.center),
            ],
          ),
        ),
      ),
    );
  }
}

/*import 'package:flutter/material.dart';

class AppTextField extends StatelessWidget {
  final TextEditingController textEditingController;
  final String title;
  final String hint;
  final bool isReadOnly;
  final VoidCallback? onTextFieldTap;

  const AppTextField({
    super.key,
    required this.textEditingController,
    required this.title,
    required this.hint,
    this.isReadOnly = false,
    this.onTextFieldTap,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 8),
        TextFormField(
          controller: textEditingController,
          readOnly: isReadOnly,
          onTap: onTextFieldTap,
          decoration: InputDecoration(
            hintText: hint,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            suffixIcon: isReadOnly ? const Icon(Icons.arrow_drop_down) : null,
          ),
        ),
      ],
    );
  }
}

class DropdownListScreen extends StatefulWidget {
  const DropdownListScreen({super.key});

  @override
  State<DropdownListScreen> createState() => _DropdownListScreenState();
}

class _DropdownListScreenState extends State<DropdownListScreen> {
  final TextEditingController cityController = TextEditingController();
  final List<String> cities = ['عمّان', 'دمشق', 'بيروت', 'القاهرة'];

  void showCitiesSheet() {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return ListView.builder(
          itemCount: cities.length,
          itemBuilder: (context, index) {
            final city = cities[index];
            return ListTile(
              title: Text(city),
              onTap: () {
                cityController.text = city;
                Navigator.pop(context);
              },
            );
          },
        );
      },
    );
  }

  @override
  void dispose() {
    cityController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Dropdown List')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            AppTextField(
              textEditingController: cityController,
              title: 'المدينة',
              hint: 'اختر المدينة',
              isReadOnly: true,
              onTextFieldTap: showCitiesSheet,
            ),
          ],
        ),
      ),
    );
  }
}*/
