import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/book.dart';

class ApiService {
  static const String _baseUrl = 'openlibrary.org';

  Future<List<Book>> searchBooks(String query) async {
    final url = Uri.https(_baseUrl, '/search.json', {'q': query});

    try {
      final response = await http.get(url);

      if (response.statusCode == 200) {
        final Map<String, dynamic> data = json.decode(response.body);
        final List<dynamic> docs = data['docs'];
        return docs.map((json) => Book.fromJson(json)).toList();
      } else {
        throw Exception('Failed to load books from server');
      }
    } catch (e) {
      throw Exception('Error occurred while fetching data: $e');
    }
  }
}
