// ignore_for_file: avoid_unnecessary_containers, sized_box_for_whitespace, unnecessary_this, prefer_const_constructors

import 'package:brasil_fields/brasil_fields.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:provider/provider.dart';
import 'package:strong_core/SCREENS/questions.dart';
import 'package:strong_core/SCREENS/questions2.dart';

import '../provider/information_forms.dart';

class BasicQuestions extends StatefulWidget {
  const BasicQuestions({Key? key}) : super(key: key);

  @override
  State<BasicQuestions> createState() => _BasicQuestionsState();
}

class _BasicQuestionsState extends State<BasicQuestions> {
  //lista de opções para a seleção do sexo
  final items = ['Feminino', 'Masculino'];
  final dateController = TextEditingController();

  //variável para armazenar a resposta escolhida,que será
  //usada para renderizar na tela a mesma
  String? answer;
  DateTime? curretnDate;
  CollectionReference basicQuestionsData =
      FirebaseFirestore.instance.collection('demo');

  var _pesoKey;
  @override
  Widget build(BuildContext context) {
    final InformationForms = Provider.of<Information>(context);
    void _showDatePicker() {
      DatePicker.showDatePicker(
        context,
        showTitleActions: true,
        locale: LocaleType.pt,
        currentTime: curretnDate,
        minTime: DateTime(1970),
        maxTime: DateTime(2005),
        theme: DatePickerTheme(
          doneStyle: TextStyle(decorationColor: Colors.red),
        ),
        onConfirm: (date) {
          setState(() {
            curretnDate = date;
            dateController.text = DateFormat('dd/MM/yyyy').format(date);
            InformationForms.setNascimento(dateController.text);
          });
        },
      );
    }
    //final TextEditingController _nome = TextEditingController();

    // TextEditingController dateController = TextEditingController();
    return Container(
      child: Column(
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
                child: TextFormField(
                  onChanged: (value) {
                    InformationForms.setName(value);
                  },

                  decoration: const InputDecoration(
                    focusColor: Colors.red,
                    labelText: 'Nome Completo',
                    border: OutlineInputBorder(),
                  ),
                  // controller: _nome,
                ),
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
                        InformationForms.setSexo(value!);
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
                child: TextFormField(
                  key: _pesoKey,
                  validator: (value) {
                    if (value!.length > 2) {
                      return 'cccccc';
                    }
                  },
                  //minLines: 2,
                  //  maxLength: 3,
                  onChanged: ((value) {
                    InformationForms.setPeso(value);
                  }),
                  inputFormatters: [
                    new LengthLimitingTextInputFormatter(3),
                  ],
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    focusColor: Colors.red,
                    labelText: 'Peso(Kg)',
                    hintText: 'Kg',
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              SizedBox(
                width: 10,
              ),
              Container(
                width: 130,
                //margin: const EdgeInsets.only(right: 150),
                child: TextFormField(
                  //  maxLength: 3,
                  onChanged: (value) {
                    InformationForms.setAltura(value);
                  },
                  inputFormatters: [
                    new LengthLimitingTextInputFormatter(3),
                  ],
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    focusColor: Colors.red,
                    labelText: 'Altura(cm)',
                    hintText: 'cm',
                    border: OutlineInputBorder(),
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
                  width: 200,
                  // margin: const EdgeInsets.only(right: 150),
                  child: TextFormField(
                    expands: false,
                    keyboardType: TextInputType.none,
                    controller: dateController,
                    onTap: _showDatePicker,
                    decoration: InputDecoration(
                      suffixIcon: Icon(Icons.calendar_month),
                      hintText: ('dd/mm/aaaa'),
                      //   focusColor: Colors.red,
                      labelText: 'Data de nascimento',
                      //  border: OutlineInputBorder(),
                    ),
                  )),
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
      ),
    );
  }
}

class buildDataNascimento extends StatelessWidget {
  const buildDataNascimento({
    Key? key,
    required this.InformationForms,
  }) : super(key: key);

  final Information InformationForms;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: ((value) {
        if (value.length == 2) {
          value = value + '/';
        }
        InformationForms.setNascimento(value);
      }),
      keyboardType: TextInputType.number,
      decoration: const InputDecoration(
        hintText: ('dd/mm/aaaa'),
        focusColor: Colors.red,
        labelText: 'Data de nascimento',
        border: OutlineInputBorder(),
      ),
    );
  }
}

//lembrar de fazer as verificações se as informações foram preenchidas corretamentes
/*Widget buildDate() => TextFormField(onChanged: (value) {
  
},controller: dateController,
      keyboardType: TextInputType.number,
      decoration: const InputDecoration(
        focusColor: Colors.red,
        labelText: 'Data de nascimento',
        border: OutlineInputBorder(),
      ),
    );
*/
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
Widget buildName() => TextFormField(
      decoration: const InputDecoration(
        focusColor: Colors.red,
        labelText: 'Nome Completo',
        border: OutlineInputBorder(),
      ),
      // controller: _nome,
    );
