// ignore_for_file: prefer_function_declarations_over_variables

main() {
  var alunos = [
    {'nome': 'Alfredo', 'nota': 9.9},
    {'nome': 'Wilson', 'nota': 9.3},
    {'nome': 'Mariana', 'nota': 8.7},
    {'nome': 'Guilherme', 'nota': 8.1},
    {'nome': 'Ana', 'nota': 7.6},
    {'nome': 'Ricardo', 'nota': 6.8},
  ];

  String Function(Map) pegarApenasONomeFn = (aluno) => aluno['nome'];
  int Function(String) qtdLetrasFn = (texto) => texto.length;
  int Function(int) qtdLetrasX2Fn = (qtd) => qtd * 2;

  var resultado = alunos
    .map(pegarApenasONomeFn)
    .map(qtdLetrasFn)
    .map(qtdLetrasX2Fn);
  
  print(resultado);
}