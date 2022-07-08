import 'package:flutter/material.dart';

class PostContentPreview extends StatefulWidget {
  const PostContentPreview({Key? key}) : super(key: key);

  @override
  State<PostContentPreview> createState() => _PostContentPreviewState();
}

class _PostContentPreviewState extends State<PostContentPreview> {
  @override
  Widget build(BuildContext context) {
    return const Text(
        'This is post content summary if it is a text otherwise show image');
  }
}
