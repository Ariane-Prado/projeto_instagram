import 'package:flutter/material.dart';
import 'package:flutter_instagram/data/banco_usuarios.dart';
import 'package:flutter_instagram/feed.dart';
import 'package:flutter_instagram/login.dart';
import 'package:flutter_instagram/models/usuario.dart';

class NovaConta extends StatefulWidget {
  const NovaConta({super.key});

  @override
  State<NovaConta> createState() => _NovaContaState();
}

class _NovaContaState extends State<NovaConta> {
  TextEditingController emailController = TextEditingController();
  TextEditingController senhaController = TextEditingController();
  TextEditingController nomeController = TextEditingController();
  TextEditingController nomeUsuarioController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  bool dataInvalida = false;

  DateTime? dataNascimento;

  Future<void> escolherData() async {
    DateTime? dataEscolhida = await showDatePicker(
      context: context,
      initialDate: DateTime(2005, 1, 1),
      firstDate: DateTime(1950),
      lastDate: DateTime.now(),
    );

    if (dataEscolhida != null) {
      setState(() {
        dataNascimento = dataEscolhida;
        dataInvalida = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child:
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 40),

              Text(
                "Comece a usar o Instagram",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),

              SizedBox(height: 8),

              Text(
                "Cadastre-se para ver fotos e vídeos dos seus amigos.",
                style: TextStyle(fontSize: 15),
              ),

              SizedBox(height: 25),

              Text("Informe o email", style: TextStyle(fontSize: 17)),

              SizedBox(height: 10),

              TextFormField(
                controller: emailController,
                decoration: InputDecoration(
                  hintText: "email",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                validator: (value) =>
                    value == null || value.isEmpty ? 'Campo obrigatório' : null,
              ),

              SizedBox(height: 10),

              Text(
                "Você poderá receber notificações enviadas por nós.",
                style: TextStyle(fontSize: 14),
              ),

              SizedBox(height: 20),

              Text("Senha", style: TextStyle(fontSize: 17)),

              SizedBox(height: 10),

              TextFormField(
                controller: senhaController,
                obscureText: true,
                decoration: InputDecoration(
                  hintText: "Senha",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                validator: (value) =>
                    value == null || value.isEmpty ? 'Campo obrigatório' : null,
              ),

              SizedBox(height: 20),

              Text("Data de Nascimento", style: TextStyle(fontSize: 17)),

              SizedBox(
                width: double.infinity,
                child: OutlinedButton(
                  onPressed: escolherData,
                  style: OutlinedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    padding: EdgeInsets.symmetric(vertical: 18, horizontal: 12),
                  ),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      dataNascimento == null
                          ? "Escolher data"
                          : "${dataNascimento!.day}/${dataNascimento!.month}/${dataNascimento!.year}",
                      style: TextStyle(color: Colors.black87, fontSize: 16),
                    ),
                  ),
                ),
              ),

              if (dataInvalida)
                const Padding(
                  padding: EdgeInsets.only(top: 8, left: 12),
                  child: Text(
                    'Escolha a data de nascimento',
                    style: TextStyle(color: Colors.red, fontSize: 12),
                  ),
                ),

              Text("Nome", style: TextStyle(fontSize: 17)),

              SizedBox(height: 10),

              TextFormField(
                controller: nomeController,
                decoration: InputDecoration(
                  hintText: "Nome completo",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                validator: (value) =>
                    value == null || value.isEmpty ? 'Campo obrigatório' : null,
              ),

              SizedBox(height: 20),

              Text("Nome de usuário", style: TextStyle(fontSize: 17)),

              SizedBox(height: 10),

              TextFormField(
                controller: nomeUsuarioController,
                decoration: InputDecoration(
                  hintText: "Nome de usuário",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                validator: (value) =>
                    value == null || value.isEmpty ? 'Campo obrigatório' : null,
              ),

              SizedBox(height: 25),

              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () async {
                    bool formularioValido = _formKey.currentState!.validate();

                    setState(() {
                      dataInvalida = dataNascimento == null;
                    });

                    if (!formularioValido || dataNascimento == null) {
                      return;
                    }

                    String email = emailController.text.trim();
                    String senha = senhaController.text.trim();
                    String nome = nomeController.text.trim();
                    String nomeUsuario = nomeUsuarioController.text.trim();

                    String dataFormatada =
                        "${dataNascimento!.day}/${dataNascimento!.month}/${dataNascimento!.year}";

                    Usuario usuario = Usuario(
                      email: email,
                      senha: senha,
                      nome: nome,
                      nomeUsuario: nomeUsuario,
                      dataNascimento: dataFormatada,
                    );

                    BancoUsuarios.usuarios.add(usuario);

                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Usuario Cadastrado')),
                    );

                    Navigator.pop(context);
                  },

                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(4),
                    ),
                  ),
                  child: Text('Avançar'),
                ),
              ),
            ],
          ),
        ),
      ),
      )
    );
  }
}
