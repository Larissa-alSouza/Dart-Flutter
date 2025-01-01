void main() {
  saudacoes('Larissa', false);
  saudacoes('Larissa Souza', true);
}

void saudacoes(String nome, bool mostrarAgora) {
  print('Saudações da $nome');
  print('Seja bem-vindo(a)!');
  if (mostrarAgora) {
    print('Agora: ${agora()}');
  }
}

String agora() {
 DateTime agora = DateTime.now();
 return agora.toString();
}
