import 'package:flutter/material.dart';
import '../models/book.dart';
import '../services/api_service.dart';

class BookProvider with ChangeNotifier {
  final ApiService _apiService = ApiService();

  List<Book> _searchResults = [];
  List<Book> _favorites = [];
  bool _isLoading = false;
  String? _errorMessage;

  List<Book> get searchResults => _searchResults;
  List<Book> get favorites => _favorites;
  bool get isLoading => _isLoading;
  String? get errorMessage => _errorMessage;

  Future<void> fetchBooks(String query) async {
    if (query.isEmpty) return;

    _isLoading = true;
    _errorMessage = null;
    notifyListeners();

    try {
      _searchResults = await _apiService.searchBooks(query);
    } catch (e) {
      _errorMessage = e.toString();
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  void toggleFavorite(Book book) {
    final index = _favorites.indexWhere((item) => item.id == book.id);

    if (index >= 0) {
      _favorites.removeAt(index);
      book.isFavorite = false;
    } else {
      book.isFavorite = true;
      _favorites.add(book);
    }
    notifyListeners();
  }

  void updateNote(String bookId, String newNote) {
    final favIndex = _favorites.indexWhere((book) => book.id == bookId);
    if (favIndex >= 0) {
      _favorites[favIndex].personalNote = newNote;
    }

    final searchIndex = _searchResults.indexWhere((book) => book.id == bookId);
    if (searchIndex >= 0) {
      _searchResults[searchIndex].personalNote = newNote;
    }

    notifyListeners();
  }
}
