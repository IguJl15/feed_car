import 'package:flutter/material.dart';

class FeedPage extends StatelessWidget {
  const FeedPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: 9,
        itemBuilder: (context, index) => FeedPost(title: "Titluo $index"),
      ),
      floatingActionButton: FloatingActionButton(onPressed: () {
        // add posto to Post Stacks
      }),
    );
  }
}

class FeedPost extends StatelessWidget {
  const FeedPost({required this.title, super.key});
  final String title;
  @override
  Widget build(BuildContext context) {
    return Container(
      // constraints: BoxConstraints.(
        // maxHeight: MediaQuery.of(context).size.height,
      // ),
      child: Card(
        margin: const EdgeInsets.symmetric(vertical: 8),
        child: Column(
          children: [
            // Card Header
            Container(
              padding: const EdgeInsets.all(8),
              child: Row(
                children: [
                  const CircleAvatar(
                    child: Icon(Icons.person),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(title, style: Theme.of(context).textTheme.headline6),
                      Text(
                        "Sub title",
                        style: Theme.of(context).textTheme.bodyMedium,
                      )
                    ],
                  ),
                  IconButton(
                      onPressed: () {}, icon: const Icon(Icons.star_border))
                ],
              ),
            ),

            SizedBox(
              child: FlutterLogo(
                size: MediaQuery.of(context).size.width,
              ),
            ),
            Container(
              child: Row(
                children: [
                  IconButton(
                      onPressed: () {}, icon: Icon(Icons.favorite_border)),
                  IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.mode_comment_outlined)),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.all(8),
              child: const Text(
                  "Descriptio:Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi sapien elit, viverra id ullamcorper sit amet, dignissim quis enim. In ac aliquam eros, nec semper. "),
            ),
            Container(
              padding: EdgeInsets.all(8),
              child: Row(
                children: [
                  TextButton(
                    onPressed: () {},
                    child: const Text("Button 1"),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
