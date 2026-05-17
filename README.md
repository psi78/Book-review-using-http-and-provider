# Book Manager (Provider + http)

Author: Israel Shimeles  
ID:UGR/7570/16  
Section: 1   

A native Flutter application built to fulfill the CRUD API consumption assignment using the Provider  state management pattern and the  http network library.

## Architectural Architecture & Tech Stack
State Management:Latest `Provider` solution utilizing `ChangeNotifierProvider` and responsive view layers handled by `Consumer` and `context.read`.
Networking Layer: Standard `http` package handles server handshakes using strict `Uri.https` mapping.
Target Public API: Open Library Search API (`https://openlibrary.org/search.json`).

## Fulfilling CRUD Requirements
Create (C): Adds a targeted `Book` model into a persistent local memory `_favorites` list.
Read (R): Asynchronously fetches and parses books matching search query strings from the server.
Update (U): Modifies the `personalNote` property of an explicit book instance through a dedicated editing view.
Delete (D): Discards selected items from the user's `_favorites` collection via the dedicated **REMOVE** button.

## Core Project Directory
```text
lib/
├── models/
│   └── book.dart            # Safe schema parsing entity
├── providers/
│   └── book_provider.dart   # Local state machine & cache layer
├── screens/
│   ├── edit_note_screen.dart
│   ├── favorites_screen.dart
│   └── home_screen.dart
├── services/
│   └── api_service.dart     # Custom http engine interface
└── main.dart                # System initialization roots
```
