import 'package:fedd_car/services/repository.dart';
import 'package:flutter/material.dart';

import '../models/post.dart';
import 'post_widget/post_widget.dart';
import 'feed_bloc.dart';

class FeedPage extends StatelessWidget {
  FeedPage({super.key});

  // final repository = Repository();

  final bloc = FeedBloc(Repository());

  @override
  Widget build(BuildContext context) {
    bloc.fetchData();
    var size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            "FeedCar",
            style: Theme.of(context)
                .textTheme
                .headline4
                ?.copyWith(color: Colors.white),
            textAlign: TextAlign.center,
          ),
        ),
      ),
      body: SafeArea(
        child: StreamBuilder<List<Post>>(
            stream: bloc.postsResult,
            builder: (context, snapshot) {
              switch (snapshot.connectionState) {
                case ConnectionState.waiting:
                  return const Center(child: CircularProgressIndicator());
                case ConnectionState.active:
                  if (snapshot.hasError) {
                    return Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Center(
                              child: Text("Houve um erro, tente novamente...")),
                          IconButton(
                              onPressed: () => bloc.fetchData(),
                              icon: const Icon(Icons.replay_outlined))
                        ]);
                  }

                  if (!snapshot.hasData) {
                    return const Center(
                        child: Text(
                            "Parece que não há nada para ser exibido agora :(\nTente novamente em instantes"));
                  }
                  final posts = snapshot.data!;

                  return ListView.builder(
                    addAutomaticKeepAlives: false,
                    padding: EdgeInsets.symmetric(
                        horizontal: size.width > 800 ? size.width / 5 : 0),
                    itemCount: posts.length,
                    itemBuilder: (context, index) =>
                        FeedPost(post: posts[index]),
                  );
                default:
                  return Container();
              }
            }),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          bloc.fetchData();
        },
        child: const Icon(Icons.file_download_done_rounded),
      ),
    );
  }
}
