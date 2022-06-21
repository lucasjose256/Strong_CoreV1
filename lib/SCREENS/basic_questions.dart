// ignore_for_file: avoid_unnecessary_containers, sized_box_for_whitespace, unnecessary_this

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:strong_core/SCREENS/questions.dart';

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
            labelText: 'Nome',
            border: OutlineInputBorder(),
          ),
          controller: _nome,
        );

    return Scaffold(
      appBar: AppBar(
        // foregroundColor: Colors.orange,
        backgroundColor: Colors.red[800],
        title: const Center(
          child: Text('Strong Core',
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  fontFamily: 'Comfortaa')),
        ),
      ),
      body: Container(
        child: ListView(
          padding: const EdgeInsets.only(left: 12),
          children: [
            const SizedBox(
              height: 30,
            ),
            const Text('Preencha os seguintes campos para continuar',
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
                    width: 150,
                    child: TextFormField(
                      decoration: const InputDecoration(
                        focusColor: Colors.red,
                        labelText: 'Nome',
                        border: OutlineInputBorder(),
                      ),
                      controller: _nome,
                    )),
                const SizedBox(
                  width: 10,
                ),
                Container(
                  width: 180,
                  child: buildLastName(),
                ),

                //buildLastName(),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              padding: const EdgeInsets.all(12),
              margin: const EdgeInsets.only(right: 100),
              width: 150,
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
            const SizedBox(
              height: 20,
            ),
            Container(
              margin: const EdgeInsets.only(right: 150),
              child: buildDate(),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              margin: const EdgeInsets.only(right: 150),
              child: buildPeso(),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              margin: const EdgeInsets.only(right: 150),
              child: buildAltura(),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              margin: const EdgeInsets.only(left: 50, right: 50),
              child: ElevatedButton(
                child: const Text('Continuar', style: TextStyle(fontSize: 18)),
                style: ButtonStyle(
                  foregroundColor:
                      MaterialStateProperty.all<Color>(Colors.white),
                  backgroundColor: MaterialStateProperty.all<Color>(Colors.red),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(60)),
                    ),
                  ),
                ),
                onPressed: () async {
                  /*  await basicQuestionsData.add({
                    'nome': _nome,
                  });*/
                  Navigator.of(context).push(
                    MaterialPageRoute(
                        builder: (constect) => Question(),
                        settings: RouteSettings()),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}

Widget buildLastName() => TextFormField(
      decoration: const InputDecoration(
        focusColor: Colors.red,
        labelText: 'Sobrenome',
        border: OutlineInputBorder(),
      ),
    );
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
