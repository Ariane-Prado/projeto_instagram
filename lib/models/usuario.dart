class Usuario {
  String email;
  String senha;
  String nome;
  String nomeUsuario;
  String? dataNascimento;

  Usuario({
    required this.email,
    required this.senha,
    required this.nome,
    required this.nomeUsuario,
    this.dataNascimento,
  });
  
}