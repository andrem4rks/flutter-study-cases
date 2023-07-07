// ignore_for_file: prefer_function_declarations_over_variables

int executarPor(int qtde, String Function(String) fn, String valor) {
  String textoCompleto = '';
  for(int i = 0; i < qtde; i++) {
    textoCompleto += fn(valor);
  }
  return textoCompleto.length;
}

main () {
  var meuPrint = (String valor) {
    print(valor);
    return valor;
  };
  int tamanho = executarPor(10, meuPrint, 'Muito Legal');
  print('O tamanho da string é de $tamanho');
}