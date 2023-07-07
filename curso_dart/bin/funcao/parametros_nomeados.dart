main () {
  saudarPessoa(nome: 'fabio', idade: 16);
  saudarPessoa(idade: 67, nome: 'ze'); // n importa a ordem
}

saudarPessoa({String? nome, int? idade}) { // {} significa que os parametros sao nomeados
  print("Ola $nome nem parece que vc tem $idade anos.");
}