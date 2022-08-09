
import 'package:flutter/material.dart';

import '../../../models/post.dart';

class ImageField extends StatelessWidget {
  const ImageField({required this.post, Key? key}) : super(key: key);
  final Post post;
  @override
  Widget build(BuildContext context) {
    return Image.network(
      // frameBuilder: ,
      post.imageUrl,
      loadingBuilder: (context, child, loadingProgress) {
        if (loadingProgress == null) return child;
        return FlutterLogo(size: MediaQuery.of(context).size.width / 2);
      },
    );
  }
}