class Data {
  int? dia;
  int? mes;
  int? ano;

  String obter() {
    return "$dia/$mes/$ano";
  }

  String toString() {
    return obter();
  }
}

main() {
  var dataAniversario = new Data();
  dataAniversario.dia = 3;
  dataAniversario.mes = 10;
  dataAniversario.ano = 2020;

  Data dataCompra = Data();
  dataCompra.dia = 23;
  dataCompra.mes = 12;
  dataCompra.ano = 2021;

  // print("${dataAniversario.dia}/${dataAniversario.mes}/${dataAniversario.ano}");
  // print("${dataCompra.dia}/${dataCompra.mes}/${dataCompra.ano}");
  print(dataAniversario.obter());
  print(dataCompra.obter());

  print(dataCompra);

  
  

}