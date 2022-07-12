import 'package:flutter/material.dart';
import 'package:ctowm/post_data.dart';
import 'package:ctowm/user.dart';
import 'package:share_plus/share_plus.dart';

import 'login_page.dart';

class ButtonRow extends StatefulWidget {
  const ButtonRow({Key? key}) : super(key: key);

  @override
  State<ButtonRow> createState() => _ButtonRowState();
}

class _ButtonRowState extends State<ButtonRow> with Post {
  final User _user = User();
  final double _buttonSize = 20;
  static Route<Object?> _askForLogin(BuildContext context, Object? arguments) {
    return loginPageBuilder(context, arguments);
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        IconButton(
            onPressed: () {
              if (!_user.loggedIn) {
                Navigator.of(context).restorablePush(_askForLogin);
              }
              setState(() {
                ++super.likes;
                if (_user.isLiked(super.hash)) {
                  _user.likes.remove(super.hash);
                } else {
                  _user.likes.addAll({super.hash: super.hash});
                  if (_user.isDisliked(super.hash)) {
                    _user.dislikes.remove(super.hash);
                  }
                }
              });
            },
            icon: Icon(Icons.thumb_up,
                size: _buttonSize,
                color: _user.isLiked(super.hash) ? Colors.orange : Colors.grey),
            tooltip: "Like"),
        IconButton(
            onPressed: () {
              if (!_user.loggedIn) {
                Navigator.of(context).restorablePush(_askForLogin);
              }
              setState(() {
                ++super.likes;
                if (_user.isDisliked(super.hash)) {
                  _user.dislikes.remove(super.hash);
                } else {
                  _user.dislikes.addAll({super.hash: super.hash});
                  if (_user.isLiked(super.hash)) {
                    _user.likes.remove(super.hash);
                  }
                }
              });
            },
            icon: Icon(Icons.thumb_down,
                size: _buttonSize,
                color: _user.isDisliked(super.hash)
                    ? Colors.lightBlue
                    : Colors.grey),
            tooltip: "Dislike"),
        IconButton(
            onPressed: () {
              Share.share('www.ctwom.com/${super.hash}');
            },
            icon: Icon(Icons.share, size: _buttonSize, color: Colors.grey),
            tooltip: "Share"),
        IconButton(
            onPressed: () {
              if (!_user.loggedIn) {
                Navigator.of(context).restorablePush(_askForLogin);
              }
              setState(() {
                if (_user.isBookmarked(super.hash)) {
                  _user.bookmarks.remove(super.hash);
                } else {
                  _user.bookmarks.addAll({super.hash: super.hash});
                }
              });
            },
            icon: Icon(Icons.bookmark,
                size: _buttonSize,
                color: _user.isBookmarked(super.hash)
                    ? Colors.yellow
                    : Colors.grey),
            tooltip: "Bookmark"),
      ],
    );
  }
}
