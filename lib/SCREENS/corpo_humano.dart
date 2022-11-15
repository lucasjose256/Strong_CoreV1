import 'dart:typed_data';
import 'dart:ui' as ui;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:screenshot/screenshot.dart';
import 'package:strong_core/SCREENS/screen_semanas.dart';
import 'package:strong_core/style/add_pop_up_card.dart';
import 'package:intl/intl.dart';
import 'package:strong_core/style/sequencial_buttun.dart';

class CorpoHumano extends StatefulWidget {
  const CorpoHumano({Key? key}) : super(key: key);

  @override
  State<CorpoHumano> createState() => _CorpoHumanoState();
}

class _CorpoHumanoState extends State<CorpoHumano> {
  Uint8List? bytes;
  GlobalKey _globalKey = GlobalKey();
  bool loading = false;

  void convertImage() async {
    RenderRepaintBoundary? renderRepaintBoundary =
        _globalKey.currentContext!.findRenderObject() as RenderRepaintBoundary?;
    ui.Image boxImage = await renderRepaintBoundary!.toImage(pixelRatio: 1);
    ByteData? byteData =
        await boxImage.toByteData(format: ui.ImageByteFormat.png);
    Uint8List uint8list = byteData!.buffer.asUint8List();
    setState(() {
      loading = true;
    });
    final ref = FirebaseStorage.instance
        .ref()
        .child(FirebaseAuth.instance.currentUser!.displayName! + 'FIRST.png')
        .putData(uint8list);
  }

  @override
  Widget build(BuildContext context) {
    Stack dataCorpo;
    AddTodoButton pescoco1;
    AddTodoButton pescoco2;
    AddTodoButton ombroDir = new AddTodoButton(
      number: '6',
      numberId: 'DIR',
      nomeMembro: 'na região do ombro DIREITO',
    );
    AddTodoButton ombroEsq;

    AddTodoButton regiaoCervical1;
    ;
    AddTodoButton;
    AddTodoButton costasSuperior2;
    AddTodoButton costasMedia3;
    AddTodoButton costasInferior4;
    AddTodoButton bacia5;
    AddTodoButton;
    AddTodoButton;
    AddTodoButton;

    return WillPopScope(
      onWillPop: () async {
        Navigator.pop(context);
        return false;
      },
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

                Positioned(right: 230, top: 175, child: ombroDir),
                /*  AddTodoButton(
                  number: '6',
                  numberId: 'ESQ',
                  nomeMembro: 'na região do ombro ESQUERDO',
                ),*/
                Positioned(
                  right: 48,
                  top: 175,
                  child: AddTodoButtonSeq(
                    nomeMembro: 'na região do ombro ESQUERDO',
                    number: '6',
                    numberId: 'ESQ',
                    botaoEsqDir: ombroDir,
                  ),
                )

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
            MaterialButton(
              minWidth: 100,
              padding: EdgeInsets.only(top: 8, bottom: 8),
              color: ui.Color.fromARGB(255, 202, 43, 32),
              onPressed: () async {
                final controller = ScreenshotController();

                await FirebaseFirestore.instance
                    .collection('user')
                    .doc(FirebaseAuth.instance.currentUser!.displayName!)
                    .set({
                  /*
                  'Regiao_cervical_SEM_0': regiaoCervical1.graudaDor != null
                      ? regiaoCervical1.graudaDor
                      : '0',
                  'Costas_superior_SEM_0': costasSuperior2.graudaDor != null
                      ? costasSuperior2.graudaDor
                      : '0',
                  'Costas_média_SEM_0': costasMedia3.graudaDor != null
                      ? costasMedia3.graudaDor
                      : '0',
                  'Costas_inferior_SEM_0': costasInferior4.graudaDor != null
                      ? costasInferior4.graudaDor
                      : '0',
                  'Bacia_SEM_0': bacia5.graudaDor,
                  /*'SEM_1_pescoço1': pescoco1.graudaDor,
                  'SEM_1_pescoço2': pescoco2.graudaDor,
                  'SEM_1_ombro1': ombro1.graudaDor,*/
                  '_HORARIO_PRIMEIRO_ACESSO':
                      DateFormat.yMMMEd().format(DateTime.now())*/
                });

                Navigator.of(context).push(
                  MaterialPageRoute(
                      builder: (constect) => const Semanas(),
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
