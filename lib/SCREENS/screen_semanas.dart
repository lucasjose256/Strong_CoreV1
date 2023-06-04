import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:date_format/date_format.dart';
import 'package:expansion_card/expansion_card.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:strong_core/MODELS/card_expansivel_semana.dart';
import 'package:strong_core/MODELS/cartao_bloqueado.dart';

import 'package:strong_core/MODELS/lista_semanas.dart';
import 'package:strong_core/RELATORIO/cria_relatorio_exercicio.dart';
import 'package:strong_core/SCREENS/auxiliar_corpo_humano.dart';
import 'package:strong_core/RELATORIO/relatorio.dart';

import '../MODELS/user_preferences.dart';
import '../main.dart';

class Semanas extends StatefulWidget {
  late DateTime horario4;
  late DateTime horario6;
  late DateTime horario8;

  bool? situacaoAnamnse2;
  bool? situacaoAnamnse4;
  bool? situacaoAnamnse6;
  bool? situacaoAnamnse8;
  Semanas({Key? key}) : super(key: key);

  @override
  State<Semanas> createState() => _SemanasState();
}

class _SemanasState extends State<Semanas> {
  late var tempoProximaSemana;
  bool? estadoAcesso;
  late StreamSubscription subscription;
  var isDeviceConnected = false;
  var isAlertSet = false;
  @override
  void initState() {
    // TODO: implement initState

    super.initState();

    //caregaMap();
    estadoAcesso = UserPreferences.getBool() as bool ?? false;
  }

  void dispose() {
    subscription.cancel();
    super.dispose();
  }

  getConnectivity() =>
      subscription = Connectivity().onConnectivityChanged.listen((event) async {
        isDeviceConnected = await InternetConnectionChecker().hasConnection;
        if (!isDeviceConnected && isAlertSet == false) {
          showDialgBox();
          setState(() {
            isAlertSet = true;
          });
        }
      });

  Future<void> caregaMap() async {
    final DocumentSnapshot dadosUsuario = await FirebaseFirestore.instance
        .collection('demo')
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .get();

    widget.situacaoAnamnse4 =
        await dadosUsuario.get('ATUALIZOU_ANAMNSE_SEM4') as bool;
    widget.situacaoAnamnse6 =
        await dadosUsuario.get('ATUALIZOU_ANAMNSE_SEM6') as bool;
    widget.situacaoAnamnse8 =
        await dadosUsuario.get('ATUALIZOU_ANAMNSE_SEM8') as bool;

    widget.horario4 = await (dadosUsuario
            .get('_HORARIO_LIBERA_PROXIMO_VIDEO_SEMANA_4') as Timestamp)
        .toDate();

    widget.horario6 = (await dadosUsuario
            .get('_HORARIO_LIBERA_PROXIMO_VIDEO_SEMANA_6') as Timestamp)
        .toDate();

    widget.horario8 = (await dadosUsuario
            .get('_HORARIO_LIBERA_PROXIMO_VIDEO_SEMANA_8') as Timestamp)
        .toDate();

    if (widget.situacaoAnamnse4 == false) {
      tempoProximaSemana = widget.horario4.difference(DateTime.now()).inDays;
    } else if (widget.situacaoAnamnse6 == false) {
      tempoProximaSemana = widget.horario6.difference(DateTime.now()).inDays;
    } else {
      tempoProximaSemana = widget.horario8.difference(DateTime.now()).inDays;
    }
  }

  @override
  Widget build(BuildContext context) {
    /* 
*/
    //getConnectivity();
    User? user = FirebaseAuth.instance.currentUser;
    // DateTime? horario = DateTime.utc(1500, 10, 2);
    Map mapSemanas;
    onRefrash(userCreed) {
      user = userCreed;
    }

    Future<void> servidor(int num) async {
      await FirebaseFirestore.instance
          .collection('demo')
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .update({'ATUALIZOU_ANAMNSE_SEM$num': true});
    }

    Future<void> logOut() async {
      await FirebaseAuth.instance.signOut();

      onRefrash(null);
    }

    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        body: FutureBuilder(
            future: caregaMap(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(child: CircularProgressIndicator());
              } else {
                if (widget.horario4!.isBefore(DateTime.now()) &&
                    (widget.situacaoAnamnse4 == false)) {
                  print('semana4');

                  //precisa adiconar um campo indicando qual semana o AuxCorpo está se referindo
                  return const AuxCorpoHumano(numSem: '4');
                } else if (widget.horario6!.isBefore(DateTime.now()) &&
                    (widget.situacaoAnamnse6 == false)) {
                  //precisa adiconar um campo indicando qual semana o AuxCorpo está se referindo
                  return const AuxCorpoHumano(numSem: '6');
                } else if (widget.horario8!.isBefore(DateTime.now()) &&
                    (widget.situacaoAnamnse8 == false)) {
                  //precisa adiconar um campo indicando qual semana o AuxCorpo está se referindo
                  return const AuxCorpoHumano(numSem: '8');
                } else {
                  return AppDemo(
                    tempo: tempoProximaSemana,
                    isEnd: widget.situacaoAnamnse8!,
                  );
                }
              }
            }),
      ),
    );
  }

  void showDialgBox() => showDialog(
        context: context,
        builder: (context) => AlertDialog(
          actions: [
            TextButton(
                onPressed: () async {
                  Navigator.of(context).pop();
                  setState(() {
                    isAlertSet = false;
                  });
                  isDeviceConnected =
                      await InternetConnectionChecker().hasConnection;
                  if (!isDeviceConnected) {
                    showDialgBox();
                    setState(() {
                      isAlertSet = true;
                    });
                  }
                },
                child: Text('Ok'))
          ],
          title: const Text('Sem Conexão'),
          content: const Text('Por favor confira a sua conexão com a internet'),
        ),
      );
}

class AppDemo extends StatelessWidget {
  int tempo;
  bool isEnd;
  AppDemo({Key? key, required this.tempo, required this.isEnd})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Container(
            height: 250,
            color: Color.fromARGB(255, 255, 96, 78),
            width: 300,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Icon(
                    Icons.timer,
                    size: 70,
                  ),
                ),
                Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: isEnd
                        ? Text('Terminou!', style: TextStyle(fontSize: 25))
                        : Text(
                            'Em ${tempo} dias você poderá responder novamente a anamnese',
                            style: TextStyle(fontSize: 25))),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class buildSemanas extends StatefulWidget {
  const buildSemanas({
    Key? key,
    required this.user,
    required this.estadoAcesso,
  }) : super(key: key);

  final User? user;
  final bool? estadoAcesso;

  @override
  State<buildSemanas> createState() => _buildSemanasState();
}

var singleChildScrollView = SingleChildScrollView(
  child: Column(
      children: LISTASEMANAS.map((e) {
    // print(horario!.hour.toString());
    //  print(horaDeInInicio['HORARIO_PRIMEIRO_ACESSO']);
    // print(horario == null ? horario!.day.toString() : 'null');

    return CartaoSemanas(
      vd: e.Conteudo,
      cor: e.backGroundColor,
      title: e.titulo,
      numeroSemana: e.numeroSem,
      height: e.height,
    );
  }).toList()),
);
int currentPageIndex = 0;
List<Widget> body = [singleChildScrollView, Relatorio()];

class _buildSemanasState extends State<buildSemanas> {
  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => Semanas(),
          )),
      child: Scaffold(
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: currentPageIndex,
          onTap: (value) {
            setState(() {
              currentPageIndex = value;
            });
          },
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.paste), label: 'Relatório'),
          ],
        ),
        appBar: AppBar(
          automaticallyImplyLeading: false,
          centerTitle: true,
          backgroundColor: Colors.red[800],
          title: const Text('Strong Core',
              style: TextStyle(
                  fontSize: 21,
                  fontWeight: FontWeight.w600,
                  fontFamily: 'Comfortaa')),
        ),
        body: body[currentPageIndex],
      ),
    );
  }
}
