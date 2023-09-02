import 'dart:typed_data';
import 'dart:ui' as ui;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:date_format/date_format.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
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

  bool _isLoading = false;
  List<String> grauDores = [];
  Uint8List? bytes;
  GlobalKey _globalKey = GlobalKey();
  bool loading = false;
  Future<void> servidor(String num) async {
    await FirebaseFirestore.instance
        .collection('user')
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .update({'ATUALIZOU_ANAMNSE_SEM$num': true});
  }

  @override
  Widget build(BuildContext context) {
    AddTodoButton regiaoCervical1;
    AddTodoButton pescoco0;
    AddTodoButton costasSuperior2;
    AddTodoButton costasMedia3;
    AddTodoButton costasInferior4;
    AddTodoButton bacia5;
    BotaoDuplo? data;
    BotaoDuplo? ombro6;
    BotaoDuplo braco7;
    BotaoDuplo cotovelo8;
    BotaoDuplo antebraco9;
    BotaoDuplo punho10;
    BotaoDuplo mao11;
    BotaoDuplo perna12;
    BotaoDuplo joelho13;
    BotaoDuplo panturrilha14;
    BotaoDuplo tornozelo15;
    BotaoDuplo pe16;
    Stack dataCorpo;
    AddTodoButton pescoco1;
    AddTodoButton pescoco2;

    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Text('Strong Core'),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          //controller:  scrollController.jumpTo(0),
          child: Center(
            child: Container(
              //    alignment: AlignmentDirectional.topStart,
              width: 350,
              height: 730,
              child: Column(
                //        crossAxisAlignment: CrossAxisAlignment.center,
                //mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Stack(alignment: AlignmentDirectional.topCenter, children: [
                    Image.asset(
                      //      'Assets/images/corpo_humano_2.jpeg',
                      'Assets/images/corpo_humano_2.jpeg', height: 620,
                    ),
                    Positioned(
                        right: 151,
                        top: 55,
                        child: pescoco0 = AddTodoButton(
                          number: '0',
                          numberId: '',
                          nomeMembro: 'na região do PESCOÇO',
                        )),
                    Positioned(
                        right: 151,
                        top: 88,
                        child: regiaoCervical1 = AddTodoButton(
                          number: '1',
                          numberId: '',
                          nomeMembro: 'na região CERVICAL',
                        )),
                    Positioned(
                        right: 151,
                        top: 145,
                        child: costasSuperior2 = AddTodoButton(
                          number: '2',
                          numberId: '',
                          nomeMembro: 'na região DAS COSTAS SUPERIOR',
                        )),
                    Positioned(
                        right: 151,
                        top: 190,
                        child: costasMedia3 = AddTodoButton(
                          number: '3',
                          numberId: '',
                          nomeMembro: 'na região das costas média',
                        )),
                    Positioned(
                      top: 105,
                      child: ChangeNotifierProvider<Cor2>(
                        create: (context) => Cor2(),
                        child: ChangeNotifierProvider<Cor1>(
                            create: (context) => Cor1(),
                            child: ombro6 = BotaoDuplo(
                              palavraFeminino: false,
                              phraseCard: 'no OMBRO',
                              buttunDistance: 85,
                              numberButtun: '6',
                            )),
                      ),
                    ),
                    Positioned(
                        right: 151,
                        top: 225,
                        child: costasInferior4 = AddTodoButton(
                          number: '4',
                          numberId: '',
                          nomeMembro: 'na região LOMBAR',
                        )),
                    Positioned(
                        right: 151,
                        top: 275,
                        child: bacia5 = AddTodoButton(
                          number: '5',
                          numberId: '',
                          nomeMembro: 'na região DA BACIA',
                        )),
                    Positioned(
                      top: 150,
                      child: ChangeNotifierProvider<Cor2>(
                        create: (context) => Cor2(),
                        child: ChangeNotifierProvider<Cor1>(
                            create: (context) => Cor1(),
                            child: braco7 = BotaoDuplo(
                              palavraFeminino: false,
                              phraseCard: 'no BRAÇO',
                              buttunDistance: 110,
                              numberButtun: '7',
                            )),
                      ),
                    ),
                    Positioned(
                      top: 185,
                      child: ChangeNotifierProvider<Cor2>(
                        create: (context) => Cor2(),
                        child: ChangeNotifierProvider<Cor1>(
                            create: (context) => Cor1(),
                            child: cotovelo8 = BotaoDuplo(
                              palavraFeminino: false,
                              phraseCard: 'no COTOVELO',
                              buttunDistance: 122,
                              numberButtun: '8',
                            )),
                      ),
                    ),
                    Positioned(
                      top: 220,
                      child: ChangeNotifierProvider<Cor2>(
                        create: (context) => Cor2(),
                        child: ChangeNotifierProvider<Cor1>(
                            create: (context) => Cor1(),
                            child: antebraco9 = BotaoDuplo(
                              palavraFeminino: false,
                              phraseCard: 'no ANTEBRAÇO',
                              buttunDistance: 138,
                              numberButtun: '9',
                            )),
                      ),
                    ),
                    Positioned(
                      top: 255,
                      child: ChangeNotifierProvider<Cor2>(
                        create: (context) => Cor2(),
                        child: ChangeNotifierProvider<Cor1>(
                            create: (context) => Cor1(),
                            child: punho10 = BotaoDuplo(
                              palavraFeminino: false,
                              phraseCard: 'no PUNHO',
                              buttunDistance: 150,
                              numberButtun: '10',
                            )),
                      ),
                    ),
                    Positioned(
                      top: 290,
                      child: ChangeNotifierProvider<Cor2>(
                        create: (context) => Cor2(),
                        child: ChangeNotifierProvider<Cor1>(
                            create: (context) => Cor1(),
                            child: mao11 = BotaoDuplo(
                              palavraFeminino: true,
                              phraseCard: 'na MÃO',
                              buttunDistance: 170,
                              numberButtun: '11',
                            )),
                      ),
                    ),
                    Positioned(
                      top: 354,
                      child: ChangeNotifierProvider<Cor2>(
                        create: (context) => Cor2(),
                        child: ChangeNotifierProvider<Cor1>(
                            create: (context) => Cor1(),
                            child: perna12 = BotaoDuplo(
                              palavraFeminino: true,
                              phraseCard: 'na PERNA',
                              buttunDistance: 14,
                              numberButtun: '12',
                            )),
                      ),
                    ),
                    Positioned(
                      top: 428,
                      child: ChangeNotifierProvider<Cor2>(
                        create: (context) => Cor2(),
                        child: ChangeNotifierProvider<Cor1>(
                            create: (context) => Cor1(),
                            child: joelho13 = BotaoDuplo(
                              palavraFeminino: false,
                              phraseCard: 'no JOELHO',
                              buttunDistance: 10,
                              numberButtun: '13',
                            )),
                      ),
                    ),
                    Positioned(
                      top: 485,
                      child: ChangeNotifierProvider<Cor2>(
                        create: (context) => Cor2(),
                        child: ChangeNotifierProvider<Cor1>(
                            create: (context) => Cor1(),
                            child: panturrilha14 = BotaoDuplo(
                              palavraFeminino: true,
                              phraseCard: 'na PANTURRILHA',
                              buttunDistance: 8,
                              numberButtun: '14',
                            )),
                      ),
                    ),
                    Positioned(
                      top: 550,
                      child: ChangeNotifierProvider<Cor2>(
                        create: (context) => Cor2(),
                        child: ChangeNotifierProvider<Cor1>(
                            create: (context) => Cor1(),
                            child: tornozelo15 = BotaoDuplo(
                              palavraFeminino: false,
                              phraseCard: 'no TORNOZELO',
                              buttunDistance: 0,
                              numberButtun: '15',
                            )),
                      ),
                    ),
                    Positioned(
                      top: 579,
                      child: ChangeNotifierProvider<Cor2>(
                        create: (context) => Cor2(),
                        child: ChangeNotifierProvider<Cor1>(
                            create: (context) => Cor1(),
                            child: pe16 = BotaoDuplo(
                              palavraFeminino: false,
                              phraseCard: 'no PÉ',
                              buttunDistance: 0,
                              numberButtun: '16',
                            )),
                      ),
                    ),
                  ]),
                  const SizedBox(
                    height: 15,
                  ),
                  /* MaterialButton(
                      onPressed: (() => setState(() {})), child: Text('atualizar')),*/
                  !_isLoading
                      ? MaterialButton(
                          minWidth: 100,
                          padding: EdgeInsets.only(top: 8, bottom: 8),
                          color: ui.Color.fromARGB(255, 202, 43, 32),
                          onPressed: () async {
                            if (pescoco0.graudaDor == null ||
                                regiaoCervical1.graudaDor == null ||
                                costasSuperior2.graudaDor == null ||
                                costasMedia3.graudaDor == null ||
                                costasInferior4.graudaDor == null ||
                                bacia5.graudaDor == null ||
                                ombro6!.painDegreeRight == '' ||
                                ombro6.painDegreeleft == '' ||
                                braco7.painDegreeRight == '' ||
                                braco7.painDegreeleft == '' ||
                                cotovelo8.painDegreeRight == '' ||
                                cotovelo8.painDegreeleft == '' ||
                                antebraco9.painDegreeRight == '' ||
                                antebraco9.painDegreeleft == '' ||
                                punho10.painDegreeRight == '' ||
                                punho10.painDegreeleft == '' ||
                                mao11.painDegreeRight == '' ||
                                mao11.painDegreeleft == '' ||
                                perna12.painDegreeRight == '' ||
                                perna12.painDegreeleft == '' ||
                                joelho13.painDegreeRight == '' ||
                                joelho13.painDegreeleft == '' ||
                                panturrilha14.painDegreeRight == '' ||
                                panturrilha14.painDegreeleft == '' ||
                                tornozelo15.painDegreeRight == '' ||
                                tornozelo15.painDegreeleft == '')

                            /* grauDores = [
                        //     pescoco0!.graudaDor!,
                        /*   pescoco0.graudaDor!,
                          regiaoCervical1.graudaDor!,
                          costasSuperior2.graudaDor!,
                          costasMedia3.graudaDor!,
                          costasInferior4.graudaDor!,
                          bacia5.graudaDor!,*/
                        ombro6!.painDegreeRight!,
                        ombro6.painDegreeleft,
                      ];*/
                            {
                              showDialog(
                                context: context,
                                builder: (context) => AlertDialog(
                                  actions: [
                                    TextButton(
                                        onPressed: () =>
                                            Navigator.of(context).pop(),
                                        child: Text('Ok'))
                                  ],
                                  title: const Text('Anamnese'),
                                  content: const Text(
                                      'Selecione TODOS os campos do Corpo Humano'),
                                ),
                              );
                            } else {
                              try {
                                setState(() {
                                  _isLoading = true;
                                });
                                await UserPreferences.setBool(true);

                                var firebase = await FirebaseFirestore.instance
                                    .collection('user')
                                    .doc(
                                        FirebaseAuth.instance.currentUser!.uid);

                                await firebase.update({
                                  '00Pescoço_SEM_${widget.numSem}':
                                      pescoco0.graudaDor,
                                  '01Regiao_cervical_SEM_${widget.numSem}':
                                      regiaoCervical1.graudaDor,
                                  '02Costas_superior_SEM_${widget.numSem}':
                                      costasSuperior2.graudaDor,
                                  '03Costas_média_SEM_${widget.numSem}':
                                      costasMedia3.graudaDor,
                                  '04Costas_inferior_SEM_${widget.numSem}':
                                      costasInferior4.graudaDor,
                                  '05Bacia_SEM_${widget.numSem}':
                                      bacia5.graudaDor,
                                  '06Ombro_DIREITO_SEM_${widget.numSem}':
                                      ombro6!.painDegreeRight,
                                  '06Ombro_ESQUERDO_SEM_${widget.numSem}':
                                      ombro6!.painDegreeleft,
                                  '07Braço_DIREITO_SEM_${widget.numSem}':
                                      braco7.painDegreeRight,
                                  '07Braço_ESQUERDO_SEM_${widget.numSem}':
                                      braco7.painDegreeleft,
                                  '08Cotovelo_DIREITO_SEM_${widget.numSem}':
                                      cotovelo8.painDegreeRight,
                                  '08Cotovelo_ESQUERDO_SEM_${widget.numSem}':
                                      cotovelo8.painDegreeleft,
                                  '09Antebraço_DIREITO_SEM_${widget.numSem}':
                                      antebraco9.painDegreeRight,
                                  '09Antebraço_ESQUERDO_SEM_${widget.numSem}':
                                      antebraco9.painDegreeleft,
                                  '10Punho_DIREITO_SEM_${widget.numSem}':
                                      punho10.painDegreeRight,
                                  '10Punho_ESQUERDO_SEM_${widget.numSem}':
                                      punho10.painDegreeleft,
                                  '11Mao_DIREITA_SEM_${widget.numSem}':
                                      mao11.painDegreeRight,
                                  '11Mao_ESQUERDA_SEM_${widget.numSem}':
                                      mao11.painDegreeleft,
                                  '12Perna_DIREITA_SEM_${widget.numSem}':
                                      perna12.painDegreeRight,
                                  '12Perna_ESQUERDA_SEM_${widget.numSem}':
                                      perna12.painDegreeleft,
                                  '13Joelho_DIREITO_SEM_${widget.numSem}':
                                      joelho13.painDegreeRight,
                                  '13Joelho_ESQUERDO_SEM_${widget.numSem}':
                                      joelho13.painDegreeleft,
                                  '14Panturrilha_DIREITA_SEM_${widget.numSem}':
                                      panturrilha14.painDegreeRight,
                                  '14Panturrilha_ESQUERDA_SEM_${widget.numSem}':
                                      panturrilha14.painDegreeleft,
                                  '15Tornozelo_DIREITO_SEM_${widget.numSem}':
                                      tornozelo15.painDegreeleft,
                                  '15Tornozelo_ESQUERDO_SEM_${widget.numSem}':
                                      tornozelo15.painDegreeleft,
                                  '16Pe_DIREITO_SEM_${widget.numSem}':
                                      pe16.painDegreeRight,
                                  '16Pe_ESQUERDO_SEM_${widget.numSem}':
                                      pe16.painDegreeleft,
                                });
                                servidor(widget.numSem);
                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                      builder: (constect) => Semanas(),
                                      settings: const RouteSettings()),
                                );
                              } catch (error) {
                                setState(() {
                                  _isLoading = false;
                                });
                                ScaffoldMessenger.of(context).clearSnackBars();
                                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                    content: Text(
                                        'Algo deu errado ao ATUALIZAR OS DADOS DO CORPO HUMANO!')));
                              }
                            }
                          },
                          child: Text(
                            'Finalizar',
                            style: TextStyle(color: Colors.white, fontSize: 20),
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30.0),
                            side: BorderSide(
                                color: Theme.of(context).primaryColor),
                          ))
                      : CircularProgressIndicator(),
                ],
              ),
            ),
          ),
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
