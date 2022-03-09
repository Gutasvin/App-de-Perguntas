import 'package:flutter/material.dart';

class Resultado extends StatelessWidget {
  final int pontuacao;
  final void Function() questionarioReiniciado;

  Resultado(this.pontuacao, this.questionarioReiniciado);

  String get fraseResultado {
    if (pontuacao < 8) {
      return "Tu é frio!";
    } else if (pontuacao < 15) {
      return "Tu é morninho!";
    } else if (pontuacao < 24) {
      return "Tu é morno!";
    } else {
      return "Tu é quente!";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(child: Text(fraseResultado, style: TextStyle(fontSize: 25))),
        FlatButton(
          child: Text("Reiniciar"),
          textColor: Colors.blue,
          onPressed: questionarioReiniciado,
        )
      ],
    );
  }
}
