import 'package:cloud_firestore/cloud_firestore.dart';

class Manga {
  final String id;
  final String title;
  final String description;
  final String coverUrl;
  final List<String> genres;
  final String author;
  final DateTime lastUpdated;
  final bool isCompleted;

  Manga({
    required this.id,
    required this.title,
    required this.description,
    required this.coverUrl,
    required this.genres,
    required this.author,
    required this.lastUpdated,
    required this.isCompleted,
  });

  factory Manga.fromMap(Map<String, dynamic> map, String id) {
    assert(map['title'] != null, 'Title is required');
    assert(map['coverUrl'] != null, 'Cover URL is required');

    return Manga(
      id: id,
      title: map['title'] as String,
      description: map['description'] as String? ?? '',
      coverUrl: map['coverUrl'] as String,
      genres: List<String>.from(map['genres'] ?? []),
      author: map['author'] as String? ?? 'Unknown',
      lastUpdated:
          map['lastUpdated'] != null
              ? (map['lastUpdated'] as Timestamp).toDate()
              : DateTime.now(),
      isCompleted: map['isCompleted'] as bool? ?? false,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'description': description,
      'coverUrl': coverUrl,
      'genres': genres,
      'author': author,
      'lastUpdated': lastUpdated,
      'isCompleted': isCompleted,
    };
  }
}
