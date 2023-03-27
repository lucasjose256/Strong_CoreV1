import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:strong_core/MODELS/VideoScreen.dart';
import 'package:expansion_card/expansion_card.dart';
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
        ExpansionCard(
          title:
              Container(height: 20, color: Colors.grey, child: Text('DIA 1')),
          children: [
            InfoRelatorio(
              dia: 1,
              dadosUsuario: dadosUsuario!,
              vds: videos,
            ),
          ],
        ),
        ExpansionCard(
            title:
                Container(height: 20, color: Colors.grey, child: Text('DIA 2')),
            children: [
              InfoRelatorio(
                dia: 2,
                dadosUsuario: dadosUsuario!,
                vds: videos,
              ),
            ]),
        ExpansionCard(
          title:
              Container(height: 20, color: Colors.grey, child: Text('DIA 3')),
          children: [
            InfoRelatorio(
              dia: 3,
              dadosUsuario: dadosUsuario!,
              vds: videos,
            ),
          ],
        ),
      ]),
    );
  }
}
