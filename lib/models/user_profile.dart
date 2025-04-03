// lib/models/user_profile.dart
class UserProfile {
  final String uid;
  final String username;
  final String email;
  final String profileImageUrl;
  final List<String> favorites;
  final Map<String, int> lastReadChapter; // mangaId: chapterNumber

  UserProfile({
    required this.uid,
    required this.username,
    required this.email,
    required this.profileImageUrl,
    required this.favorites,
    required this.lastReadChapter,
  });

  factory UserProfile.fromMap(Map<String, dynamic> map, String uid) {
    return UserProfile(
      uid: uid,
      username: map['username'] ?? '',
      email: map['email'] ?? '',
      profileImageUrl: map['profileImageUrl'] ?? '',
      favorites: List<String>.from(map['favorites'] ?? []),
      lastReadChapter: Map<String, int>.from(map['lastReadChapter'] ?? {}),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'username': username,
      'email': email,
      'profileImageUrl': profileImageUrl,
      'favorites': favorites,
      'lastReadChapter': lastReadChapter,
    };
  }
}
