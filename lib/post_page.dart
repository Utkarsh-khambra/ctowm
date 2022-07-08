import 'package:flutter/material.dart';

class PostPage extends StatefulWidget {
  const PostPage({Key? key}) : super(key: key);

  @override
  State<PostPage> createState() => _PostPageState();
}

class _PostPageState extends State<PostPage> {
  final comments = List<String>.generate(
      10000,
      (i) =>
          'This is a very long comment and it keeps on going becase I want to test wrapping $i');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('Comments')),
        body: Column(
          children: [
            Row(
              children: [
                IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.person),
                    tooltip: "ProfilePicture"),
                Expanded(
                    child: TextButton(
                        onPressed: () {},
                        child: const Text("UserName is here"))),
              ],
            ),
            // TODO fill this with post
            const SizedBox(height: 50),
            Expanded(
                child: ListView.builder(
              itemCount: 1000,
              itemBuilder: (context, index) {
                return ListTile(title: Text(comments[index]));
              },
            ))
          ],
        ));
  }
}
