// ignore_for_file: prefer_function_declarations_over_variables

List<E> filtrar<E>(List<E> lista, Function(E) fn) {
  List<E> listaFiltrada = [];
  for(E elemento in lista) {
    if(fn(elemento)) {
      listaFiltrada.add(elemento);
    }
  }
  return listaFiltrada;
}

main() {
  var notas = [8.2, 7.3, 6.8, 5.4, 2.7, 9.3];

  var boasNotasFn = (double nota) => nota >= 7.5;

  var notasFiltradas = filtrar<double>(notas, boasNotasFn);

  print(notas);
  print(notasFiltradas);

  var nomes = ['Ana', 'Bia', 'Rebeca', 'Guia', 'João'];
  var nomesGrandesFn = (String nome) => nome.length >= 5;

  var nomesFiltrados = filtrar<String>(nomes, nomesGrandesFn);
  print(nomes);
  print(nomesFiltrados);
}