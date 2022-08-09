// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'post.dart';

class User {
  final List<Post> posts;
  final String avatarUrl;
  final String email;
  final int id;
  final String name;
  final String userName;
  User({
    required this.posts,
    required this.avatarUrl,
    required this.email,
    required this.id,
    required this.name,
    required this.userName,
  });


  User copyWith({
    List<Post>? posts,
    String? avatarUrl,
    String? email,
    int? id,
    String? name,
    String? userName,
  }) {
    return User(
      posts: posts ?? this.posts,
      avatarUrl: avatarUrl ?? this.avatarUrl,
      email: email ?? this.email,
      id: id ?? this.id,
      name: name ?? this.name,
      userName: userName ?? this.userName,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'posts': posts.map((x) => x.toMap()).toList(),
      'avatarUrl': avatarUrl,
      'email': email,
      'id': id,
      'name': name,
      'userName': userName,
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      posts: List<Post>.from((map['posts'] as List<int>).map<Post>((x) => Post.fromMap(x as Map<String,dynamic>),),),
      avatarUrl: map['avatarUrl'] as String,
      email: map['email'] as String,
      id: map['id'] as int,
      name: map['name'] as String,
      userName: map['userName'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory User.fromJson(String source) => User.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'User(posts: $posts, avatarUrl: $avatarUrl, email: $email, id: $id, name: $name, userName: $userName)';
  }

  @override
  bool operator ==(covariant User other) {
    if (identical(this, other)) return true;
  
    return 
      listEquals(other.posts, posts) &&
      other.avatarUrl == avatarUrl &&
      other.email == email &&
      other.id == id &&
      other.name == name &&
      other.userName == userName;
  }

  @override
  int get hashCode {
    return posts.hashCode ^
      avatarUrl.hashCode ^
      email.hashCode ^
      id.hashCode ^
      name.hashCode ^
      userName.hashCode;
  }
}
