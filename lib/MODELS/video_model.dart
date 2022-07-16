import 'dart:async';

import 'package:flutter/material.dart';

class Video extends StatefulWidget {
  const Video({Key? key}) : super(key: key);

  @override
  State<Video> createState() => _VideoState();
}

class _VideoState extends State<Video> {
  bool cancelTime = false;
  double porcent = 0;
  int tempo = 30;

  void carregarBarra() {
    Timer.periodic(const Duration(seconds: 1), (timer) {
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
      } else {
        setState(() {
          tempo = 0;
          porcent = 0;
          timer.cancel();
          tempo = 30;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
        const SizedBox(
          height: 30,
        ),
        const SizedBox(
          height: 50,
        ),
        Row(
          children: [
            const SizedBox(
              width: 50,
            ),
            SizedBox(
              width: 250,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: SizedBox(
                  height: 18,
                  child: LinearProgressIndicator(
                    color: Colors.greenAccent,
                    value: porcent, // percent filled
                    valueColor: const AlwaysStoppedAnimation<Color>(
                        Color.fromARGB(255, 27, 27, 27)),
                    backgroundColor: const Color.fromARGB(129, 167, 166, 166),
                  ),
                ),
              ),
            ),
            /*  Padding(
              padding: EdgeInsets.all(15.0),
              child: LinearPercentIndicator(
                width: MediaQuery.of(context).size.width - 200,
                animation: true,
                lineHeight: 20.0,
                animationDuration: 2000,
                //animationDuration: 2000,
                percent: porcent,
                linearStrokeCap: LinearStrokeCap.roundAll,
                progressColor: Color.fromARGB(255, 9, 10, 10),
              ),
            ),*/
            const SizedBox(
              width: 5,
            ),
            Text(tempo.toString(),
                style: const TextStyle(
                  fontSize: 30,
                )),
          ],
        ),
        const SizedBox(
          height: 30,
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: ClipRRect(
            borderRadius: const BorderRadius.all(Radius.circular(30)),
            child: Container(
              height: 300,
              color: const Color.fromARGB(255, 113, 112, 112),
            ),
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        MaterialButton(
          child: const Text(
            'I N I C I A R',
            style: TextStyle(color: Colors.white),
          ),
          onPressed: carregarBarra,
          color: Colors.black,
        ),
        const SizedBox(
          height: 10,
        ),
        MaterialButton(
          child: const Text(
            'P A R A R',
            style: TextStyle(color: Colors.white),
          ),
          onPressed: () {
            setState(() {
              cancelTime = true;
            });
          },
          color: const Color.fromARGB(255, 183, 183, 183),
        ),
        const SizedBox(
          height: 10,
        ),
        /*CircularCountDownTimer(
          duration: 10,
          initialDuration: 0,
          controller: CountDownController(),
          width: MediaQuery.of(context).size.width / 2,
          height: MediaQuery.of(context).size.height / 2,
          ringColor: Colors.grey[300]!,
          ringGradient: null,
          fillColor: Colors.purpleAccent[100]!,
          fillGradient: null,
          backgroundColor: Colors.purple[500],
          backgroundGradient: null,
          strokeWidth: 20.0,
          strokeCap: StrokeCap.round,
          textStyle: TextStyle(
              fontSize: 33.0, color: Colors.white, fontWeight: FontWeight.bold),
          textFormat: CountdownTextFormat.S,
          isReverse: false,
          isReverseAnimation: false,
          isTimerTextShown: true,
          autoStart: false,
          onStart: () {
            debugPrint('Countdown Started');
          },
          onComplete: () {
            debugPrint('Countdown Ended');
          },
          onChange: (String timeStamp) {
            debugPrint('Countdown Changed $timeStamp');
          },
        )*/
      ]),
    );
  }
}
