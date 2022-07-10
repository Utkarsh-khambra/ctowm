import 'package:ctowm/login_page.dart';
import 'package:flutter/material.dart';
import 'postContentPreview.dart';
import 'package:ctowm/post_page.dart';
import 'package:share_plus/share_plus.dart';

class Post extends StatefulWidget {
  const Post({Key? key}) : super(key: key);

  @override
  State<Post> createState() => _PostState();
}

class _PostState extends State<Post> {
  /* final _posts = List<String>.generate(10000, (i) => 'Item no $i'); */
  final _logedIn = false;
  final _titleFont = const TextStyle(fontSize: 20);
  final _postUrl = "www.example.com";
  int _postLikes = 0;
  int _postDislikes = 0;
  static const double _buttonSize = 15;
  static Route<Object?> _askForLogin(BuildContext context, Object? arguments) {
    return loginPageBuilder(context, arguments);
  }

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
                onPressed: () {
                  if (!_logedIn) {
                    Navigator.of(context).restorablePush(_askForLogin);
                  }
                  ++_postLikes;
                },
                icon: const Icon(Icons.thumb_up, size: _buttonSize),
                tooltip: "Like"),
            IconButton(
                onPressed: () {
                  if (!_logedIn) {
                    Navigator.of(context).restorablePush(_askForLogin);
                  }
                  ++_postDislikes;
                },
                icon: const Icon(Icons.thumb_down, size: _buttonSize),
                tooltip: "Dislike"),
            IconButton(
                onPressed: () {
                  Share.share(_postUrl);
                },
                icon: const Icon(Icons.share, size: _buttonSize),
                tooltip: "Share"),
            IconButton(
                onPressed: () {
                  if (!_logedIn) {
                    Navigator.of(context).restorablePush(_askForLogin);
                  }
                },
                icon: const Icon(Icons.bookmark, size: _buttonSize),
                tooltip: "Bookmark"),
          ],
        )
      ]));
    });
  }
}
