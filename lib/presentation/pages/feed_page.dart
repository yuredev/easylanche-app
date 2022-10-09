import 'package:easylanche/core/constants/cores.dart';
import 'package:flutter/material.dart';

import '../../logic/models/post.dart';
import '../widgets/feed/card_oferta_widget.dart';

class FeedPage extends StatelessWidget {
  final List<Post> posts = [
    Post(
        id: "1",
        title: "Título da oferta",
        descricao: "Descrição",
        value: 3.0,
        type: true),
    Post(
        id: "2",
        title: "Título da oferta",
        descricao: "Descrição",
        value: 5.0,
        type: true),
    Post(
        id: "3",
        title: "Título da oferta",
        descricao: "Descrição",
        value: 6.0,
        type: true),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "EasyLanche",
          style: TextStyle(
            color: Color.fromARGB(255, 0, 0, 0),
            fontWeight: FontWeight.bold,
          ),
        ),
        titleSpacing: 00.0,
        centerTitle: true,
        toolbarHeight: 60.2,
        toolbarOpacity: 0.8,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(25),
              bottomLeft: Radius.circular(25)),
        ),
        elevation: 0.00,
        backgroundColor: Cores.laranjaPrincipal,
      ), //
      body: Container(
        constraints: BoxConstraints.expand(),
        color: Cores.cinzaBackground,
        height: 420,
        child: posts.isEmpty
            ? Center(
                child: Column(
                  children: [
                    SizedBox(height: 20),
                    Text(
                      "Nenhuma Postagem",
                    ),
                    SizedBox(height: 20),
                  ],
                ),
              )
            : ListView.builder(
                itemCount: posts.length,
                itemBuilder: (ctx, index) {
                  final p = posts[index];
                  return Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: CardOfertaWidget(
                        title: p.title, descricao: p.descricao, value: p.value),
                  );
                },
              ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: Cores.laranjaPrincipal,
        foregroundColor: Colors.black,
        onPressed: () {},
        label: Text('Criar Oferta',
            style: TextStyle(
              fontWeight: FontWeight.bold,
            )),
        icon: Icon(Icons.add),
      ),
    );
  }
}
