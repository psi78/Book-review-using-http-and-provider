import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/book.dart';
import '../providers/book_provider.dart';

class BookCard extends StatelessWidget {
  final Book book;
  final bool isFavoritesView;
  final VoidCallback? onEdit;

  const BookCard({
    super.key,
    required this.book,
    this.isFavoritesView = false,
    this.onEdit,
  });

  @override
  Widget build(BuildContext context) {
    final bookProvider = context.read<BookProvider>();

    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      child: Column(
        children: [
          ListTile(
            leading: Image.network(
              book.coverUrl,
              width: 50,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) =>
                  const Icon(Icons.book),
            ),
            title: Text(
              book.title,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            subtitle: Text(
              (isFavoritesView && book.personalNote.isNotEmpty)
                  ? '📝 My Note: ${book.personalNote}'
                  : book.author,
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
            ),
            trailing: !isFavoritesView
                ? IconButton(
                    icon: Icon(
                      book.isFavorite ? Icons.favorite : Icons.favorite_border,
                      color: book.isFavorite ? Colors.red : null,
                      size: 28,
                    ),
                    onPressed: () => bookProvider.toggleFavorite(book),
                  )
                : null,
          ),
          if (isFavoritesView)
            Padding(
              padding: const EdgeInsets.only(bottom: 8.0, right: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton.icon(
                    onPressed: onEdit,
                    icon: const Icon(Icons.edit, size: 18),
                    label: const Text('EDIT NOTE'),
                  ),
                  TextButton.icon(
                    onPressed: () => bookProvider.toggleFavorite(book),
                    icon: const Icon(Icons.delete, size: 18, color: Colors.red),
                    label: const Text(
                      'REMOVE',
                      style: TextStyle(color: Colors.red),
                    ),
                  ),
                ],
              ),
            ),
        ],
      ),
    );
  }
}
