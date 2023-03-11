import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:provider/provider.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';
import 'package:strong_core/MODELS/VideoScreen.dart';
import 'package:strong_core/MODELS/cartao_bloqueado.dart';
import 'package:strong_core/MODELS/user_preferences.dart';
import 'package:strong_core/MODELS/_____video_model.dart';
import 'package:intl/intl.dart';
import 'package:strong_core/MODELS/video_maneger.dart';
import 'package:strong_core/SCREENS/corpo_humano.dart';

import '../provider/check.dart';

class CartaoSemanas extends StatefulWidget {
  @override
  final Color cor;
  final String title;
  final int numeroSemana;
  final List<VideoScreen> vd;
  CartaoSemanas(
      {Key? key,
      required this.vd,
      required this.cor,
      required this.title,
      required this.numeroSemana})
      : super(key: key);
  _CartaoSemanasState createState() => _CartaoSemanasState(vd);
}

class _CartaoSemanasState extends State<CartaoSemanas> {
  DateTime? horario;
  final List<VideoScreen> videos;
  _CartaoSemanasState(this.videos);
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    caregaMap();
    stepBarControll = UserPreferences.getSteps(widget.numeroSemana) as int ?? 0;
  }

  @override
  void setState(VoidCallback fn) {
    // TODO: implement setState
    super.setState(fn);
  }

  void caregaMap() async {
    final DocumentSnapshot dadosUsuario = await FirebaseFirestore.instance
        .collection('user')
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .get();
    setState(() {
      horario = (dadosUsuario.get(
                  '_HORARIO_LIBERA_PROXIMO_VIDEO_SEMANA_${widget.numeroSemana}')
              as Timestamp)
          .toDate();
    });
    print('chocolater');
    print(horario!.year);
  }

  String TapToExpandIt = 'SEMANA 4';
  String Sentence = 'EXERCICIOS DA SEMANA:\n'
      '3X PRANCHA(30s)\n'
      '3X ABDOMINAL(30s)\n'
      '3X FLEXÃO(30s)';
  bool isExpanded = true;
  bool isExpanded2 = true;
//flags para checkbox
  bool isChecked = false;
  bool isChecked1 = false;
  bool isChecked2 = false;
  bool isChecked3 = false;
  bool isChecked4 = false;
  bool isChecked5 = false;
  bool isChecked6 = false;
  DateTime? newdate;
  DateTime? date;
  int stepBarControll = 0;
  String tempBotao = 'I N I C I A R ';
  @override
  Widget build(BuildContext context) {
    int dia = UserPreferences.getSteps(widget.numeroSemana) as int ?? 0;
    List<String> nomeVideos = [
      'https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4',
      'https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4',
    ];
    int i = 0;

    if (isExpanded) {
      setState(() {});
    }

    DateTime? horarioAgora = DateTime.now();

    /*var letsgo = FirebaseFirestore.instance
        .collection('user')
        .doc(FirebaseAuth.instance.currentUser!.displayName!)
        .get()
        .then((value) {
      horario = value['_HORARIO_LIBERA_PROXIMO_VIDEO_SEMANA_1'];
      dia = value['DIA_SEMANA 1'];
    });
*/
    if (horario == null ||
        horario!.isBefore(
          DateTime.utc(1999, 1, 9),
        )) {
      setState(() {});
      return CartaoBloqueado(
        cor: widget.cor,
        number: widget.numeroSemana,
        title: widget.title,
      );
    } else {
      setState(() {});

      return Container(
        child: InkWell(
          highlightColor: Colors.transparent,
          splashColor: Colors.transparent,
          onTap: () {
            setState(() {
              isExpanded = !isExpanded;
            });
          },
          child: AnimatedContainer(
            margin: EdgeInsets.symmetric(
              horizontal: 10, // isExpanded ? 25 : 10,
              vertical: 20,
            ),
            padding: EdgeInsets.all(20),
            height: isExpanded ? 100 : 500,
            curve: Curves.fastLinearToSlowEaseIn,
            duration: Duration(milliseconds: 1200),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                transform: GradientRotation(3.1475 / 4),
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  widget.cor.withOpacity(0.75),
                  widget.cor,
                ],
              ),
              /*  boxShadow: [
              BoxShadow(
                color: Color.fromARGB(255, 91, 55, 137).withOpacity(0.5),
                blurRadius: 20,
                offset: Offset(5, 10),
              ),
            ],*/
              color: widget.cor,
              borderRadius: BorderRadius.all(
                Radius.circular(isExpanded ? 20 : 20),
              ),
            ),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Text(
                          widget.title,
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 22,
                              fontWeight: FontWeight.w400,
                              fontFamily: 'Comfortaa'),
                        ),
                        SizedBox(
                          width: 15,
                        ),

                        // Text(DateFormat.Hms().format(DateTime.now())),
                        /*   isExpanded
                          ? Icon(Icons.lock_sharp, size: 50)
                          : Icon(Icons.lock_sharp, size: 20),*/
                      ],
                    ),
                    Icon(
                      //desaparecer a flecha se a semana estiver travada
                      isExpanded
                          ? Icons.keyboard_arrow_down
                          : Icons.keyboard_arrow_up,
                      color: Colors.white,
                      size: 30,
                    ),
                  ],
                ),
                isExpanded ? SizedBox() : SizedBox(height: 20),
                AnimatedCrossFade(
                  firstCurve: Curves.fastLinearToSlowEaseIn,
                  firstChild: SingleChildScrollView(
                    child: Text(
                      '',
                      style: TextStyle(
                        fontSize: 0,
                      ),
                    ),
                  ),
                  secondChild: Column(
                    children: [
                      Container(
                        padding: EdgeInsets.all(5),
                        decoration: const BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                  color: Color.fromARGB(255, 100, 100, 100),
                                  spreadRadius: 1,
                                  blurRadius: 15,
                                  offset: const Offset(0, 10))
                            ],
                            color: Colors
                                .black, // Color.fromARGB(255, 46, 36, 36),
                            borderRadius: BorderRadius.all(
                              Radius.circular(2),
                            )),
                        // color: Colors.black,
                        child: const Text(
                          ' EXERCÍCIOS DA SEMANA ',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),

                      //   color: Color.fromARGB(255, 194, 183, 183),

                      Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: videos!.map((e) {
                            // print(horario!.hour.toString());
                            //  print(horaDeInInicio['HORARIO_PRIMEIRO_ACESSO']);
                            // print(horario == null ? horario!.day.toString() : 'null');
                            return Container(
                              margin: EdgeInsets.all(5),
                              decoration: const BoxDecoration(
                                  boxShadow: [
                                    BoxShadow(
                                        color:
                                            Color.fromARGB(255, 220, 213, 213),
                                        spreadRadius: 2,
                                        blurRadius: 3,
                                        blurStyle: BlurStyle.solid,
                                        offset: Offset(1, 3))
                                  ],
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(10),
                                  )),
                              child: Align(
                                alignment: Alignment.centerLeft,
                                child: Column(
                                  children: [
                                    Text(
                                      ' ' +
                                          e.loop.toString() +
                                          'X  ' +
                                          '${e.nomeSemLado ?? e.nomeExercicio} ' +
                                          ' ' +
                                          '(${e.tempo.toString()}s)',
                                      style: const TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          }).toList()),

                      SizedBox(
                        height: 10,
                      ),
                      Align(
                        alignment: Alignment.center,
                        child: Text(
                          ' PROGRESSO ',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                          ),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        //mainAxisSize: MainAxisSize.values[2],
                        //mainAxisSize: MainAxisSize.min,
                        children: [],
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ConstrainedBox(
                            constraints: BoxConstraints(maxWidth: 300),
                            child: StepProgressIndicator(
                              //stepCrossAxisAlignment: CrossAxisAlignment.start,
                              //   crossAxisAlignment: CrossAxisAlignment.start,
                              totalSteps: 3,
                              currentStep: stepBarControll,
                              size: 36,
                              selectedColor: Colors.black,
                              unselectedColor:
                                  Color.fromARGB(255, 194, 183, 183),
                              customStep: (indexs, color2, _) =>
                                  color2 == Colors.black
                                      ? Container(
                                          color: color2,
                                          child: Icon(
                                            Icons.check,
                                            color: Colors.white,
                                          ),
                                        )
                                      : Container(
                                          width: 10,
                                          color: color2,
                                          child: Icon(
                                            Icons.remove,
                                          ),
                                        ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      MaterialButton(
                        minWidth: 200,
                        height: 50,
                        child: Text(
                          tempBotao,
                          style: TextStyle(color: Colors.white),
                        ),
                        color: Color.fromRGBO(0, 0, 0, 0.867),
                        onPressed: () async {
                          await FirebaseFirestore.instance
                              .collection('user')
                              .doc(FirebaseAuth.instance.currentUser!.uid)
                              .get()
                              .then((value) {
                            horario =
                                (value['_HORARIO_LIBERA_PROXIMO_VIDEO_SEMANA_${widget.numeroSemana}']
                                        as Timestamp)
                                    .toDate();
                          });

                          /*     if (stepBarControll == 3) {
                            //lembrar de verificar para semana 9
                            await FirebaseFirestore.instance
                                .collection('user')
                                .doc(FirebaseAuth.instance.currentUser!.uid!)
                                .update({
                              '_HORARIO_LIBERA_PROXIMO_VIDEO_SEMANA_${widget.numeroSemana + 1}':
                                  horario =
                                      DateTime.now().add(Duration(days: 2)),
                            });
                          }*/
                          //AINDA PRECISA VER SE É O PRIMERO ACESSO DA PESSOA
                          if (horario == null ||
                              DateTime.now().isAfter(horario!)) {
                            /*  for (var element in videos!) {
                              await Navigator.push(context,
                                  MaterialPageRoute(builder: (context) {
                                return element;
                              }));
                            }*/
                            await Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                              return VideoManeger(
                                videos: videos!,
                                numSemana: widget.numeroSemana,
                              );
                            }));
                            setState(() {
                              stepBarControll++;
                            });
                            await UserPreferences.setSteps(
                                widget.numeroSemana, stepBarControll);
                            if (stepBarControll == 3) {
                              //lembrar de verificar para semana 9
                              await FirebaseFirestore.instance
                                  .collection('user')
                                  .doc(FirebaseAuth.instance.currentUser!.uid!)
                                  .update({
                                '_HORARIO_LIBERA_PROXIMO_VIDEO_SEMANA_${widget.numeroSemana + 1}':
                                    horario = DateTime.now().add(Duration(
                                  seconds: 4, /*days: 2*/
                                )),
                              });
                            } else {
                              await FirebaseFirestore.instance
                                  .collection('user')
                                  .doc(FirebaseAuth.instance.currentUser!.uid!)
                                  .update({
                                //verificar se o update apaga os dados dos formularios
                                '_HORARIO_LIBERA_PROXIMO_VIDEO_SEMANA_${widget.numeroSemana}':
                                    horario = DateTime.now().add(const Duration(
                                  seconds: 4, /*days: 2*/
                                )),
                              });
                            }
                            setState(() {
                              if (horario != null)
                                tempBotao = horario!
                                        .difference(DateTime.now())
                                        .inHours
                                        .toString() +
                                    ' HORAS';
                            });
                            print(tempBotao);
                          }

                          setState(() {
                            if (horario != null) {
                              tempBotao = horario!
                                      .difference(DateTime.now())
                                      .inHours
                                      .toString() +
                                  ' HORAS';
                            }
                          });
                        },
                      ),
                    ],
                  ),
                  crossFadeState: isExpanded
                      ? CrossFadeState.showFirst
                      : CrossFadeState.showSecond,
                  duration: Duration(milliseconds: 1200),
                  reverseDuration: Duration.zero,
                  sizeCurve: Curves.fastLinearToSlowEaseIn,
                ),
              ],
            ),
          ),
        ),
      );

      /*  InkWell(
            highlightColor: Colors.transparent,
            splashColor: Colors.transparent,
            onTap: () {
              setState(() {
                isExpanded2 = !isExpanded2;
              });
            },
            child: AnimatedContainer(
              margin: EdgeInsets.symmetric(
                horizontal: isExpanded2 ? 25 : 0,
                vertical: 20,
              ),
              padding: EdgeInsets.all(20),
              height: isExpanded2 ? 70 : 330,
              curve: Curves.fastLinearToSlowEaseIn,
              duration: Duration(milliseconds: 1200),
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Color(0xffFF5050).withOpacity(0.5),
                    blurRadius: 20,
                    offset: Offset(5, 10),
                  ),
                ],
                color: Color(0xffFF5050),
                borderRadius: BorderRadius.all(
                  Radius.circular(isExpanded2 ? 20 : 0),
                ),
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        TapToExpandIt,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 22,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      Icon(
                        isExpanded2
                            ? Icons.keyboard_arrow_down
                            : Icons.keyboard_arrow_up,
                        color: Colors.white,
                        size: 27,
                      ),
                    ],
                  ),
                  isExpanded2 ? SizedBox() : SizedBox(height: 20),
                  AnimatedCrossFade(
                    firstChild: Text(
                      '',
                      style: TextStyle(
                        fontSize: 0,
                      ),
                    ),
                    secondChild: Text(
                      Sentence,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 15.7,
                      ),
                    ),
                    crossFadeState: isExpanded2
                        ? CrossFadeState.showFirst
                        : CrossFadeState.showSecond,
                    duration: Duration(milliseconds: 1200),
                    reverseDuration: Duration.zero,
                    sizeCurve: Curves.fastLinearToSlowEaseIn,
                  ),
                ],
              ),
            ),
          ),*/
    }
  }
}
