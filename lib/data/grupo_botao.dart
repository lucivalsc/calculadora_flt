import 'package:flutter/material.dart';

import 'package:calculadora/data/botao.dart';

class GrupoBotao extends StatelessWidget {
  final Function(String) funcao;
  const GrupoBotao({
    Key? key,
    required this.funcao,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Botao(
                texto: 'C',
                funcao: funcao,
                corTexto: Colors.red[800],
              ),
              Botao.textoVerde(
                  texto: '<', funcao: funcao, icone: Icons.backspace),
              Botao.textoVerde(texto: '%', funcao: funcao),
              Botao.textoVerde(texto: '÷', funcao: funcao),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Botao(texto: '7', funcao: funcao),
              Botao(texto: '8', funcao: funcao),
              Botao(texto: '9', funcao: funcao),
              Botao.textoVerde(texto: 'x', funcao: funcao),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Botao(texto: '4', funcao: funcao),
              Botao(texto: '5', funcao: funcao),
              Botao(texto: '6', funcao: funcao),
              Botao.textoVerde(texto: '-', funcao: funcao),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Botao(texto: '1', funcao: funcao),
              Botao(texto: '2', funcao: funcao),
              Botao(texto: '3', funcao: funcao),
              Botao.textoVerde(texto: '+', funcao: funcao),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Botao(texto: '', funcao: (String) {}),
              Botao(texto: '0', funcao: funcao),
              Botao(texto: '.', funcao: funcao),
              Botao.evento(texto: '=', funcao: funcao),
            ],
          ),
        ],
      ),
    );
  }
}
