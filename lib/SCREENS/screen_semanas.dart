import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:date_format/date_format.dart';
import 'package:expansion_card/expansion_card.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:strong_core/MODELS/card_expansivel_semana.dart';
import 'package:strong_core/MODELS/cartao_bloqueado.dart';

import 'package:strong_core/MODELS/lista_semanas.dart';
import 'package:strong_core/SCREENS/auxiliar_corpo_humano.dart';

import '../MODELS/user_preferences.dart';
import '../main.dart';

class Semanas extends StatefulWidget {
  DateTime? horario2;
  DateTime? horario4;
  DateTime? horario6;
  DateTime? horario8;

  bool? situacaoAnamnse2;
  bool? situacaoAnamnse4;
  bool? situacaoAnamnse6;
  bool? situacaoAnamnse8;
  Semanas({Key? key}) : super(key: key);

  @override
  State<Semanas> createState() => _SemanasState();
}

class _SemanasState extends State<Semanas> {
  bool? estadoAcesso;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    //caregaMap();
    estadoAcesso = UserPreferences.getBool() as bool ?? false;
  }

  Future<void> caregaMap() async {
    final DocumentSnapshot dadosUsuario = await FirebaseFirestore.instance
        .collection('user')
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .get();

    widget.situacaoAnamnse2 =
        await dadosUsuario.get('ATUALIZOU_ANAMNSE_SEM2') as bool;
    widget.situacaoAnamnse4 =
        await dadosUsuario.get('ATUALIZOU_ANAMNSE_SEM4') as bool;
    widget.situacaoAnamnse6 =
        dadosUsuario.get('ATUALIZOU_ANAMNSE_SEM6') as bool;
    widget.situacaoAnamnse8 =
        dadosUsuario.get('ATUALIZOU_ANAMNSE_SEM8') as bool;
    widget.horario2 = (dadosUsuario
            .get('_HORARIO_LIBERA_PROXIMO_VIDEO_SEMANA_2') as Timestamp)
        .toDate();
    widget.horario4 = (dadosUsuario
            .get('_HORARIO_LIBERA_PROXIMO_VIDEO_SEMANA_4') as Timestamp)
        .toDate();
    widget.horario6 = (dadosUsuario
            .get('_HORARIO_LIBERA_PROXIMO_VIDEO_SEMANA_2') as Timestamp)
        .toDate();
    widget.horario8 = (dadosUsuario
            .get('_HORARIO_LIBERA_PROXIMO_VIDEO_SEMANA_2') as Timestamp)
        .toDate();
  }

  @override
  Widget build(BuildContext context) {
    /* 
*/

    User? user = FirebaseAuth.instance.currentUser;
    // DateTime? horario = DateTime.utc(1500, 10, 2);
    Map mapSemanas;
    onRefrash(userCreed) {
      user = userCreed;
    }

    void servidor() async {
      await FirebaseFirestore.instance
          .collection('user')
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .update({'ATUALIZOU_ANAMNSE_SEM2': true});
    }

    Future<void> logOut() async {
      await FirebaseAuth.instance.signOut();

      onRefrash(null);
    }

    return Scaffold(
      body: FutureBuilder(
          future: caregaMap(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            } else {
              /* if ((widget.horario2!.isAfter(DateTime.utc(1999, 1, 9)) &&
                 ( widget.situacaoAnamnse2 == false)|| (   widget.horario4!.isAfter(DateTime.utc(1999, 1, 9)) && widget.situacaoAnamnse4 == false)||
                widget.horario6!.isAfter(DateTime.utc(1999, 1, 9)) && widget.situacaoAnamnse6 == false )|| widget.horario8!.isAfter(DateTime.utc(1999, 1, 9)) && widget.situacaoAnamnse8 == false
                 ) */
              if (widget.horario2!.isAfter(DateTime.utc(1999, 1, 9)) &&
                  (widget.situacaoAnamnse2 == false)) {
                servidor();

                return AuxCorpoHumano();
              } else {
                return Scaffold(
                  floatingActionButton: MaterialButton(
                      onPressed: (() async {
                        await FirebaseFirestore.instance
                            .collection('user')
                            .doc(FirebaseAuth.instance.currentUser!.uid)
                            .set({});
                        for (int i = 1; i < 7; i++) {
                          //    await UserPreferences.setSteps(i, 0);
                        }
                        await UserPreferences.setBool(false);
                        logOut();
                        //    setState(() {});
                      }),
                      child: Text('LIMPAR'),
                      color: Colors.grey),
                  drawer: Drawer(
                    // Add a ListView to the drawer. This ensures the user can scroll
                    // through the options in the drawer if there isn't enough vertical
                    // space to fit everything.
                    child: ListView(
                      // Important: Remove any padding from the ListView.
                      padding: EdgeInsets.zero,
                      children: [
                        DrawerHeader(
                          decoration: BoxDecoration(
                            color: Color.fromARGB(241, 186, 30, 22),
                          ),
                          child: Column(
                            children: [
                              Text(
                                'user!.email!',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 20),
                              ),
                              SizedBox(
                                height: 6,
                              ),
                              user?.photoURL != null
                                  ? CircleAvatar(
                                      radius: 45,
                                      backgroundImage:
                                          NetworkImage(user!.photoURL!),
                                    )
                                  : Container(
                                      color: Colors.pink,
                                    )
                            ],
                          ),
                        ),
                        ListTile(
                          leading: Icon(Icons.question_mark),
                          title: Text('Ajuda'),
                          onTap: () {
                            // Update the state of the app.
                            // ...
                          },
                        ),
                        ListTile(
                          leading: Icon(Icons.settings),
                          title: const Text('Configurações'),
                          onTap: () {
                            // Update the state of the app.
                            // ...
                          },
                        ),
                        ListTile(
                          leading: Icon(Icons.exit_to_app),
                          title: const Text('Sair'),
                          onTap: () {
                            logOut();
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                  builder: (constect) =>
                                      MyHomePage(estadoAcesso!),
                                  settings: const RouteSettings()),
                            );
                            // Update the state of the app.
                            // ...
                          },
                        ),
                      ],
                    ),
                  ),
                  appBar: AppBar(
                    //   automaticallyImplyLeading: false,

                    centerTitle: true,
                    // foregroundColor: Colors.orange,
                    backgroundColor: Colors.red[800],
                    title: const Text('Strong Core',
                        style: TextStyle(
                            fontSize: 21,
                            fontWeight: FontWeight.w600,
                            fontFamily: 'Comfortaa')),
                  ),
                  body: SingleChildScrollView(
                    child: Column(
                        children: LISTASEMANAS.map((e) {
                      // print(horario!.hour.toString());
                      //  print(horaDeInInicio['HORARIO_PRIMEIRO_ACESSO']);
                      // print(horario == null ? horario!.day.toString() : 'null');

                      return CartaoSemanas(
                        cor: e.backGroundColor,
                        title: e.titulo,
                        numeroSemana: e.numeroSem,
                      );
                    }).toList()),
                  ),
                );
              }
            }
          }),
    );
  }
}
