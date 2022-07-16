import 'package:flutter/material.dart';

class Provisoria extends StatelessWidget {
  const Provisoria({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 100,
          width: 100,
          color: Colors.blue,
          child: const Text(
            'Selecione o grau da dor',
          ),
        ),
      ],
    );
  }
}
