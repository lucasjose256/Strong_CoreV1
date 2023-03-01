import 'dart:typed_data';
import 'dart:ui' as ui;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:provider/provider.dart';
import 'package:screenshot/screenshot.dart';
import 'package:strong_core/SCREENS/screen_semanas.dart';
import 'package:strong_core/provider/colors.dart';
import 'package:strong_core/style/add_pop_up_card.dart';
import 'package:intl/intl.dart';
import 'package:strong_core/MODELS/botao_duplo.dart';
import 'package:strong_core/MODELS/sequencial_buttun.dart';

import '../MODELS/user_preferences.dart';
import '../provider/colors2.dart';

class AuxCorpoHumano extends StatefulWidget {
  final String numSem;
  const AuxCorpoHumano({Key? key, required this.numSem}) : super(key: key);

  @override
  State<AuxCorpoHumano> createState() => _AuxCorpoHumanoState();
}

class _AuxCorpoHumanoState extends State<AuxCorpoHumano> {
  List<Color> cores = [];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  List<String> grauDores = [];
  Uint8List? bytes;
  GlobalKey _globalKey = GlobalKey();
  bool loading = false;

  @override
  Widget build(BuildContext context) {
    Stack dataCorpo;
    AddTodoButton pescoco1;
    AddTodoButton pescoco2;
    Color color = Colors.black;

    AddTodoButton ombroDir = AddTodoButton(
      number: '6',
      numberId: 'DIR',
      nomeMembro: 'na região do ombro DIREITO',
    );
    AddTodoButton ombroEsq;

    AddTodoButton regiaoCervical1;

    AddTodoButton;
    AddTodoButton costasSuperior2;
    AddTodoButton costasMedia3;
    AddTodoButton costasInferior4;
    AddTodoButton bacia5;
    AddTodoButton;
    AddTodoButton;
    AddTodoButton;
    BotaoDuplo data;
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Text('Strong Core'),
          centerTitle: true,
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child:
                  Stack(alignment: AlignmentDirectional.topCenter, children: [
                Image.asset('Assets/images/corpoHumano.png'),
                Positioned(
                    right: 138,
                    top: 75,
                    child: regiaoCervical1 = AddTodoButton(
                      number: '1',
                      numberId: '',
                      nomeMembro: 'na região cervical',
                    )),
                Positioned(
                    right: 138,
                    top: 130,
                    child: costasSuperior2 = AddTodoButton(
                      number: '2',
                      numberId: '',
                      nomeMembro: 'na região da costas superior',
                    )),
                Positioned(
                    right: 138,
                    top: 177,
                    child: costasMedia3 = AddTodoButton(
                      number: '3',
                      numberId: '',
                      nomeMembro: 'na região das costas média',
                    )),

                /*  Positioned(
                    right: 79,
                    top: 90,
                    child: ombroDir = AddTodoButton(
                      number: '6',
                      numberId: 'DIR',
                      nomeMembro: 'na região do ombro DIREITO',
                    )),
                Positioned(
                    right: 200,
                    top: 90,
                    child: ombroEsq = AddTodoButton(
                      number: '6',
                      numberId: 'ESQ',
                      nomeMembro: 'na região do ombro ESQUERDO',
                    )),*/
                Positioned(
                  //   top: ,
                  child: ChangeNotifierProvider<Cor2>(
                    create: (context) => Cor2(),
                    child: ChangeNotifierProvider<Cor1>(
                        create: (context) => Cor1(),
                        child: data = BotaoDuplo(
                          phraseCard: 'do OMBRO',
                          buttunDistance: 50,
                          numberButtun: '8',
                        )),
                  ),
                ),

                // Positioned(right: 230, top: 175, child: ombroDir),
                /* Positioned(
                  right: 48,
                  top: 175,
                  child: ChangeNotifierProvider<Cor1>(
                    create: ((context) => Cor1()),
                    child: AddTodoButtonSeq(
                      botaoEsqDir: ombroDir,
                      nomeMembro: 'na região do ombro ESQUERDO',
                      number: '6',
                      numberId: 'ESQ',
                      onchange: (newvalue) {
                        setState(() {
                          ombroDir.newColor = newvalue;
                        });
                      },
                    ),
                  ),
                ),
                Positioned(
                  right: 230,
                  top: 175,
                  child: ChangeNotifierProvider<Cor1>(
                      create: ((context) => Cor1()),
                      child: AddTodoButtonSeq(
                        botaoEsqDir: ombroDir,
                        nomeMembro: 'na região do ombro ',
                        number: '6-',
                        numberId: 'DIR',
                      )),
                ),
*/
                /*  AddTodoButton(
                  number: '6',
                  numberId: 'ESQ',
                  nomeMembro: 'na região do ombro ESQUERDO',
                ),*/

                /*
                Positioned(
                    right: 138,
                    top: 211,
                    child: costasInferior4 =
                        AddTodoButton(number: '4', numberId: '')),
                Positioned(
                    right: 138,
                    top: 247,
                    child: bacia5 = AddTodoButton(number: '5', numberId: '')),
      
                Positioned(
                    right: 60,
                    top: 140,
                    child: AddTodoButton(number: '7', numberId: '1')),
                Positioned(
                    right: 220,
                    top: 140,
                    child: AddTodoButton(number: '7', numberId: '2')),
                Positioned(
                    right: 48,
                    top: 175,
                    child: AddTodoButton(number: '8', numberId: '1')),
                Positioned(
                    right: 230,
                    top: 175,
                    child: AddTodoButton(number: '8', numberId: '2')),
                Positioned(
                    right: 240,
                    top: 208,
                    child: AddTodoButton(number: '9', numberId: '1')),
                Positioned(
                    right: 38,
                    top: 208,
                    child: AddTodoButton(number: '9', numberId: '2')),
                Positioned(
                    right: 250,
                    top: 250,
                    child: AddTodoButton(number: '10', numberId: '1')),
                Positioned(
                    right: 20,
                    top: 250,
                    child: AddTodoButton(number: '10', numberId: '2')),
                Positioned(
                    right: 172,
                    top: 331,
                    child: AddTodoButton(number: '12', numberId: '1')),
                Positioned(
                    right: 105,
                    top: 331,
                    child: AddTodoButton(number: '12', numberId: '2')),
                Positioned(
                    right: 172,
                    top: 390,
                    child: AddTodoButton(number: '13', numberId: '1')),
                Positioned(
                    right: 102,
                    top: 390,
                    child: AddTodoButton(number: '13', numberId: '2')),
                Positioned(
                    right: 175,
                    top: 443,
                    child: AddTodoButton(number: '14', numberId: '1')),
                Positioned(
                    right: 100,
                    top: 443,
                    child: AddTodoButton(number: '14', numberId: '2')),*/
                /* Positioned(
                  right: 5,
                  top: 90,
                  child: AddTodoButtonDouble(
                    numberId: '',
                    number: '8',
                  ))*/
              ]),
            ),
            const SizedBox(
              height: 20,
            ),
            /* MaterialButton(
                onPressed: (() => setState(() {})), child: Text('atualizar')),*/
            MaterialButton(
              minWidth: 100,
              padding: EdgeInsets.only(top: 8, bottom: 8),
              color: ui.Color.fromARGB(255, 202, 43, 32),
              onPressed: () async {
                await FirebaseFirestore.instance
                    .collection('user')
                    .doc(FirebaseAuth.instance.currentUser!.uid)
                    .update({
                  'DATA DIREITO': data.painDegreeRight,
                  'DATA ESQUERDO': data.painDegreeleft
                });
                /*   await FirebaseFirestore.instance
                    .collection('user')
                    .doc(FirebaseAuth.instance.currentUser!.uid)
                    .update({'ATUALIZOU_ANAMNSE_SEM2': true});*/
                Navigator.of(context).push(
                  MaterialPageRoute(
                      builder: (constect) => Semanas(),
                      settings: const RouteSettings()),
                );
              },
              child: Text(
                'Finalizar',
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30.0),
                side: BorderSide(color: Theme.of(context).primaryColor),
              ),
            )
          ],
        ),
      ),
    );
  }
}

List<Color> transformaEmCor(List<String> graudores) {
  List<Color> cores = [];
  for (int i = 0; i < graudores.length; i++) {
    switch (graudores[i]) {
      case '1':
        cores.add(Color.fromARGB(255, 31, 106, 34));
        break;
      case '2':
        cores.add(Color.fromARGB(255, 99, 179, 46));
        break;
      case '3':
        cores.add(Color.fromARGB(255, 224, 220, 80));
        break;
      case '4':
        cores.add(Color.fromARGB(255, 230, 101, 8));
        break;
      case '5':
        cores.add(Color.fromARGB(222, 238, 39, 29));
        break;

      default:
    }
  }
  return cores;
}
