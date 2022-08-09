import 'package:fedd_car/pages/feed/models/post.dart';
import 'package:flutter/material.dart';

import 'components/footer.dart';
import 'components/image_field.dart';
import 'components/toggle_icon_button.dart';
import 'components/user_avatar.dart';

class FeedPost extends StatelessWidget {
  const FeedPost({required this.post, super.key});

  final bool likeState = false;
  final Post post;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 8,
      margin: const EdgeInsets.symmetric(
        vertical: 24,
        horizontal: 8,
      ),
      child: Column(
        children: [
          // Card Header
          Padding(
            padding: const EdgeInsets.all(8),
            child: PostHeader(
              post: post,
            ),
          ),
          ImageField(post: post),
          ButtonsRow(
            post: post,
          ),
          Footer(post: post),
        ],
      ),
    );
  }
}

class ButtonsRow extends StatefulWidget {
  ButtonsRow({required this.post, Key? key}) : super(key: key) {
    likeCount = post.likes;
  }
  final Post post;
  late int likeCount;
  bool likeState = false;
  @override
  State<ButtonsRow> createState() => _ButtonsRowState();
}

class _ButtonsRowState extends State<ButtonsRow> {
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          children: [
            ToggleIconButton(
                icon: Icon(Icons.favorite_border),
                activeIcon: Icon(Icons.favorite),
                initialState: widget.likeState,
                onPress: (state) {
                  setState(() {
                    widget.likeCount += state ? 1 : -1;
                  });
                  // Send signal to server or whatever you want using the returned value
                }),
            Text(widget.likeCount.toString())
          ],
        ),
        IconButton(
            onPressed: () {}, icon: const Icon(Icons.mode_comment_outlined)),
        // Text(widget.post) // comment count
      ],
    );
  }
}

class PostHeader extends StatelessWidget {
  const PostHeader({required this.post, Key? key}) : super(key: key);
  final Post post;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            UserAvatar(user: post.author),
            Padding(
              padding: const EdgeInsets.only(left: 12),
              child: Text(
                "${post.vehicle.brand} - ${post.vehicle.model}",
                style: Theme.of(context).textTheme.headline6,
              ),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 12),
              child: Text(
                "R\$ ${post.price}.00 ",
                style: Theme.of(context).textTheme.headline6,
              ),
            ),
            ToggleIconButton(
                icon: Icon(Icons.star_border),
                activeIcon: Icon(Icons.star),
                onPress: (e) {})
          ],
        )
      ],
    );
  }
}



