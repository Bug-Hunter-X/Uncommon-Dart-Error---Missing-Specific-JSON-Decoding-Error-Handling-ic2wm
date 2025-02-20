```dart
import 'dart:convert';
import 'package:http/http.dart' as http;

Future<void> fetchData() async {
  try {
    final response = await http.get(Uri.parse('https://api.example.com/data'));
    if (response.statusCode == 200) {
      try {
        final jsonData = jsonDecode(response.body);
        // Process jsonData
      } on FormatException catch (e) {
        print('Error: Invalid JSON format: $e');
        // Handle the JSON decoding error appropriately
      }
    } else {
      throw Exception('Failed to load data: ${response.statusCode}');
    }
  } catch (e) {
    print('Error: $e');
    // Consider more sophisticated error handling, such as retries or fallback mechanisms
  }
}
```