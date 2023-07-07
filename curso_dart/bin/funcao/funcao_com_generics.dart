
Object segundoElementoV1(List lista) {
  return lista.length >= 2 ? lista[1] : null;
}

E? terceiroElementoV2<E>(List<E> lista) {
  return lista.length >= 3 ? lista[2] : null;
}

main() {
  var lista = [3, 6, 7, 12, 45, 1];

  print(segundoElementoV1(lista));

  int? terceiroElemento = terceiroElementoV2<int>(lista); // tbm eh possivel de fazer em o <int> apos a funcao
  print(terceiroElemento);
}