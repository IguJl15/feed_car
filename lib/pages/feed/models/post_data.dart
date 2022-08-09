
import 'dart:convert';

import 'package:collection/collection.dart';
import 'post.dart';

class PostData {
  List<Post> posts;
  PostData({
    required this.posts,
  });

  

  PostData copyWith({
    List<Post>? posts,
  }) {
    return PostData(
      posts: posts ?? this.posts,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'posts': posts.map((x) => x.toMap()).toList(),
    };
  }

  factory PostData.fromMap(Map<String, dynamic> map) {
    return PostData(
      posts: List<Post>.from((map['posts'] as List<int>).map<Post>((x) => Post.fromMap(x as Map<String,dynamic>),),),
    );
  }

  String toJson() => json.encode(toMap());

  factory PostData.fromJson(String source) => PostData.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'PostData(posts: $posts)';

  @override
  bool operator ==(covariant PostData other) {
    if (identical(this, other)) return true;
    final listEquals = const DeepCollectionEquality().equals;
  
    return 
      listEquals(other.posts, posts);
  }

  @override
  int get hashCode => posts.hashCode;
}
