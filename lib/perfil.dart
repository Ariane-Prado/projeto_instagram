import 'package:flutter/material.dart';

class Perfil extends StatelessWidget {
  const Perfil({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        AppBar(
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
      Row(
        children: [
          const CircleAvatar(
            radius: 45,
            child: Icon(Icons.person, size: 45),
          ),
          const SizedBox(width: 20),

          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text(
                'nome_usuario',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 4),
              Row(
                children: [
                  Column(
                    children: [
                      Text(
                        '12',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                      Text('Posts'),
                    ],
                  ),
                  SizedBox(width: 10),
                  Column(
                    children: [
                      Text(
                        '340',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                      Text('Seguidores'),
                    ],
                  ),
                  SizedBox(width: 10),
                  Column(
                    children: [
                      Text(
                        '180',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                      Text('Seguindo'),
                    ],
                  ),
                ],
              ),
            ],
        ),
        ],
      ),
      SizedBox(height: 10),
      Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            
            Text('Em algum momento do processo vai uma BIO aqui sgfag '),
            Padding(padding: EdgeInsetsGeometry.all(5)),
            Text('@arroba_usuario', style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 15,),)
          ],
        ),

      ),
  
        const SizedBox(height: 25),
        GridView.count(
          crossAxisCount: 3,
          crossAxisSpacing: 4,
          mainAxisSpacing: 4,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          children: List.generate(20, (index) {
            return Container(
              color: Colors.grey[300],
              child: const Icon(Icons.image),
            );
          }),
        ),
      ],
    );
  }
}