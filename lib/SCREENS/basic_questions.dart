// ignore_for_file: avoid_unnecessary_containers, sized_box_for_whitespace, unnecessary_this, prefer_const_constructors

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:strong_core/SCREENS/questions.dart';
import 'package:strong_core/SCREENS/questions2.dart';

class BasicQuestions extends StatefulWidget {
  const BasicQuestions({Key? key}) : super(key: key);

  @override
  State<BasicQuestions> createState() => _BasicQuestionsState();
}

class _BasicQuestionsState extends State<BasicQuestions> {
  //lista de opções para a seleção do sexo
  final items = ['Feminino', 'Masculino'];
  //variável para armazenar a resposta escolhida,que será
  //usada para renderizar na tela a mesma
  String? answer;
  CollectionReference basicQuestionsData =
      FirebaseFirestore.instance.collection('user');
  @override
  Widget build(BuildContext context) {
    final TextEditingController _nome = TextEditingController();
    Widget buildName() => TextFormField(
          decoration: const InputDecoration(
            focusColor: Colors.red,
            labelText: 'Nome Completo',
            border: OutlineInputBorder(),
          ),
          // controller: _nome,
        );

    return Column(
      //padding: const EdgeInsets.only(left: 12),
      children: [
        SizedBox(
          height: 20,
        ),
        const Text('  Preencha os seguintes campos para continuar',
            style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w500,
                fontFamily: 'Comfortaa')),
        const SizedBox(
          height: 30,
        ),
        Row(
          children: [
            Container(
              width: 300,
              child: buildName(),
            ),
            const SizedBox(
              width: 10,
            ),

            //buildLastName(),
          ],
        ),
        const SizedBox(
          height: 20,
        ),
        Row(
          children: [
            Container(
              padding: const EdgeInsets.all(12),
              //margin: const EdgeInsets.only(right: 100),
              width: 160,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  border: Border.all(color: Colors.black26)),
              child: Container(
                height: 35,
                child: DropdownButtonHideUnderline(
                  child: DropdownButton<String>(
                    focusColor: Colors.red,
                    isExpanded: true,
                    dropdownColor: Colors.red[200],
                    value: answer,
                    hint: const Text('Sexo'),
                    items: items.map(buildMenuItem).toList(),
                    onChanged: (value) => setState(() {
                      this.answer = value;
                    }),
                  ),
                ),
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 20,
        ),
        Row(
          children: [
            Container(
              width: 130,
              child: buildPeso(),
            ),
            SizedBox(
              width: 10,
            ),
            Container(
              width: 130,
              //margin: const EdgeInsets.only(right: 150),
              child: buildAltura(),
            ),
          ],
        ),
        const SizedBox(
          height: 20,
        ),
        Row(
          children: [
            Container(
              width: 200,
              // margin: const EdgeInsets.only(right: 150),
              child: buildDate(),
            ),
          ],
        ),
        /*   SizedBox(
          height: 30,
        ),
        Container(
          margin: EdgeInsets.only(left: 50, right: 50),
          child: MaterialButton(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(50)),
            color: Colors.red,
            child: Text('Continuar'),
            onPressed: (() {
              Navigator.of(context).push(
                MaterialPageRoute(
                    builder: (constect) => QuestionTEMP(),
                    settings: const RouteSettings()),
              );
            }),
          ),
        )*/
        /* Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              MaterialButton(
                  onPressed: (() {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                          builder: (constect) => Question(),
                          settings: const RouteSettings()),
                    );
                  }),
                  child: CircleAvatar(
                    backgroundColor: Color.fromARGB(255, 221, 88, 85),
                    child: Icon(
                      Icons.chevron_left_rounded,
                      size: 60,
                      color: Colors.white,
                    ),
                    radius: 40,
                  )),
            
                  child: CircleAvatar(
                    backgroundColor: Color.fromARGB(255, 171, 42, 40),
                    child: Icon(
                      Icons.chevron_right_rounded,
                      size: 60,
                      color: Colors.white,
                    ),
                    radius: 40,
                  )),*/
      ],
    );
  }
}

//lembrar de fazer as verificações se as informações foram preenchidas corretamentes
Widget buildDate() => TextFormField(
      keyboardType: TextInputType.datetime,
      decoration: const InputDecoration(
        focusColor: Colors.red,
        labelText: 'Data de nascimento',
        border: OutlineInputBorder(),
      ),
    );

Widget buildPeso() => TextFormField(
      keyboardType: TextInputType.number,
      decoration: const InputDecoration(
        focusColor: Colors.red,
        labelText: 'Peso',
        hintText: 'Kg',
        border: OutlineInputBorder(),
      ),
    );

Widget buildAltura() => TextFormField(
      keyboardType: TextInputType.number,
      decoration: const InputDecoration(
        focusColor: Colors.red,
        labelText: 'Altura',
        hintText: 'cm',
        border: OutlineInputBorder(),
      ),
    );

DropdownMenuItem<String> buildMenuItem(String item) => DropdownMenuItem(
      value: item,
      child: Text(
        item,
        style: const TextStyle(fontSize: 17),
      ),
    );
//floating action button

Widget builllll() => Container(
      child: const Text('dsadsad'),
    );
