// ignore_for_file: prefer_const_constructors_in_immutables

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:strong_core/SCREENS/corpo_humano.dart';
import 'package:strong_core/SCREENS/screen_semanas.dart';
import 'package:strong_core/main.dart';

//Configurar um tamanho dinâmico para o dropDownButton
class Question extends StatefulWidget {
  // final Function(User) onSingOut;
  Question();

  @override
  State<Question> createState() => _QuestionState();
}

class _QuestionState extends State<Question> {
  var user = FirebaseAuth.instance.currentUser;
  CollectionReference questionData =
      FirebaseFirestore.instance.collection('user');

  onRefrash(userCreed) {
    setState(() {
      user = userCreed;
    });
  }

  late TextSelectionControls tex;
  final items1 = ['Bombeiro Militar', 'Policial Militar'];
  String? answer1;
  final items2 = [
    'Soldado 2ª classe',
    'Cadete',
    'Soldado 1ª classe',
    'Aluno oficial',
    'Cabo',
    '3º Sargento',
    '2º Sargento',
    '1 º Sargento',
  ];
  String? answer2;

  final items3 = ['Cargo  administrativo', 'Cargo operacional'];
  String? answer3;

  final items4 = [
    'AC',
    'AL',
    'AP',
    'AM',
    'BA',
    'CE',
    'DF',
    'ES',
    'GO',
    'MA',
    'MS',
    'MT',
    'MG',
    'PA',
    'PB',
    'PR',
    'PE',
    'PI',
    'RJ',
    'RN',
    'RS',
    'RO',
    'RR',
    'SC',
    'SP',
    'SE',
    'TO'
  ];
  String? answer4;
  final items5 = ['Curitiba', 'Pinhais', 'São José dos Pinhais'];
  String? answer5;

  final items6 = ['Curitiba', 'Pinhais', 'São José dos Pinhais'];
  String? answer6;
  final items7 = [
    'Nenhum dia',
    'Um dia',
    'Dois sias',
    'Três dias',
    'Quatro dias',
    'Cinco Dias',
    'Seis Dias',
    'Sete dias ou mais'
  ];
  String? answer7;

  Future<void> logOut() async {
    await FirebaseAuth.instance.signOut();
    onRefrash(null);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // foregroundColor: Colors.orange,
        centerTitle: true,
        backgroundColor: Colors.red[800],
        title: Center(
          child: Text('Strong Core',
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  fontFamily: 'Comfortaa')),
        ),
      ),
      floatingActionButton: MaterialButton(
        color: Color.fromARGB(255, 237, 100, 90),
        child: Text('Sair'),
        onPressed: () {
          logOut();
          Navigator.of(context).push(
            MaterialPageRoute(
                builder: (constect) => MyHomePage(), settings: RouteSettings()),
          );
        },
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(100)),
      ),
      //backgroundColor: Colors.grey,
      /*  appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.red[800],
        title: const Center(
          child: Text('Strong Core',
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  fontFamily: 'Comfortaa')),
        ),*/
      body: ListView(
        addRepaintBoundaries: false,
        shrinkWrap: false,
        addAutomaticKeepAlives: false,
        addSemanticIndexes: false,
        // primary: false,//MOSTRA UMA COR AO TENTAR MOVER A LIST VIEW
        children: [
          const SizedBox(
            height: 50,
          ),
          ////////////////////////////////////////////1
          const Text(
            'Você é?',
            style: TextStyle(
              fontFamily: 'Comfortaa',
              fontSize: 19,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(
            height: 8,
          ),
          Center(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
              width: 300,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  border: Border.all(color: Colors.black, width: 1)),
              child: DropdownButtonHideUnderline(
                child: DropdownButton<String>(
                  focusColor: Colors.red,
                  isExpanded: true,
                  dropdownColor: Colors.red[200],
                  value: answer1,
                  items: items1.map(buildMenuItem).toList(),
                  onChanged: (value) => setState(() {
                    this.answer1 = value;
                  }),
                ),
              ),
            ),
          ),
          //////////////////////////////////////////////////////////2
          const SizedBox(
            height: 25,
          ),
          const Text(
            'Posto ou Graduação',
            style: TextStyle(
              fontFamily: 'Comfortaa',
              fontSize: 19,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(
            height: 8,
          ),
          Center(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
              width: 300,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  border: Border.all(color: Colors.black, width: 1)),
              child: DropdownButtonHideUnderline(
                child: DropdownButton<String>(
                  focusColor: Colors.red,
                  isExpanded: true,
                  dropdownColor: Colors.red[200],
                  value: answer2,
                  items: items2.map(buildMenuItem).toList(),
                  onChanged: (value) => setState(() {
                    answer2 = value;
                  }),
                ),
              ),
            ),
          ),
          //////////////////////////////////3
          const SizedBox(
            height: 25,
          ),
          const Text(
            'Você está lotado em:',
            style: TextStyle(
              fontFamily: 'Comfortaa',
              fontSize: 19,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(
            height: 8,
          ),
          Center(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
              width: 300,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  border: Border.all(color: Colors.black, width: 1)),
              child: DropdownButtonHideUnderline(
                child: DropdownButton<String>(
                  focusColor: Colors.red,
                  isExpanded: true,
                  dropdownColor: Colors.red[200],
                  value: answer3,
                  items: items3.map(buildMenuItem).toList(),
                  onChanged: (value) => setState(() {
                    this.answer3 = value;
                  }),
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 25,
          ),

          const Text(
            'Estado',
            style: TextStyle(
              fontFamily: 'Comfortaa',
              fontSize: 19,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(
            height: 8,
          ),

          Center(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
              width: 300,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  border: Border.all(color: Colors.black, width: 1)),
              child: DropdownButtonHideUnderline(
                child: DropdownButton<String>(
                  focusColor: Colors.red,
                  isExpanded: true,
                  dropdownColor: Colors.red[200],
                  value: answer4,
                  items: items4.map(buildMenuItem).toList(),
                  onChanged: (value) => setState(() {
                    this.answer4 = value;
                  }),
                ),
              ),
            ),
          ),
//pegar uma API PARA AS LOCALIDADES
          const SizedBox(
            height: 25,
          ),

          const Text(
            'Cidade',
            style: TextStyle(
              fontFamily: 'Comfortaa',
              fontSize: 19,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(
            height: 8,
          ),

          Center(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
              width: 300,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  border: Border.all(color: Colors.black, width: 1)),
              child: DropdownButtonHideUnderline(
                child: DropdownButton<String>(
                  focusColor: Colors.red,
                  isExpanded: true,
                  dropdownColor: Colors.red[200],
                  value: answer5,
                  items: items5.map(buildMenuItem).toList(),
                  onChanged: (value) => setState(() {
                    this.answer5 = value;
                  }),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 30,
          ),
          /*   const Text(
            'No último mês, durante o horário de plantão quantos dias' +
                'você foi instruído a realizar exercício físico para melhorar a performance ? ',
            style: TextStyle(
              fontFamily: 'Comfortaa',
              fontSize: 19,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(
            height: 8,
          ),
          Center(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
              width: 300,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  border: Border.all(color: Colors.black, width: 1)),
              child: DropdownButtonHideUnderline(
                child: DropdownButton<String>(
                  focusColor: Colors.red,
                  isExpanded: true,
                  dropdownColor: Colors.red[200],
                  value: answer7,
                  items: items7.map(buildMenuItem).toList(),
                  onChanged: (value) => setState(() {
                    this.answer7 = value;
                  }),
                ),
              ),
            ),
          ),
*/
          Center(
            child: MaterialButton(
              color: Color.fromARGB(255, 24, 117, 43),
              shape: const CircleBorder(),
              onPressed: () /* async*/ {
                //Criando um document no firebase em 'user'
                /* DocumentReference documentReference = FirebaseFirestore.instance
                    .collection('user')
                    .doc(user!.displayName);
                await documentReference.set({
                  'cargo': answer1,
                });
                documentReference.update({
                  'Posto': answer2,
                  'Lotado em': answer3,
                  'estado': answer4,
                  'cidade': answer5,
                });*/
                Navigator.of(context).push(
                  MaterialPageRoute(
                      builder: (constect) => CorpoHumano(),
                      settings: RouteSettings()),
                );
              },
              child: const Padding(
                padding: EdgeInsets.all(40),
                child: Text(
                  'Seguir',
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

DropdownMenuItem<String> buildMenuItem(String item) => DropdownMenuItem(
      value: item,
      child: Text(
        item,
        style: const TextStyle(fontSize: 17),
      ),
    );
//floating action button