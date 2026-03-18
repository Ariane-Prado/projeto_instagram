import 'package:flutter/material.dart';
import 'package:flutter_instagram/models/postFeed.dart';
import 'package:flutter_instagram/post_feed.dart';

class Feed extends StatelessWidget {
  const Feed({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Post> posts = [
      Post(
        usuario: 'user1',
        imagemAsset: 'assets/images/post1.jpg',
        legenda: 'Acampandando na Serra Gaucha, curtindo uma linda paisagem',
      ),
      Post(
        usuario: 'user2',
        imagemAsset: 'assets/images/post2.jpg',
        legenda: 'Grafite tambem é arte!!',
      ),
      Post(
        usuario: 'user3',
        imagemAsset: 'assets/images/post3.jpg',
        legenda: 'Rumo Desconhecido',
      ),
      Post(
        usuario: 'user1',
        imagemAsset: 'assets/images/post1.jpg',
        legenda: 'Acampandando na Serra Gaucha, curtindo uma linda paisagem',
      ),
      Post(
        usuario: 'user2',
        imagemAsset: 'assets/images/post2.jpg',
        legenda: 'Grafite tambem é arte!!',
      ),
      Post(
        usuario: 'user3',
        imagemAsset: 'assets/images/post3.jpg',
        legenda: 'Rumo Desconhecido',
      ),
    ];

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(Icons.add),
        ),
        title: Image.asset('assets/images/logo.png', height: 80),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.favorite_border),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: ListView(
          children: [
            SizedBox(
              height: 100,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: List.generate(25, (index) {
                  return Padding(
                    padding: const EdgeInsets.only(right: 10),
                    child: Column(
                      children: [
                        const CircleAvatar(
                          radius: 30,
                          child: Icon(Icons.person),
                        ),
                        const SizedBox(height: 5),
                        Text("User $index"),
                      ],
                    ),
                  );
                }),
              ),
            ),
            const Divider(),
            ...List.generate(posts.length, (index) {
              return PostFeed(
                usuario: posts[index].usuario,
                descricao: posts[index].legenda,
                imagemAsset: posts[index].imagemAsset,
              );
            }),
          ],
        ),
      ),
    );
  }
}