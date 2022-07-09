import 'dart:async';

import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class Video extends StatefulWidget {
  Video({Key? key}) : super(key: key);

  @override
  State<Video> createState() => _VideoState();
}

class _VideoState extends State<Video> {
  bool cancelTime = false;
  double porcent = 0;
  int tempo = 30;

  void carregarBarra() {
    Timer.periodic(Duration(seconds: 1), (timer) {
      if (porcent < 1 && !(cancelTime)) {
        setState(() {
          tempo--;
          porcent += 0.034;
        });
      } else if ((cancelTime)) {
        setState(() {
          porcent = porcent;
          tempo = tempo;
          timer.cancel();
          cancelTime = false;
        });
      } else
        setState(() {
          tempo = 0;
          porcent = 0;
          timer.cancel();
          tempo = 30;
        });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
        SizedBox(
          height: 30,
        ),
        SizedBox(
          height: 50,
        ),
        Row(
          children: [
            SizedBox(
              width: 50,
            ),
            Container(
              width: 250,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Container(
                  height: 18,
                  child: LinearProgressIndicator(
                    color: Colors.greenAccent,
                    value: porcent, // percent filled
                    valueColor: AlwaysStoppedAnimation<Color>(
                        Color.fromARGB(255, 27, 27, 27)),
                    backgroundColor: Color.fromARGB(129, 167, 166, 166),
                  ),
                ),
              ),
            ),
            SizedBox(
              width: 5,
            ),
            Text(tempo.toString(),
                style: TextStyle(
                  fontSize: 30,
                )),
          ],
        ),
        SizedBox(
          height: 30,
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(30)),
            child: Container(
              height: 300,
              color: Color.fromARGB(255, 113, 112, 112),
            ),
          ),
        ),
        SizedBox(
          height: 20,
        ),
        MaterialButton(
          child: Text(
            'I N I C I A R',
            style: TextStyle(color: Colors.white),
          ),
          onPressed: carregarBarra,
          color: Colors.black,
        ),
        SizedBox(
          height: 10,
        ),
        MaterialButton(
          child: Text(
            'P A R A R',
            style: TextStyle(color: Colors.white),
          ),
          onPressed: () {
            setState(() {
              cancelTime = true;
            });
          },
          color: Color.fromARGB(255, 183, 183, 183),
        ),
      ]),
    );
  }
}
