import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:strong_core/MODELS/VideoScreen.dart';
import 'package:strong_core/RELATORIO/DIA_relatorio.dart';

import 'cria_relatorio_exercicio.dart';

class Relatorio extends StatefulWidget {
  Relatorio({
    Key? key,
  }) : super(key: key);

  @override
  State<Relatorio> createState() => _RelatorioState();
}

class _RelatorioState extends State<Relatorio> {
  late DocumentSnapshot dadosUsuario;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
  }

  Future<void> getData() async {
    dadosUsuario = await FirebaseFirestore.instance
        .collection('user')
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .get();
    //mudar para um provider
  }

  @override
  Widget build(BuildContext context) {
    int i = 0;
    int j = 0;
    return FutureBuilder(
        future: getData(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Scaffold(body: Center(child: CircularProgressIndicator()));
          } else {
            return Scaffold(
              body: ListView(children: [
                Text(
                  'RELATORIO',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 25),
                ),
                Column(
                    children: VIDEOS_SEMANAS.map((e) {
                  return Container(
                    child: Column(
                      children: [
                        Text(
                          'SEMANA ' + e[i].numSemana,
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 20),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        RelatorioDia(dadosUsuario: dadosUsuario, videos: e)
                        //CRIAR UMA WIDGET E UM ALGORITIMO PARA ADICIONAR OS EXERCICIOS
                      ],
                    ),
                  );
                }).toList())
              ]),
            );
          }
        });
  }
}
