import 'package:calculadora/calculadora.dart';
import 'package:calculadora/grupo_botao.dart';
import 'package:calculadora/tela.dart';
import 'package:flutter/material.dart';

class Principal extends StatefulWidget {
  const Principal({Key? key}) : super(key: key);

  @override
  State<Principal> createState() => _PrincipalState();
}

class _PrincipalState extends State<Principal> {
  Memoria memoria = Memoria();
  _onPressed(String comando) {
    setState(() {
      memoria.aplicarComando(comando);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Calculadora'),
      ),
      backgroundColor: Colors.black,
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Tela(texto: memoria.valor, textoResultado: memoria.valorResultado),
            const Divider(color: Colors.white, indent: 25, endIndent: 25),
            GrupoBotao(funcao: _onPressed),
          ],
        ),
      ),
    );
  }
}
