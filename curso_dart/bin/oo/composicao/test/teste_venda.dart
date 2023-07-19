import '../model/venda.dart';
import '../model/cliente.dart';
import '../model/venda_item.dart';
import '../model/produto.dart';

main() {
  var venda = Venda(
    cliente: Cliente(
      nome: 'Valdisclei',
      cpf: '123.456.789-00',
    ),
    itens: <VendaItem>[
      VendaItem(
        quantidade: 30,
        produto: Produto(
          codigo: 1,
          nome: "Caneta Azul",
          preco: 6.00,
          desconto: 0.5,
        ),
      ),
      VendaItem(
        quantidade: 20,
        produto: Produto(
          codigo: 213,
          nome: "Caderno",
          preco: 20.00,
          desconto: 0.25,
        ),
      ),
      VendaItem(
        quantidade: 100,
        produto: Produto(
          codigo: 48,
          nome: "Borracha que apaga caneta",
          preco: 2.00,
          desconto: 0.5,
        ),
      ),
    ],
  );

  print("O valor total da venda é : R\$${venda.valorTotal}");
  print("Nome do primeiro produto é: ${venda.itens?[0].produto?.nome}");
  print("O CPF do cliente é: ${venda.cliente?.cpf}");
  print("O Nome do cliente é: ${venda.cliente?.nome}");
}
