import 'package:flutter/material.dart';
import 'posts.dart';
import 'search_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('CtwoM'),
          actions: [
            Row(children: <Widget>[
              IconButton(
                  onPressed: () {
                    Navigator.of(context)
                        .push(MaterialPageRoute<void>(builder: (context) {
                      return const SearchPage();
                    }));
                  },
                  icon: const Icon(Icons.search)),
              const SizedBox(width: 30),
              IconButton(
                  onPressed: () {
                    showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          // TODO add onPresseds
                          return SimpleDialog(children: <Widget>[
                            SimpleDialogOption(
                                onPressed: () {}, child: const Text('New')),
                            SimpleDialogOption(
                                onPressed: () {}, child: const Text('Hot')),
                            SimpleDialogOption(
                                onPressed: () {}, child: const Text('Top'))
                          ]);
                        });
                  },
                  icon: const Icon(Icons.sort)),
              const SizedBox(width: 10),
            ])
          ],
        ),
        body: const Post());
  }
}
