import 'package:flutter/material.dart';

class Provisoria extends StatelessWidget {
  const Provisoria({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: 100,
      color: Colors.blue,
      child: Text(
        'Selecione o grau da dor',
      ),
    );
  }
}
