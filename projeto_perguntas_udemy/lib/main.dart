// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors, avoid_print, library_private_types_in_public_api

import 'package:flutter/material.dart';
import './questao.dart';

main() => runApp(PerguntaApp());

class _PerguntaAppState extends State<PerguntaApp> {
  var _perguntaSelecionada = 0;

  void _responder() {
    print(_perguntaSelecionada);
    if (_perguntaSelecionada + 1 <= 1) {
      setState(() {
        _perguntaSelecionada++;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final perguntas = [
      'Qual é a sua cor favorita?',
      'Qual seu animal favorito?',
    ];
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Center(
            child: Text('Second App'),
          ),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Questao(perguntas[_perguntaSelecionada]),
            ElevatedButton(
              onPressed: _responder,
              child: (Text('Resposta 1')),
            ),
            ElevatedButton(
              onPressed: _responder,
              child: (Text('Resposta 2')),
            ),
            ElevatedButton(
              onPressed: _responder,
              child: (Text('Resposta 3')),
            ),
          ],
        ),
      ),
    );
  }
}

class PerguntaApp extends StatefulWidget {
  @override
  _PerguntaAppState createState() {
    return _PerguntaAppState();
  }
}
