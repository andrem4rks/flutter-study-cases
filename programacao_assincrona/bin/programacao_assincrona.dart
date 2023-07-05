import 'package:programacao_assincrona/programacao_assincrona.dart'
    as programacao_assincrona;

void main() {
  var future = Future.delayed(Duration(seconds: 2));

  future.then((value) => print(4));

  print('1');
  print('2');
  print('3');


}
