import 'package:flutter/material.dart';
import 'post_data.dart';

class PostContentPreview extends StatefulWidget {
  const PostContentPreview({Key? key}) : super(key: key);

  @override
  State<PostContentPreview> createState() => _PostContentPreviewState();
}

class _PostContentPreviewState extends State<PostContentPreview> with Post {
  @override
  Widget build(BuildContext context) {
    return const Text(
        'This is post content summary if it is a text otherwise show image');
  }
}
