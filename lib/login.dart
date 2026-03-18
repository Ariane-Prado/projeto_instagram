import 'package:flutter/material.dart';
import 'package:flutter_instagram/data/banco_usuarios.dart';
import 'package:flutter_instagram/home_page.dart';
import 'package:flutter_instagram/models/usuario.dart';
import 'package:flutter_instagram/novaConta.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController senhaController = TextEditingController();
  TextEditingController nomeUsuarioController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Center(
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Image.asset('assets/images/logo.png', height: 180),

                const SizedBox(height: 30),

                TextFormField(
                  controller: nomeUsuarioController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Nome de usuário',
                  ),
                  validator: (value) => value == null || value.isEmpty
                      ? 'Campo obrigatório'
                      : null,
                ),
                const SizedBox(height: 20),

                TextFormField(
                  controller: senhaController,
                  obscureText: true,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Senha',
                  ),
                  validator: (value) => value == null || value.isEmpty
                      ? 'Campo obrigatório'
                      : null,
                ),
                const SizedBox(height: 10),

                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    onPressed: () {},
                    child: const Text('Esqueceu seus dados de login?'),
                  ),
                ),

                const SizedBox(height: 10),

                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        String nomeUsuarioDigitado = nomeUsuarioController.text;
                        String senhaInformado = senhaController.text;

                        Usuario? usuarioEncontrado;

                        for (var u in BancoUsuarios.usuarios) {
                          if (u.nomeUsuario == nomeUsuarioDigitado &&
                              u.senha == senhaInformado) {
                            usuarioEncontrado = u;
                            break;
                          }
                        }

                        if (usuarioEncontrado != null) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text('Login Realizado com sucesso'),
                            ),
                          );

                           Navigator.push(context, MaterialPageRoute(builder: (context) => const HomePage()));
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(
                                'Nome de usuario ou senha invalidos',
                              ),
                            ),
                          );
                        }

                        return;
                      }
                    },
                    child: const Text('Entrar'),
                  ),
                ),
                const SizedBox(height: 20),

                const Divider(height: 40),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('Não tem uma conta?'),
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => NovaConta()),
                        );
                      },
                      child: const Text('Cadastre-se.'),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
