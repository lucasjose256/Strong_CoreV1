// ignore_for_file: prefer_const_constructors_in_immutables

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:strong_core/SCREENS/corpo_humano.dart';
import 'package:strong_core/main.dart';

import '../provider/information_forms.dart';

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
    'Soldado 2º Classe',
    'Soldado 1º Clase',
    'Cabo',
    '3º Sargento',
    '2º Sargento',
    '1º Sargento',
    'Subtenente',
    'Cadete 1º ano',
    'Cadete 2º ano',
    'Cadete 3º ano',
    'Aspirante à Oficial',
    '2º Tenente',
    '1º Tenente',
    'Capitão',
    'Major',
    'Tenente Coronel',
    'Coronel'
  ];
  String? answer2;

  final items3 = ['Cargo  administrativo', 'Cargo operacional'];
  String? answer3;

  String? answer6;
  final items4 = [
    'Nenhum dia',
    'Um dia',
    'Dois dias',
    'Três dias',
    'Quatro dias',
    'Cinco Dias ou mais',
  ];
  String? answer4;
  TextEditingController c = TextEditingController();
  Widget buildDateAdmissao() => TextFormField(
        keyboardType: TextInputType.number,
        decoration: const InputDecoration(
            focusColor: Colors.red,
            // labelText: 'Date de Admissão',
            border: OutlineInputBorder(),
            hintText: 'mm/aaaa'),
        onChanged: (value) {
          if (value.length == 2) {
            setState(() {
              //    c.value= '${value}';
            });
            print('foiiiiiiiiii');
          }
        },
        // controller: _nome,
      );
  Future<void> logOut() async {
    await FirebaseAuth.instance.signOut();
    onRefrash(null);
  }

  @override
  Widget build(BuildContext context) {
    final infoForms = Provider.of<Information>(context);
    return Column(
      /*  addRepaintBoundaries: false,
        shrinkWrap: false,
        addAutomaticKeepAlives: false,
        addSemanticIndexes: false,*/
      // primary: false,//MOSTRA UMA COR AO TENTAR MOVER A LIST VIEW
      children: [
        ////////////////////////////////////////////1
        /* const Text(
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
                  answer1 = value;
                }),
              ),
            ),
          ),
        ),*/
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
                border: Border.all(color: Colors.black, width: 0.7)),
            child: DropdownButtonHideUnderline(
              child: DropdownButton<String>(
                focusColor: Colors.red,
                isExpanded: true,
                dropdownColor: Colors.red[200],
                value: answer2,
                items: items2.map(buildMenuItem).toList(),
                onChanged: (value) => setState(() {
                  infoForms.setPosto(value!);
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
                border: Border.all(color: Colors.black, width: 0.7)),
            child: DropdownButtonHideUnderline(
              child: DropdownButton<String>(
                focusColor: Colors.red,
                isExpanded: true,
                dropdownColor: Colors.red[200],
                value: answer3,
                items: items3.map(buildMenuItem).toList(),
                onChanged: (value) => setState(() {
                  infoForms.setCargo(value!);
                  answer3 = value;
                }),
              ),
            ),
          ),
        ),

        const SizedBox(
          height: 25,
        ),
        const Text(
          'Data de admissão',
          style: TextStyle(
            fontFamily: 'Comfortaa',
            fontSize: 19,
          ),
          textAlign: TextAlign.center,
        ),
        const SizedBox(
          height: 10,
        ),
        Center(
            child: Container(
          child: TextFormField(
            keyboardType: TextInputType.number,
            decoration: const InputDecoration(
                focusColor: Colors.red,
                // labelText: 'Date de Admissão',
                border: OutlineInputBorder(),
                hintText: 'mm/aaaa'),
            onChanged: (value) {
              infoForms.setDataAdmissao(value);
            },
            // controller: _nome,
          ),
          width: 300,
        )),

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
      ],
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

/*
DocumentReference documentReference = FirebaseFirestore.instance
                  .collection('user')
                  .doc(user!.displayName);
              await documentReference.set({
                'cargo': answer1,
                'Posto': answer2,
                'Lotado em': answer3,
                'estado': answer4,
                'cidade': answer5,
              });
              Navigator.of(context).push(
                MaterialPageRoute(
                    builder: (constect) => const CorpoHumano(),
                    settings: const RouteSettings()),
              );
            },*/