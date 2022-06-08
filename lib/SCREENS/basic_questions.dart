import 'package:flutter/material.dart';
import 'package:strong_core/SCREENS/questions.dart';

class BasicQuestions extends StatefulWidget {
  const BasicQuestions({Key? key}) : super(key: key);

  @override
  State<BasicQuestions> createState() => _BasicQuestionsState();
}

class _BasicQuestionsState extends State<BasicQuestions> {
  final items = ['Feminino', 'Masculino'];
  String? answer;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // foregroundColor: Colors.orange,
        backgroundColor: Colors.red[800],
        title: Center(
          child: Text('Strong Core',
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  fontFamily: 'Comfortaa')),
        ),
      ),
      body: Container(
        child: ListView(
          padding: EdgeInsets.only(left: 12),
          children: [
            SizedBox(
              height: 30,
            ),
            Text('Preencha os seguintes campos para continuar',
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                    fontFamily: 'Comfortaa')),
            SizedBox(
              height: 30,
            ),
            Row(
              children: [
                Container(
                  width: 150,
                  child: buildName(),
                ),
                SizedBox(
                  width: 10,
                ),
                Container(
                  width: 180,
                  child: buildLastName(),
                ),

                //buildLastName(),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              padding: EdgeInsets.all(12),
              margin: EdgeInsets.only(right: 100),
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
                    hint: Text('Sexo'),
                    items: items.map(buildMenuItem).toList(),
                    onChanged: (value) => setState(() {
                      this.answer = value;
                    }),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              margin: EdgeInsets.only(right: 150),
              child: buildDate(),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              margin: EdgeInsets.only(right: 150),
              child: buildPeso(),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              margin: EdgeInsets.only(right: 150),
              child: buildAltura(),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              margin: EdgeInsets.only(left: 50, right: 50),
              child: ElevatedButton(
                child: Text('Continuar', style: TextStyle(fontSize: 14)),
                style: ButtonStyle(
                  foregroundColor:
                      MaterialStateProperty.all<Color>(Colors.white),
                  backgroundColor: MaterialStateProperty.all<Color>(Colors.red),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(50)),
                    ),
                  ),
                ),
                onPressed: () {
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

Widget buildName() => TextFormField(
      decoration: InputDecoration(
        focusColor: Colors.red,
        labelText: 'Nome',
        border: OutlineInputBorder(),
      ),
    );

Widget buildLastName() => TextFormField(
      decoration: InputDecoration(
        focusColor: Colors.red,
        labelText: 'Sobrenome',
        border: OutlineInputBorder(),
      ),
    );
//lembrar de fazer as verificações se as informações foram preenchidas corretamentes
Widget buildDate() => TextFormField(
      keyboardType: TextInputType.datetime,
      decoration: InputDecoration(
        focusColor: Colors.red,
        labelText: 'Data de nascimento',
        border: OutlineInputBorder(),
      ),
    );

Widget buildPeso() => TextFormField(
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
        focusColor: Colors.red,
        labelText: 'Peso',
        hintText: 'Kg',
        border: OutlineInputBorder(),
      ),
    );

Widget buildAltura() => TextFormField(
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
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


