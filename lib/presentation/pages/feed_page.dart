import 'package:easylanche/core/constants/cores.dart';
import 'package:flutter/material.dart';

import '../../logic/models/post.dart';
import '../widgets/feed/card_oferta_widget.dart';

class FeedPage extends StatelessWidget {
  final List<Post> posts = [
    Post(
        id: "1",
        title: "teste descricao",
        descricao:
            "teste descricao",
        value: 3.0,
        type: true),
    Post(
        id: "2",
        title: "teste descricao",
        descricao:
            "teste descricao",
        value: 5.0,
        type: true),
    Post(
        id: "3",
        title: "teste descricao",
        descricao:
            "teste descricao",
        value: 6.0,
        type: true),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('EasyLanche'),
        backgroundColor: Cores.laranjaPrincipal,
      ),
      body: Container(
        height: 420,
        child: posts.isEmpty
            ? Column(
                children: [
                  SizedBox(height: 20),
                  Text(
                    "Nenhuma Postagem",
                  ),
                  SizedBox(height: 20),
                ],
              )
            : ListView.builder(
                itemCount: posts.length,
                itemBuilder: (ctx, index) {
                  final p = posts[index];
                  return CardOfertaWidget(
                    title:p.title, 
                    descricao:p.descricao,
                    value: p.value
                    );
                },
              ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.add),
        backgroundColor: Cores.laranjaPrincipal,
      ),
    );
  }
}
