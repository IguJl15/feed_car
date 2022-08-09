import 'package:flutter/material.dart';

import '../../../models/post_author.dart';

class UserAvatar extends StatelessWidget {
  const UserAvatar({required this.user, Key? key}) : super(key: key);
  final PostAuthor user;
  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      child: Container(
        clipBehavior: Clip.antiAlias,
        decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(30))),
        child: Image.network(
          user.avatarUrl,
          loadingBuilder: (context, child, loadingProgress) {
            if (loadingProgress == null) return child;
            return const Icon(Icons.person);
          },
        ),
      ),
    );
  }
}
