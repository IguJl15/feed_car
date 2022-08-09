// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class PostAuthor {
  final int id;
  final String userName;
  final String avatarUrl;

  PostAuthor({
    required this.id,
    required this.userName,
    required this.avatarUrl,
  });

  PostAuthor copyWith({
    int? id,
    String? userName,
    String? avatarUrl,
  }) {
    return PostAuthor(
      id: id ?? this.id,
      userName: userName ?? this.userName,
      avatarUrl: avatarUrl ?? this.avatarUrl,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'userName': userName,
      'avatarUrl': avatarUrl,
    };
  }

  factory PostAuthor.fromMap(Map<String, dynamic> map) {
    return PostAuthor(
      id: map['id'] as int,
      userName: map['userName'] as String,
      avatarUrl: map['avatarUrl'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory PostAuthor.fromJson(String source) =>
      PostAuthor.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'PostAuthor(id: $id, userName: $userName, avatarUrl: $avatarUrl)';

  @override
  bool operator ==(covariant PostAuthor other) {
    if (identical(this, other)) return true;
  
    return 
      other.id == id &&
      other.userName == userName &&
      other.avatarUrl == avatarUrl;
  }

  @override
  int get hashCode => id.hashCode ^ userName.hashCode ^ avatarUrl.hashCode;
}
