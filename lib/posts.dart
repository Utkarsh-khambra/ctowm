import 'package:flutter/material.dart';
import 'postContentPreview.dart';
import 'package:ctowm/post_page.dart';

class Post extends StatefulWidget {
  const Post({Key? key}) : super(key: key);

  @override
  State<Post> createState() => _PostState();
}

class _PostState extends State<Post> {
  /* final _posts = List<String>.generate(10000, (i) => 'Item no $i'); */
  final _titleFont = const TextStyle(fontSize: 20);
  static const double _buttonSize = 15;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(itemBuilder: (context, index) {
      return Card(
          child: Column(children: [
        Row(children: [
          IconButton(
              onPressed: () {},
              icon: const Icon(Icons.person),
              tooltip: "UserProfilePic"),
          TextButton(onPressed: () {}, child: const Text('UserName'))
        ]),
        Row(
          children: [
            Expanded(
                child: TextButton(
                    onPressed: () {
                      Navigator.of(context)
                          .push(MaterialPageRoute<void>(builder: (context) {
                        return PostPage();
                      }));
                    },
                    child: Text(
                        'This is a post and it keeps on going till it wraps around so be carefull',
                        style: _titleFont)))
          ],
        ),
        PostContentPreview(),
        //TODO add onPressed to buttons
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            IconButton(
                onPressed: () {},
                icon: const Icon(Icons.thumb_up, size: _buttonSize),
                tooltip: "Like"),
            IconButton(
                onPressed: () {},
                icon: const Icon(Icons.thumb_down, size: _buttonSize),
                tooltip: "Dislike"),
            IconButton(
                onPressed: () {},
                icon: const Icon(Icons.share, size: _buttonSize),
                tooltip: "Share"),
            IconButton(
                onPressed: () {},
                icon: const Icon(Icons.bookmark, size: _buttonSize),
                tooltip: "Bookmark"),
          ],
        )
      ]));
    });
  }
}
