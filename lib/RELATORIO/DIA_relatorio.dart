import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:strong_core/MODELS/VideoScreen.dart';

import 'cria_relatorio_exercicio.dart';

class RelatorioDia extends StatelessWidget {
  final List<VideoScreen> videos;

  DocumentSnapshot dadosUsuario;
  RelatorioDia({Key? key, required this.dadosUsuario, required this.videos})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(children: [
        Container(
          child: Column(children: [
            Text('DIA 1'),
            InfoRelatorio(
              dia: 1,
              dadosUsuario: dadosUsuario!,
              vds: videos,
            ),
            Text('DIA 2'),
            InfoRelatorio(
              dia: 2,
              dadosUsuario: dadosUsuario!,
              vds: videos,
            ),
            Text('DIA 3'),
            InfoRelatorio(
              dia: 3,
              dadosUsuario: dadosUsuario!,
              vds: videos,
            ),
          ]),
        )
      ]),
    );
  }
}
