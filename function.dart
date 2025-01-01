void main() {
  saudacoes('Larissa Souza');
}

void saudacoes(String nome) {
  print("Saudações da $nome");
  print('Seja bem-vindo(a)!');
  print('Agora: ${agora()}');
}

String agora() {
  DateTime agora = DateTime.now();
  return agora.toString();
}
