import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:expansion_card/expansion_card.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:strong_core/MODELS/card_expansivel_semana.dart';
import 'package:strong_core/MODELS/cartao_bloqueado.dart';

import 'package:strong_core/MODELS/lista_semanas.dart';
import 'package:strong_core/SCREENS/auxiliar_corpo_humano.dart';

import '../MODELS/user_preferences.dart';
import '../main.dart';

class Semanas extends StatefulWidget {
  const Semanas({Key? key}) : super(key: key);

  @override
  State<Semanas> createState() => _SemanasState();
}

class _SemanasState extends State<Semanas> {
  @override
  void initState() {
    // TODO: implement initState

    super.initState();

    caregaMap();
    print('abacaxi');
    estadoAcesso = UserPreferences.getBool() as bool ?? false;
  }

  bool? estadoAcesso;
  bool? situacaoAnamnse;
  DateTime? horario;
  void caregaMap() async {
    final DocumentSnapshot dadosUsuario = await FirebaseFirestore.instance
        .collection('user')
        .doc(FirebaseAuth.instance.currentUser!.displayName!)
        .get();
    situacaoAnamnse = dadosUsuario.get('ATUALIZOU_ANAMNSE_SEM2');
    horario = (dadosUsuario.get('_HORARIO_LIBERA_PROXIMO_VIDEO_SEMANA_2')
            as Timestamp)
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

    Future<void> logOut() async {
      await FirebaseAuth.instance.signOut();

      onRefrash(null);
    }

    /*if ((horario == null || horario!.isAfter(DateTime.utc(1999, 1, 9))) &&
        situacaoAnamnse!) {
      return AuxCorpoHumano();
    } else*/

    return Scaffold(
      floatingActionButton: MaterialButton(
          onPressed: (() async {
            for (int i = 1; i < 7; i++) {
              await UserPreferences.setSteps(i, 0);
            }
            setState(() {});
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
                    user!.displayName!,
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                  SizedBox(
                    height: 6,
                  ),
                  user != null
                      ? CircleAvatar(
                          radius: 45,
                          backgroundImage: NetworkImage(user!.photoURL!),
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
                      builder: (constect) => MyHomePage(estadoAcesso!),
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
