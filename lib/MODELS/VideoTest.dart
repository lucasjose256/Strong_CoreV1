import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:flutter/material.dart';

class TelaEspera extends StatefulWidget {
  TelaEspera({Key? key}) : super(key: key);

  @override
  State<TelaEspera> createState() => _TelaEsperaState();
}

class _TelaEsperaState extends State<TelaEspera> {
  Color? color = Color.fromARGB(255, 114, 114, 114);
  int tamRelogio = 5;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: CircularCountDownTimer(
            duration: 10,
            initialDuration: 0,
            controller: CountDownController(),
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
                color = Colors.red;
              });
              Navigator.pop(context, 1);

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
                    tamRelogio = 4;
                    color = Colors.red;
                  });
                }
                // Your Code Here
              });
              debugPrint('Countdown Changed $timeStamp');
            }),
      ),
    );
  }
}
