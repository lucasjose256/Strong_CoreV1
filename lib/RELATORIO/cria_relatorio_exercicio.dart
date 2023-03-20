import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import '../MODELS/VideoScreen.dart';
import '../MODELS/lista_semanas.dart';

class InfoRelatorio extends StatelessWidget {
  final List<VideoScreen> vds;
  final int dia;
  DocumentSnapshot? dadosUsuario;
  InfoRelatorio(
      {Key? key,
      required this.vds,
      required this.dadosUsuario,
      required this.dia})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
          children: vds.map((e) {
        List<Container> linhaTabela = [];
        List<Text> exercicios_por_loop = [];
        List<Text> exercicios_por_loop_DIR_ESQ = [];
        for (int loop = 1; loop <= e.loop; loop++) {
          try {
            if (e.nomeSemLado != null) {
              exercicios_por_loop_DIR_ESQ.add(Text(dadosUsuario!
                      .get(
                        'SEM_${vds[1].numSemana}_DIA${dia.toString()}_EXERCICIO_${e.nomeExercicioDE}${loop.toString()}'
                                ' ' ??
                            Text(''),
                      )
                      .toString() +
                  ' '));
            }
            exercicios_por_loop.add(Text(dadosUsuario!
                    .get(
                      'SEM_${vds[1].numSemana}_DIA${dia.toString()}_EXERCICIO_${e.nomeExercicio}${loop.toString()}' ??
                          Text(''),
                    )
                    .toString() +
                ' '));
          } catch (e) {
            print(e);
          }
        }
        return Container(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                      child: Text(
                    e.nomeExercicio,
                    style: TextStyle(
                      fontSize: 15,
                    ),
                    maxLines: 4,
                  )),
                  SizedBox(
                    width: 10,
                  ),
                  Row(
                    children: exercicios_por_loop,
                  ),
                ],
              ),
              e.nomeExercicioDE != null
                  ? Row(
                      children: [
                        Expanded(
                          child: Text(
                            e.nomeExercicioDE!,
                            style: TextStyle(
                              fontSize: 15,
                            ),
                            maxLines: 4,
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Row(
                          children: exercicios_por_loop_DIR_ESQ,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        ),
                      ],
                    )
                  : Container()
            ],
          ),
        );

        //  linhaTabela.add(rw);
        //      return Container(child: Column(children: linhaTabela));
      }).toList()),
    );
  }
}

/*class InfoRelatorio extends StatelessWidget {
  final List<VideoScreen> vds;
  DocumentSnapshot dadosUsuario;
  InfoRelatorio({Key? key, required this.vds, required this.dadosUsuario})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
          children: vds.map((e) {
        List<Container> linhaTabela = [];
        for (int dia = 1; dia < 3; dia++) {
          for (int loop = 1; loop < e.loop; loop++) {
            var rw = Container(
              child: FittedBox(
                child: Row(
                  children: [
                    Text(e.nomeExercicio),
                    SizedBox(
                      width: 10,
                    ),            
                    Text('Resultado:' +
                        dadosUsuario
                            .get(
                                'SEM_${vds[1].numSemana}_DIA${dia.toString()}_EXERCICIO_${e.nomeExercicio + loop.toString()}')
                            .toString())
                  ],
                ),
              ),
            );

            linhaTabela.add(rw);
          }
        }

        return Container(child: Column(children: linhaTabela));
      }).toList()),
    );
  }
}
*/
/*class InfoVideo {
  final int loop;
  final int numSemana;
  final String nomeVideo;
  InfoVideo(this.loop, this.nomeVideo, this.numSemana);
}
*/
List<List<VideoScreen>> VIDEOS_SEMANAS = [
  videos1,
  videos2,
  videos3,
  videos4,
  videos5,
  videos6,
  videos7,
  videos8,
  videos9,
  /*InfoVideo(3, 'PRANCHA DORSAL', 1),
  InfoVideo(3, 'PRANCHA VENTRAL', 1),*/
];
