import 'package:easylanche/core/constants/cores.dart';
import 'package:flutter/material.dart';

class FeedPage extends StatelessWidget {
  const FeedPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('EasyLanche'),
        backgroundColor: Cores.laranjaPrincipal,
      ),
      body: Center(child: Text('Feed page')),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.add),
        backgroundColor: Cores.laranjaPrincipal,
      ),
    );
  }
}
