import 'package:flutter/material.dart';

class Question extends StatefulWidget {
  Question({Key? key}) : super(key: key);

  @override
  State<Question> createState() => _QuestionState();
}

class _QuestionState extends State<Question> {
  final items1 = ['Bombeiro Militar', 'Policial Militar'];
  String? answer1;

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
        children: [
          const SizedBox(
            height: 50,
          ),
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
              padding: EdgeInsets.symmetric(horizontal: 12, vertical: 4),
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
          )
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
