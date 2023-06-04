// ignore_for_file: prefer_const_constructors_in_immutables

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:strong_core/SCREENS/corpo_humano.dart';
import 'package:strong_core/main.dart';

import '../provider/information_forms.dart';

//Configurar um tamanho dinâmico para o dropDownButton
class Question2 extends StatefulWidget {
  // final Function(User) onSingOut;

  Question2({Key? key}) : super(key: key);

  @override
  State<Question2> createState() => _Question2State();
}

class _Question2State extends State<Question2> {
  var user = FirebaseAuth.instance.currentUser;
  CollectionReference questionData =
      FirebaseFirestore.instance.collection('user');

  final items1 = [
    'Nenhum dia',
    'Um dia',
    'Dois dias',
    'Três dias',
    'Quatro dias',
    'Cinco dias ou +',
  ];
  String? answer1;

  final items2 = [
    'Nenhum dia',
    '1 dia',
    '2 a 4 dias',
    '5 a 8 dias',
    '9 a 12 dias',
    'Mais de 15 dias',
  ];
  String? answer2;

  final items3 = [
    'Não recebo, e considero desnecessária essa informação para o meu trabalho.',
    'Não recebo, mas considero essa informação importante para meu trabalho.',
    'Recebo, mas considero desnecessária essa informação para o meu trabalho.',
    'Recebo, e considero essa informação importante para meu trabalho.',
  ];
  String? answer3;

  @override
  Widget build(BuildContext context) {
    final infoForms = Provider.of<Information>(context);
    return SingleChildScrollView(
      child: Column(
        // primary: false,//MOSTRA UMA COR AO TENTAR MOVER A LIST VIEW
        children: [
          ////////////////////////////////////////////1
          const Text(
            'Quantas vezes por semana você pratica exercício físico?',
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
                  hint: Text('Selecione uma das opções abaixo'),
                  isExpanded: true,
                  dropdownColor: Colors.red[200],
                  value: answer1,
                  items: items1.map(buildMenuItem).toList(),
                  onChanged: (value) => setState(() {
                    infoForms.setQuestion1(value!);
                    answer1 = value;
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
            'No último mês, durante o horário de plantão quantos dias você ' +
                'foi instruído a realizar exercício físico para melhorar a performance?',
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
                  hint: Text('Selecione uma das opções abaixo'),
                  isExpanded: true,
                  dropdownColor: Colors.red[200],
                  value: answer2,
                  items: items2.map(buildMenuItem).toList(),
                  onChanged: (value) => setState(() {
                    infoForms.setQuestion2(value!);
                    answer2 = value;
                  }),
                ),
              ),
            ),
          ),

          const SizedBox(
            height: 25,
          ),

          const Text(
            'Como você classifica as orientações sobre exercício físico no seu posto de trabalho?',
            style: TextStyle(
              fontFamily: 'Comfortaa',
              fontSize: 19,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(
            height: 25,
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
                  isDense: false,
                  hint: Text('Selecione uma das opções abaixo'),
                  itemHeight: 85,
                  isExpanded: true,
                  dropdownColor: Colors.red[200],
                  value: answer3,
                  items: items3.map(buildMenuItem).toList(),
                  onChanged: (value) => setState(() {
                    infoForms.setQuestion3(value!);
                    answer3 = value;
                  }),
                ),
              ),
            ),
          ), /*
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
                      answer4 = value;
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
                      answer5 = value;
                    }),
                  ),
                ),
              ),
            ),
            const SizedBox(
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
                color: const Color.fromARGB(255, 24, 117, 43),
                shape: const CircleBorder(),
                onPressed: () /* async*/ async {
                  //Criando um document no firebase em 'user'
                  DocumentReference documentReference = FirebaseFirestore.instance
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
                  });
                  Navigator.of(context).push(
                    MaterialPageRoute(
                        builder: (constect) => const CorpoHumano(),
                        settings: const RouteSettings()),
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
            ),*/
        ],
      ),
    );
  }
}

DropdownMenuItem<String> buildMenuItem(String item) => DropdownMenuItem(
      value: item,
      child: Text(
        item,
        style: const TextStyle(fontSize: 18),
      ),
    );
//floating action button
DropdownMenuItem<String> buildMenuItemletter(String item) => DropdownMenuItem(
      value: item,
      child: Text(
        item,
        style: const TextStyle(fontSize: 14),
      ),
    );
//floating action button
