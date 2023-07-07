// ignore_for_file: prefer_function_declarations_over_variables

import 'dart:math';

void executar(Function fnPar, Function fnImpar) {
  var sorteado = Random().nextInt(10); 
  print('O valor sorteado foi $sorteado');
  sorteado % 2 == 0 ? fnPar() : fnImpar();
}

main () {
  var minhaFnPar = () => print('O valor é par!');
  var minhaFnImpar = () => print('O valor é impar!');

  executar(minhaFnPar, minhaFnImpar);
}