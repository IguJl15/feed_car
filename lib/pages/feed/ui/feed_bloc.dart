import 'dart:async';

import 'package:fedd_car/pages/feed/models/post.dart';
import 'package:fedd_car/services/repository.dart';

class FeedBloc {
  Repository repo;
  FeedBloc(this.repo);

  final _streamController = StreamController<List<Post>>.broadcast();
  Sink<List<Post>> get postsData => _streamController.sink;
  Stream<List<Post>> get postsResult => _streamController.stream;

  Future<void> fetchData() async {
    try {
      final allPosts = await repo.fetchAllPosts();
      postsData.add(allPosts);
    } catch (e) {
      _streamController.addError(e);
      rethrow;
    }
  }

  void dispose() {
    _streamController.close();
  }
}
