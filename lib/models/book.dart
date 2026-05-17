class Book {
  final String id;
  final String title;
  final String author;
  final String coverUrl;
  bool isFavorite;
  String personalNote;

  Book({
    required this.id,
    required this.title,
    required this.author,
    required this.coverUrl,
    this.isFavorite = false,
    this.personalNote = '',
  });

  factory Book.fromJson(Map<String, dynamic> json) {
    final String key = json['key'] ?? '';
    final String cleanId = key.replaceAll('/works/', '');

    String authorName = 'Unknown Author';
    if (json['author_name'] != null &&
        (json['author_name'] as List).isNotEmpty) {
      authorName = json['author_name'][0];
    }

    String coverId = '';
    if (json['cover_i'] != null) {
      coverId = json['cover_i'].toString();
    }
    final String cover = coverId.isNotEmpty
        ? 'https://covers.openlibrary.org/b/id/$coverId-M.jpg'
        : 'https://via.placeholder.com/150';

    return Book(
      id: cleanId,
      title: json['title'] ?? 'Unknown Title',
      author: authorName,
      coverUrl: cover,
    );
  }
}
