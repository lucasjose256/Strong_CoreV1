import 'package:flutter/material.dart';

//Configurar um tamanho dinâmico para o dropDownButton
class Question extends StatefulWidget {
  Question({Key? key}) : super(key: key);

  @override
  State<Question> createState() => _QuestionState();
}

class _QuestionState extends State<Question> {
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
    '1 º Sargento'
  ];
  String? answer2;
  final items3 = [
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
    'TO',
  ];
  String? answer3;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: Colors.grey,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.red[800],
        title: const Center(
          child: Text('Strong Core',
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  fontFamily: 'Comfortaa')),
        ),
      ),
      body: ListView(
        addRepaintBoundaries: false,
        shrinkWrap: false,
        addAutomaticKeepAlives: false,
        addSemanticIndexes: false,
        primary: false,
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
              padding:const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
              width: 300,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: Colors.black, width: 4)),
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
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: Colors.black, width: 4)),
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
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: Colors.black, width: 4)),
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