# Book Manager (BLoC + Dio)

Author:Israel Shimeles  
ID:UGR/7570/16  
Section: 1  

An advanced Flutter application built to fulfill the CRUD API consumption assignment utilizing the asynchronous BLoC (Business Logic Component) stream pattern and the "Dio" networking client wrapper.

## Architectural Architecture & Tech Stack
State Management: Full stream-driven BLoC pattern using custom state emissions (`BookInitial`, `BookLoading`, `BookLoaded`, `BookError`) responding directly to localized dispatch routines.
* **Networking Layer:** Robust `Dio` client engine handling request execution and automated payload decoding blocks.
Target Public API: Open Library Search API (`https://openlibrary.org/search.json`).

## Fulfilling CRUD Requirements
Create (C): Dispatches a `ToggleFavoriteEvent` to inject target entries into structured reactive state list layers.
Read (R): Fires background asynchronous `SearchBooksEvent` tasks to stream matched data from the web interface.
Update (U): Emits an explicit `UpdateBookNoteEvent` to overwrite metadata structures instantly without impacting UI performance.
Delete (D):Removes specific items cleanly out of streamed array parameters using specialized screen control buttons.

## Core Project Directory
```text
lib/
├── bloc/
│   ├── book_bloc.dart       # Asynchronous stream logic engine
│   ├── book_event.dart      # Strict structural operational definitions
│   └── book_state.dart      # Immutable visual layout state wrappers
├── models/
│   └── book.dart            # Custom entity definitions
├── screens/
│   ├── edit_note_screen.dart
│   ├── favorites_screen.dart
│   └── home_screen.dart
├── services/
│   └── api_service.dart     # Core Dio data communication center
├── widgets/
│   └── book_card.dart       # Modular presentation display item
└── main.dart                # System initialization roots
```
