import 'package:http/http.dart' as http;
import 'dart:convert';

Future<void> fetchSubjects() async {
  const token =
      'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InBqZXJxaHRkbm50aGp0cXJwaHZsIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MDkyMzA2NTUsImV4cCI6MjAyNDgwNjY1NX0.Gs7qnlJM19R5wgPTAYJ-ii50HhNWBuVyo48PYH8WPI0';
  try {
    final response = await http.get(
      Uri.parse('https://pjerqhtdnnthjtqrphvl.supabase.co/rest/v1/subject'),
      headers: {
        "Content-Type": "application/json",
        'Authorization': 'Bearer $token',
      },
    );

    print(response.statusCode);
    if (response.statusCode == 200) {
      print(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load subject');
    }
  } catch (e) {
    print('Failed to call API: $e');
  }
}
