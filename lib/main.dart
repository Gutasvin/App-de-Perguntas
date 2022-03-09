import 'package:flutter/material.dart';
import 'package:projeto/resultado.dart';
import './questionario.dart';
import './resultado.dart';

main() => runApp(new PerguntaAPP());

class PerguntaAPPState extends State<PerguntaAPP> {
  var _perguntaSelecionada = 0;
  var _pontuacaoTotal = 0;

  final _perguntas = const [
    {
      'texto': 'Qual sua cor favorita?',
      'respostas': [
        {'texto': 'Preto', 'pontuacao': 10},
        {'texto': 'Verde', 'pontuacao': 5},
        {'texto': 'Azul', 'pontuacao': 3},
        {'texto': 'Roxo', 'pontuacao': 2},
      ],
    },
    {
      'texto': 'Qual seu animal favorito?',
      'respostas': [
        {'texto': 'Macaco', 'pontuacao': 3},
        {'texto': 'Tubarao', 'pontuacao': 10},
        {'texto': 'Leao', 'pontuacao': 8},
        {'texto': 'Tigre', 'pontuacao': 9},
      ],
    },
    {
      'texto': 'Qual sua linguagem favorita?',
      'respostas': [
        {'texto': 'Java', 'pontuacao': 4},
        {'texto': 'Js', 'pontuacao': 3},
        {'texto': 'Html/css', 'pontuacao': 5},
        {'texto': 'Dart', 'pontuacao': 10},
      ],
    },
  ];

  void _responder(int pontuacao) {
    if (possuiPerguntaSelecionada) {
      setState(() {
        _perguntaSelecionada++;
        _pontuacaoTotal += pontuacao;
      });
    }
  }

  void _reiniciarQuestionario() {
    setState(() {
      _perguntaSelecionada = 0;
      _pontuacaoTotal = 0;
    });
  }

  bool get possuiPerguntaSelecionada {
    return _perguntaSelecionada < _perguntas.length;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Flutter"),
        ),
        body: possuiPerguntaSelecionada
            ? Questionario(
                perguntas: _perguntas,
                perguntaSelecionada: _perguntaSelecionada,
                quandoResponder: _responder,
              )
            : Resultado(_pontuacaoTotal, _reiniciarQuestionario),
      ),
    );
  }
}

class PerguntaAPP extends StatefulWidget {
  @override
  PerguntaAPPState createState() {
    return PerguntaAPPState();
  }
}
