import 'package:flutter/material.dart';

import '../../../models/post.dart';

class Footer extends StatelessWidget {
  
  const Footer({Key? key, required this.post}) : super(key: key);
  final Post post;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      child: const Text(
        "Descriptio:Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi sapien elit, viverra id ullamcorper sit amet, dignissim quis enim. In ac aliquam eros, nec semper. ",
        maxLines: 5,
        overflow: TextOverflow.ellipsis,
      ),
    );
  }
}