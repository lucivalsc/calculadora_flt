import 'package:flutter/material.dart';

class Botao extends StatelessWidget {
  final String texto;
  final void Function(String) funcao;
  final Color? cor;
  final Color? corTexto;
  final IconData? icone;

  const Botao({
    Key? key,
    required this.texto,
    required this.funcao,
    this.cor,
    this.corTexto,
    this.icone,
  }) : super(key: key);
  const Botao.evento({
    Key? key,
    required this.texto,
    required this.funcao,
    this.cor = Colors.green,
    this.corTexto,
    this.icone,
  }) : super(key: key);
  const Botao.textoVerde({
    Key? key,
    required this.texto,
    required this.funcao,
    this.cor,
    this.corTexto = Colors.green,
    this.icone,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      width: 60,
      // margin: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: cor == null ? Color.fromRGBO(60, 60, 60, 0.3) : cor,
        borderRadius: BorderRadius.circular(50),
      ),
      child: InkWell(
        onTap: () {
          funcao(texto);
        },
        child: Center(
          child: icone == null
              ? Text(
                  texto,
                  style: TextStyle(
                    color: corTexto == null ? Colors.white : corTexto,
                    fontSize: 30,
                  ),
                )
              : Icon(
                  icone,
                  color: Colors.white,
                ),
        ),
      ),
    );
  }
}
