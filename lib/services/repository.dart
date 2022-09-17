import 'package:fedd_car/pages/feed/models/post.dart';
import 'package:fedd_car/services/graphql/graphql_service.dart';
import 'package:fedd_car/services/graphql/queries.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

class Repository {
  final _gqlService = GraphQLService(
      link: HttpLink("https://mockend.com/IguJl15/feed_car/graphql"));

  Future<List<Post>> fetchAllPosts() async {
    final result = await _gqlService.executeQuery(getAllPosts);

    if (!result.hasException && result.data != null) {
      final data = result.data!;

      print("---");
      for (var element in data["posts"] as List) {
        print(element);
      }
      print("---");
      List<Post> posts = (data["posts"] as List)
          .map<Post>((e) => Post.fromMap(e as Map<String, dynamic>))
          .toList();

      return posts;
    } else
      throw Exception("Error while peforming query");
  }
}
