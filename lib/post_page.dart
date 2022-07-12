import 'package:flutter/material.dart';
import 'package:flutter_lorem/flutter_lorem.dart';
import 'package:share_plus/share_plus.dart';

class PostPage extends StatefulWidget {
  const PostPage({Key? key}) : super(key: key);

  @override
  State<PostPage> createState() => _PostPageState();
}

class _PostPageState extends State<PostPage>
    with SingleTickerProviderStateMixin {
  final double _buttonSize = 15;
  final _postUrl = "www.example.com";
  bool _showButtons = false;
  late final AnimationController _animController = AnimationController(
      duration: const Duration(milliseconds: 10), vsync: this);

  late final Animation<Offset> _offsetAnimation = Tween<Offset>(
          begin: Offset.zero, end: const Offset(1, 0))
      .animate(CurvedAnimation(parent: _animController, curve: Curves.easeOut));

  @override
  void dispose() {
    _animController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('Comments')),
        body: ListView.builder(itemBuilder: (context, index) {
          if (index == 0) {
            return Padding(
                padding: EdgeInsets.all(10),
                child: Column(children: [
                  Row(
                    children: [
                      IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.person),
                          tooltip: "ProfilePicture"),
                      Flexible(
                          child: TextButton(
                              onPressed: () {},
                              child: const Text("UserName is here"))),
                    ],
                  ),
                  // TODO fill this with post
                  Text(lorem(words: 150, paragraphs: 4))
                ]));
          }

          return Flexible(
              child: ListTile(
                  title: Column(children: [
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              TextButton(child: Text("Comment's Name"), onPressed: () {}),
              Text("9h")
            ]),
            TextButton(
                onPressed: () {
                  setState(() {
                    _showButtons = !_showButtons;
                  });
                },
                child: Text(lorem(paragraphs: 3, words: 60)),
                style: TextButton.styleFrom(
                    primary: Colors.black, textStyle: const Text("Hi").style)),
            Row(
              /* key: ValueKey<bool>(_showButtons), */
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconButton(
                    onPressed: () {
                      /* if (!_logedIn) { */
                      /*   Navigator.of(context).restorablePush(_askForLogin); */
                      /* } */
                      /* ++_postLikes; */
                    },
                    icon: Icon(Icons.thumb_up, size: _buttonSize),
                    tooltip: "Like"),
                IconButton(
                    onPressed: () {
                      /* if (!_logedIn) { */
                      /*   Navigator.of(context).restorablePush(_askForLogin); */
                      /* } */
                      /* ++_postDislikes; */
                    },
                    icon: Icon(Icons.thumb_down, size: _buttonSize),
                    tooltip: "Dislike"),
                IconButton(
                    onPressed: () {
                      Share.share(_postUrl);
                    },
                    icon: Icon(Icons.share, size: _buttonSize),
                    tooltip: "Share"),
                IconButton(
                    onPressed: () {
                      /* if (!_logedIn) { */
                      /*   Navigator.of(context).restorablePush(_askForLogin); */
                      /* } */
                    },
                    icon: Icon(Icons.bookmark, size: _buttonSize),
                    tooltip: "Bookmark"),
              ],
            )
          ])));
        }));
  }
}
