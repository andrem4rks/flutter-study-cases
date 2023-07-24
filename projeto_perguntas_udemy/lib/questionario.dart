import 'package:flutter/material.dart';
import 'package:projeto_perguntas_udemy/questao.dart';
import 'package:projeto_perguntas_udemy/resposta.dart';

class Questionario extends StatelessWidget {
  const Questionario(
      {required this.perguntas,
      required this.perguntaSelecionada,
      required this.quandoSelecionado,
      super.key});

  final List<Map<String, Object>> perguntas;
  final int perguntaSelecionada;
  final void Function(int) quandoSelecionado;

  bool get temPerguntaSelecionada {
    return perguntaSelecionada < perguntas.length;
  }

  @override
  Widget build(BuildContext context) {
    List<Map<String, Object>> respostas = temPerguntaSelecionada
        ? perguntas[perguntaSelecionada].cast()['respostas']
        : [];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Questao(perguntas[perguntaSelecionada]['texto'].toString()),
        ...respostas.map((resp) {
          return Resposta(
            resp['texto'] as String,
            () => quandoSelecionado(int.parse(resp['pontuacao'].toString())),
          );
        }).toList(),
      ],
    );
  }
}
