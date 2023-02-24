// ignore_for_file: prefer_const_constructors_in_immutables

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:multiselect/multiselect.dart';
import 'package:provider/provider.dart';
import 'package:strong_core/MODELS/multi_select_pain.dart';
import 'package:strong_core/SCREENS/corpo_humano.dart';
import 'package:strong_core/main.dart';

import '../provider/information_forms.dart';

//Configurar um tamanho dinâmico para o dropDownButton
class Question3 extends StatefulWidget {
  // final Function(User) onSingOut;
  Question3();

  @override
  State<Question3> createState() => _Question3State();
}

class _Question3State extends State<Question3> {
  var user = FirebaseAuth.instance.currentUser;
  CollectionReference questionData =
      FirebaseFirestore.instance.collection('user');

  final items1 = [
    'Dores Oteomusculares',
    'Entorse Articular',
    'Fratura Óssea',
    'Enxaqueca',
  ];
  String? answer1;

  final items2 = [
    'Nenhum dia',
    'Um dia',
    'Dois dias',
    'Três dias',
    'Quatro dias',
    'Cinco dias',
    'Seis dias ou mais'
  ];
  String? answer2;

  final items3 = [
    'Nenhum estresse',
    'Estresse abaixo do normal',
    'Estresse normal',
    'Estresse acima do normal',
    'Estresse extremamente elevado',
  ];
  String? answer3;
  NameProblemController controller = NameProblemController();
  @override
  Widget build(BuildContext context) {
    final InformationForms = Provider.of<Information>(context);

    return Column(
      // primary: false,//MOSTRA UMA COR AO TENTAR MOVER A LIST VIEW
      children: [
        ////////////////////////////////////////////1
        const Text(
          'Nos últimos 12 meses você foi diagnosticado com algum desses problemas de saúde?',
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
            child: DropDownMultiSelect(
              options: controller.options,
              whenEmpty: 'Selecione uma das opções',
              onChanged: (p0) {
                controller.selectedOptionList.value = p0;
                controller.selectedoption.value = '';
                controller.selectedOptionList.value.forEach((element) {
                  controller.selectedoption.value + '' + element;
                });
                InformationForms.setListDores(
                    controller.selectedOptionList.value);
              },
              selectedValues: controller.selectedOptionList.value,
            ),
          ),
        ),
        /*    Center(
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
          'Nos últimos 7 dias quantos dias você dormiu o suficiente, sentindo-se descansado pela manhã?',
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
                  InformationForms.setQuestion4(value!);
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
          'Nos últimos 6 meses como você classifica o seu estresse geral?*',
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
                itemHeight: 70,
                focusColor: Colors.red,
                isExpanded: true,
                dropdownColor: Colors.red[200],
                value: answer3,
                items: items3.map(buildMenuItem).toList(),
                onChanged: (value) => setState(() {
                  InformationForms.setQuestion5(value!);
                  answer3 = value;
                }),
              ),
            ),
          ),
        ),
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
DropdownMenuItem<String> buildMenuItemWithOptions(String item) =>
    DropdownMenuItem(
      value: item,
      child: Column(
        children: [
          Text(
            item,
            style: const TextStyle(fontSize: 14),
          ),
          Row(
            children: [Checkbox(value: false, onChanged: ((value) => true))],
          ),
        ],
      ),
    );
//floating action button
