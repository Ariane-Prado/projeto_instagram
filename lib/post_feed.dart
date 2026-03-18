import 'package:flutter/material.dart';

class PostFeed extends StatefulWidget {
  final String usuario;
  final String descricao;
  final String imagemAsset;

  const PostFeed({
    super.key,
    required this.usuario,
    required this.descricao,
    required this.imagemAsset,
  });

  @override
  State<PostFeed> createState() => _PostFeedState();
}

class _PostFeedState extends State<PostFeed> {
  bool curtido = false;
  bool mostrarCoracao = false;

  TextEditingController comentarioController = TextEditingController();

  List<String> listaComentarios = ['Muito bom!'];

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              GestureDetector(
                onDoubleTap: () {
                  setState(() {
                    curtido = true;
                    mostrarCoracao = true;
                  });

                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Post curtido!'),
                      duration: Duration(seconds: 1),
                    ),
                  );

                  Future.delayed(const Duration(milliseconds: 700), () {
                    setState(() {
                      mostrarCoracao = false;
                    });
                  });
                },
                child: Image.asset(
                  widget.imagemAsset,
                  height: 250,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
              Positioned(
                top: 10,
                left: 10,
                child: Row(
                  children: [
                    const CircleAvatar(
                      radius: 18,
                      child: Icon(Icons.person, size: 18),
                    ),
                    const SizedBox(width: 8),
                    Text(
                      widget.usuario,
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              if (mostrarCoracao)
                const Positioned.fill(
                  child: Center(
                    child: Icon(
                      Icons.favorite,
                      color: Colors.red,
                      size: 120,
                    ),
                  ),
                ),
            ],
          ),
          Row(
            children: [
              IconButton(
                onPressed: () {
                  setState(() {
                    curtido = !curtido;
                  });
                },
                icon: Icon(
                  curtido ? Icons.favorite : Icons.favorite_border,
                  color: curtido ? Colors.red : Colors.black,
                ),
              ),
              IconButton(
                onPressed: () {
                  showModalBottomSheet(
                    context: context,
                    isScrollControlled: true,
                    builder: (context) {
                      return StatefulBuilder(
                        builder: (context, setModalState) {
                          return Padding(
                            padding: EdgeInsets.only(
                              left: 16,
                              right: 16,
                              top: 16,
                              bottom: MediaQuery.of(context).viewInsets.bottom + 16,
                            ),
                            child: SizedBox(
                              height: 400,
                              child: Column(
                                children: [
                                  const Text(
                                    'Comentários',
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const SizedBox(height: 10),
                                  Expanded(
                                    child: ListView.builder(
                                      itemCount: listaComentarios.length,
                                      itemBuilder: (context, index) {
                                        return ListTile(
                                          leading: const CircleAvatar(
                                            child: Icon(Icons.person),
                                          ),
                                          title: Text(listaComentarios[index]),
                                        );
                                      },
                                    ),
                                  ),
                                  Row(
                                    children: [
                                      Expanded(
                                        child: TextField(
                                          controller: comentarioController,
                                          decoration: const InputDecoration(
                                            hintText: 'Digite um comentário',
                                          ),
                                        ),
                                      ),
                                      IconButton(
                                        onPressed: () {
                                          if (comentarioController.text.isNotEmpty) {
                                            setState(() {
                                              listaComentarios.add(comentarioController.text);
                                            });

                                            setModalState(() {});

                                            comentarioController.clear();
                                          }
                                        },
                                        icon: const Icon(Icons.send),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      );
                    },
                  );
                },
                icon: const Icon(Icons.mode_comment_outlined),
              ),
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.send_outlined),
              ),
              const Spacer(),
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.bookmark_border),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Text(
              '${listaComentarios.length} comentários',
              style: const TextStyle(color: Colors.grey),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            child: Row(
              children: [
                Text(
                  widget.usuario,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                const SizedBox(width: 5),
                Expanded(child: Text(widget.descricao)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}