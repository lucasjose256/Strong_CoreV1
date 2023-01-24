import 'package:expansion_card/expansion_card.dart';
import 'package:flutter/material.dart';
import 'package:strong_core/MODELS/VideoTest.dart';
import 'package:strong_core/MODELS/_____video_model.dart';

class CardSemanas extends StatefulWidget {
  String title;
  CardSemanas({required this.title});

  @override
  State<CardSemanas> createState() => _CardSemanasState();
}

class _CardSemanasState extends State<CardSemanas> {
  bool isChecked = false;
  bool isChecked1 = false;
  bool isChecked2 = false;
  bool isChecked3 = false;
  bool isChecked4 = false;
  bool isChecked5 = false;
  bool isChecked6 = false;
  @override
  Widget build(BuildContext context) {
    return /////////////////////
        ExpansionCard(
      //   backgroundColor: Colors.orange,
      borderRadius: 30,
      background: Image.network(
        'https://htmlcolorcodes.com/assets/images/colors/steel-gray-color-solid-background-1920x1080.png',
        scale: 1,
        //  height: 400,
      ),
      title: Container(
        child: Padding(
          padding: const EdgeInsets.only(
            left: 40,
          ),
          child: Text(
            widget.title,
            style: const TextStyle(
              color: Color.fromARGB(255, 255, 255, 255),
              fontSize: 38,
              fontFamily: 'Comfortaa',
              fontWeight: FontWeight.w800,
            ),
          ),
        ),
      ),
      children: [
        const SizedBox(
          height: 5,
        ),
        /*   Container(
          color: Colors.black,
          child: Text(
            'Os exercícios para esta semana são:',
            style: TextStyle(
                color: Color.fromARGB(255, 255, 255, 254), fontSize: 18),
          ),
        ),*/
        const SizedBox(height: 10),
        Row(
          //  mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.values[1],
          mainAxisSize: MainAxisSize.values[1],
          children: [
            const SizedBox(
              width: 5,
            ),
            Checkbox(
              activeColor: Colors.green,
              value: isChecked,
              onChanged: (value) {
                setState(() {
                  isChecked = value!;
                });
              },
            ),
            Checkbox(
              activeColor: Colors.green,
              value: isChecked1,
              onChanged: (value) {
                setState(() {
                  isChecked1 = value!;
                });
              },
            ),
            Checkbox(
              activeColor: Colors.green,
              value: isChecked2,
              onChanged: (value) {
                setState(() {
                  isChecked2 = value!;
                });
              },
            ),
            Checkbox(
              activeColor: Colors.green,
              value: isChecked3,
              onChanged: (value) {
                setState(() {
                  isChecked3 = value!;
                });
              },
            ),
            Checkbox(
              activeColor: Colors.green,
              value: isChecked4,
              onChanged: (value) {
                setState(() {
                  isChecked4 = value!;
                });
              },
            ),
            MaterialButton(
              minWidth: 30,
              elevation: 10,
              color: const Color.fromARGB(255, 150, 201, 145),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => TelaEspera() //Video(20,),
                        ));
              },
              child: const Text('Começar'),
              // shape: CircleBorder(side: ),
            )
          ],
        )
      ],
    );
  }
}
