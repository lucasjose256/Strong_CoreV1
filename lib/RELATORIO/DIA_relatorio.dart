import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:strong_core/MODELS/VideoScreen.dart';
import 'package:expansion_card/expansion_card.dart';
import 'cria_relatorio_exercicio.dart';

class RelatorioDia extends StatefulWidget {
  final List<VideoScreen> videos;

  DocumentSnapshot dadosUsuario;
  RelatorioDia({Key? key, required this.dadosUsuario, required this.videos})
      : super(key: key);

  @override
  State<RelatorioDia> createState() => _RelatorioDiaState();
}

class _RelatorioDiaState extends State<RelatorioDia> {
  DateTime? horario;
  @override
  void initState() {
    super.initState();
    caregaMap();
  }

  void caregaMap() async {
    horario = (widget.dadosUsuario.get(
                '_HORARIO_LIBERA_PROXIMO_VIDEO_SEMANA_${widget.videos[0].numSemana}')
            as Timestamp)
        .toDate();
  }

  @override
  Widget build(BuildContext context) {
    if (horario == null ||
        horario!.isBefore(
          DateTime.utc(1999, 1, 9),
        )) {
      return Container(
        child: Text(
          'Ainda não temos informação sobre os exercícios dessa semana',
          style: TextStyle(fontSize: 15),
        ),
        color: Color.fromARGB(255, 247, 247, 247),
      );
    } else {
      return Container(
        child: Column(children: [
          Card(
            elevation: 4,
            color: Colors.grey,
            child: ExpansionTile(
              title: Text(
                'DIA 1',
                style: TextStyle(color: Colors.white),
              ),
              collapsedIconColor: Colors.white,
              iconColor: Colors.white,
              backgroundColor: Colors.grey,
              children: [
                InfoRelatorio(
                  dia: 1,
                  dadosUsuario: widget.dadosUsuario!,
                  vds: widget.videos,
                ),
              ],
            ),
          ),
          Card(
            elevation: 4,
            color: Colors.grey,
            child: ExpansionTile(
              title: Text(
                'DIA 2',
                style: TextStyle(color: Colors.white),
              ),
              collapsedIconColor: Colors.white,
              iconColor: Colors.white,
              backgroundColor: Colors.grey,
              children: [
                InfoRelatorio(
                  dia: 2,
                  dadosUsuario: widget.dadosUsuario!,
                  vds: widget.videos,
                ),
              ],
            ),
          ),
          Card(
            elevation: 4,
            color: Colors.grey,
            child: ExpansionTile(
              title: Text(
                'DIA 3',
                style: TextStyle(color: Colors.white),
              ),
              collapsedIconColor: Colors.white,
              iconColor: Colors.white,
              backgroundColor: Colors.grey,
              children: [
                //   Row(children: [Text('EXERCICIO'), Text('   loops 1 2 3 4 5  ')]),
                InfoRelatorio(
                  dia: 3,
                  dadosUsuario: widget.dadosUsuario!,
                  vds: widget.videos,
                ),
              ],
            ),
          ),
        ]),
      );
    }
  }
}
