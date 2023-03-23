import 'package:audioplayers/audioplayers.dart';
import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:spotify/spotify.dart';

import '../SCREENS/screen_semanas.dart';

class TelaEspera extends StatefulWidget {
  int? tempoEspera;
  bool? istoShowButtun = false;
  TelaEspera({Key? key, this.tempoEspera, this.istoShowButtun})
      : super(key: key);

  @override
  State<TelaEspera> createState() => _TelaEsperaState();
}

class _TelaEsperaState extends State<TelaEspera> {
  CountDownController _circulatTimerControl = CountDownController();
  Color? color = Color.fromARGB(255, 114, 114, 114);
  int tamRelogio = 5;
  bool showButtun = false;
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: (() async {
        final value = await showDialog<bool>(
            context: context,
            builder: (context) {
              _circulatTimerControl.pause();

              return AlertDialog(
                title: Text(
                  'Exercicios',
                ),
                content: Text('Você realmente quer sair? \n' +
                    '(Se você sair o progresso desses exercícios será perdido)'),
                actions: [
                  ElevatedButton(
                      onPressed: (() {
                        _circulatTimerControl.resume();

                        Navigator.pop(context);
                      }),
                      child: Text('Continuar')),
                  MaterialButton(
                    onPressed: (() => Navigator.push(context,
                        MaterialPageRoute(builder: ((context) => Semanas())))),
                    child: Text(
                      'Sair',
                      style: TextStyle(color: Colors.red),
                    ),
                  )
                ],
              );
            });
        if (value != null) {
          return Future.value(value);
        } else {
          return Future.value(false);
        }
      }),
      child: Scaffold(
        body: Column(
          children: [
            SizedBox(
              height: 140,
            ),
            Text(
              'RETORNANDO EM',
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 25,
                  decorationThickness: 50,
                  fontWeight: FontWeight.w600),
            ),
            Center(
              child: CircularCountDownTimer(
                  duration: widget.tempoEspera ?? 30,
                  initialDuration: 0,
                  controller: _circulatTimerControl,
                  width: MediaQuery.of(context).size.width / tamRelogio,
                  height: MediaQuery.of(context).size.height / tamRelogio,
                  ringColor: Colors.grey[300]!,
                  ringGradient: null,
                  fillColor: color!,
                  fillGradient: null,
                  backgroundColor: color,
                  backgroundGradient: null,
                  strokeWidth: 20.0,
                  strokeCap: StrokeCap.round,
                  textStyle: TextStyle(
                      fontSize: 33.0,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                  textFormat: CountdownTextFormat.S,
                  isReverse: true,
                  isReverseAnimation: false,
                  isTimerTextShown: true,
                  autoStart: true,
                  onStart: () {
                    debugPrint('Countdown Started');
                  },
                  onComplete: () {
                    setState(() {
                      if (widget.istoShowButtun == true) {
                        showButtun = true;
                      } else {
                        Navigator.pop(context, 1);
                      }
                    });
                    //  Navigator.pop(context, 1);

                    /*Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => TelaEspera(),
                      ));*/
                    debugPrint('Countdown Ended');
                  },
                  onChange: (String timeStamp) {
                    WidgetsBinding.instance.addPostFrameCallback((_) {
                      if (timeStamp.toString() == '3') {
                        setState(() {
                          build(context);
                          //   AudioCache().play('som_intervalo.mp3');
                          tamRelogio = 4;
                          color = Colors.red;
                        });
                      }
                      // Your Code Here
                    });
                    debugPrint('Countdown Changed $timeStamp');
                  }),
            ),
            SizedBox(
              height: 80,
            ),
            showButtun == true
                ? MaterialButton(
                    child: CircleAvatar(
                      radius: 70,
                      backgroundColor: Color.fromARGB(255, 70, 117, 71),
                      child: FittedBox(
                        child: Text(
                          'CONTINUAR',
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    onPressed: (() => Navigator.pop(context, 1)),
                  )
                : TextButton(
                    onPressed: () {
                      Navigator.pop(context, 1);
                    },
                    style: TextButton.styleFrom(
                      textStyle: TextStyle(fontSize: 20, color: Colors.grey),
                      //<-- SEE HERE
                      side: BorderSide(width: 2.0, color: Colors.grey),
                    ),
                    child: Text(
                      'P U L A R',
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
          ],
        ),
      ),
    );
  }
}
