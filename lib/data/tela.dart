import 'package:flutter/material.dart';

class Tela extends StatelessWidget {
  final String? texto;
  final String? textoResultado;
  const Tela({
    Key? key,
    this.texto = '0',
    this.textoResultado = '',
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 120,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Text(
            textoResultado!,
            style: const TextStyle(
              color: Colors.white,
            ),
          ),
          Text(
            texto!,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 65,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
