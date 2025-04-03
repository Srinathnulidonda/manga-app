// lib/models/chapter.dart
import 'package:cloud_firestore/cloud_firestore.dart';

class Chapter {
  final String id;
  final String mangaId;
  final String title;
  final int number;
  final DateTime releaseDate;
  final String pdfUrl;

  Chapter({
    required this.id,
    required this.mangaId,
    required this.title,
    required this.number,
    required this.releaseDate,
    required this.pdfUrl,
  });

  factory Chapter.fromMap(Map<String, dynamic> map, String id) {
    return Chapter(
      id: id,
      mangaId: map['mangaId'] ?? '',
      title: map['title'] ?? '',
      number: map['number'] ?? 0,
      releaseDate:
          map['releaseDate'] != null
              ? (map['releaseDate'] as Timestamp).toDate()
              : DateTime.now(),
      pdfUrl: map['pdfUrl'] ?? '',
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'mangaId': mangaId,
      'title': title,
      'number': number,
      'releaseDate': releaseDate,
      'pdfUrl': pdfUrl,
    };
  }
}
