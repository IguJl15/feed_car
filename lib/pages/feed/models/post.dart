// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'post_author.dart';
import 'vehicle.dart';

class Post {
  int id;
  String? details;
  String imageUrl;
  int likes;
  int price;
  Vehicle vehicle;
  PostAuthor author;

  Post(
      {required this.id,
      this.details,
      required this.imageUrl,
      required this.likes,
      required this.price,
      required this.vehicle,
      required this.author});

  Post copyWith({
    int? id,
    String? details,
    String? imageUrl,
    int? likes,
    int? price,
    Vehicle? vehicle,
    PostAuthor? author,
  }) {
    return Post(
      id: id ?? this.id,
      details: details ?? this.details,
      imageUrl: imageUrl ?? this.imageUrl,
      likes: likes ?? this.likes,
      price: price ?? this.price,
      vehicle: vehicle ?? this.vehicle,
      author: author ?? this.author,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'details': details,
      'imageUrl': imageUrl,
      'likes': likes,
      'price': price,
      'vehicle': vehicle.toMap(),
      'author': author.toMap(),
    };
  }

  factory Post.fromMap(Map<String, dynamic> map) {
    print((map['author']));
    return Post(
      id: map['id'] as int,
      details: map['details'] != null ? map['details'] as String : null,
      imageUrl: map['imageUrl'] as String,
      likes: map['likes'] as int,
      price: map['price'] as int,
      vehicle: Vehicle.fromMap(map['vehicle'] as Map<String, dynamic>),
      author: PostAuthor.fromMap(map['author'] as Map<String, dynamic>),
    );
  }

  String toJson() => json.encode(toMap());

  factory Post.fromJson(String source) =>
      Post.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Post(id: $id, details: $details, imageUrl: $imageUrl, likes: $likes, price: $price, vehicle: $vehicle), author: $author';
  }

  @override
  bool operator ==(covariant Post other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.details == details &&
        other.imageUrl == imageUrl &&
        other.likes == likes &&
        other.price == price &&
        other.vehicle == vehicle &&
        other.author == author;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        details.hashCode ^
        imageUrl.hashCode ^
        likes.hashCode ^
        price.hashCode ^
        vehicle.hashCode ^
        author.hashCode;
  }
}
