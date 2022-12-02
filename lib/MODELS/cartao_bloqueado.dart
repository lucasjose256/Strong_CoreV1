import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';
import 'package:strong_core/MODELS/video_model.dart';
import 'package:intl/intl.dart';

class CartaoBloqueado extends StatefulWidget {
  @override
  final Color cor;
  final String title;
  final int number;

  const CartaoBloqueado(
      {Key? key, required this.cor, required this.title, required this.number})
      : super(key: key);
  _CartaoBloqueadoState createState() => _CartaoBloqueadoState();
}

class _CartaoBloqueadoState extends State<CartaoBloqueado> {
  String TapToExpandIt = 'SEMANA 4';
  String Sentence = 'EXERCICIOS DA SEMANA:\n'
      '3X PRANCHA(30s)\n'
      '3X ABDOMINAL(30s)\n'
      '3X FLEXÃO(30s)';
  bool isExpanded = true;
  bool isExpanded2 = true;
//flags para checkbox
  bool isChecked = false;
  bool isChecked1 = false;
  bool isChecked2 = false;
  bool isChecked3 = false;
  bool isChecked4 = false;
  bool isChecked5 = false;
  bool isChecked6 = false;

  int stepBarControll = 0;
  @override
  Widget build(BuildContext context) {
    List<String> nomeVideos = [
      'https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4',
      'https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4',
    ];
    if (isExpanded) {
      setState(() {});
    }
    return Container(
      child: InkWell(
        highlightColor: Colors.transparent,
        splashColor: Colors.transparent,
        onTap: () {
          setState(() {
            //* isExpanded = !isExpanded;
          });
        },
        child: AnimatedContainer(
          margin: EdgeInsets.symmetric(
            horizontal: 10, // isExpanded ? 25 : 10,
            vertical: 20,
          ),
          padding: EdgeInsets.all(20),
          height: isExpanded ? 100 : 330,
          curve: Curves.fastLinearToSlowEaseIn,
          duration: Duration(milliseconds: 1200),
          decoration: BoxDecoration(
            /*  boxShadow: [
              BoxShadow(
                color: Color.fromARGB(255, 91, 55, 137).withOpacity(0.5),
                blurRadius: 20,
                offset: Offset(5, 10),
              ),
            ],*/
            color: widget.cor,
            borderRadius: BorderRadius.all(
              Radius.circular(isExpanded ? 20 : 20),
            ),
          ),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Text(
                        widget.title,
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 22,
                            fontWeight: FontWeight.w400,
                            fontFamily: 'Comfortaa'),
                      ),
                      SizedBox(
                        width: 15,
                      ),
                      Icon(Icons.lock_sharp, size: 50)
                    ],
                  ),
                  Icon(
                    //desaparecer a flecha se a semana estiver travada
                    isExpanded
                        ? Icons.keyboard_arrow_down
                        : Icons.keyboard_arrow_up,
                    color: Colors.white,
                    size: 30,
                  ),
                ],
              ),
              isExpanded ? SizedBox() : SizedBox(height: 20),
              AnimatedCrossFade(
                firstCurve: Curves.fastLinearToSlowEaseIn,
                firstChild: SingleChildScrollView(
                  child: Text(
                    '',
                    style: TextStyle(
                      fontSize: 0,
                    ),
                  ),
                ),
                secondChild: Column(
                  children: [
                    Text(
                      'EXERCÍCIOS DA SEMANA:',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          backgroundColor: Colors.black),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      //mainAxisSize: MainAxisSize.values[2],
                      //mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          ' PROGRESSO ',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ConstrainedBox(
                          constraints: BoxConstraints(maxWidth: 300),
                          child: StepProgressIndicator(
                            //stepCrossAxisAlignment: CrossAxisAlignment.start,
                            //   crossAxisAlignment: CrossAxisAlignment.start,
                            totalSteps: 3,
                            currentStep: stepBarControll,
                            size: 36,
                            selectedColor: Colors.black,
                            unselectedColor: Color.fromARGB(255, 194, 183, 183),
                            customStep: (indexs, color2, _) =>
                                color2 == Colors.black
                                    ? Container(
                                        color: color2,
                                        child: Icon(
                                          Icons.check,
                                          color: Colors.white,
                                        ),
                                      )
                                    : Container(
                                        width: 10,
                                        color: color2,
                                        child: Icon(
                                          Icons.remove,
                                        ),
                                      ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    MaterialButton(
                      minWidth: 200,
                      height: 50,
                      child: Text(
                        'I N I C I A R ',
                        style: TextStyle(color: Colors.white),
                      ),
                      color: Colors.black87,
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Video(20, nomeVideos),
                            ));
                      },
                    ),
                    MaterialButton(
                      child: Icon(
                        Icons.plus_one_outlined,
                        size: 20,
                        color: Colors.white,
                      ),
                      onPressed: () {
                        setState(() {
                          stepBarControll++;
                          if (stepBarControll == 4) {
                            stepBarControll = 0;
                          }
                        });
                      },
                      color: Color.fromARGB(255, 98, 92, 84),
                    )
                  ],
                ),
                crossFadeState: isExpanded
                    ? CrossFadeState.showFirst
                    : CrossFadeState.showSecond,
                duration: Duration(milliseconds: 1200),
                reverseDuration: Duration.zero,
                sizeCurve: Curves.fastLinearToSlowEaseIn,
              ),
            ],
          ),
        ),
      ),
    );
    /*  InkWell(
            highlightColor: Colors.transparent,
            splashColor: Colors.transparent,
            onTap: () {
              setState(() {
                isExpanded2 = !isExpanded2;
              });
            },
            child: AnimatedContainer(
              margin: EdgeInsets.symmetric(
                horizontal: isExpanded2 ? 25 : 0,
                vertical: 20,
              ),
              padding: EdgeInsets.all(20),
              height: isExpanded2 ? 70 : 330,
              curve: Curves.fastLinearToSlowEaseIn,
              duration: Duration(milliseconds: 1200),
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Color(0xffFF5050).withOpacity(0.5),
                    blurRadius: 20,
                    offset: Offset(5, 10),
                  ),
                ],
                color: Color(0xffFF5050),
                borderRadius: BorderRadius.all(
                  Radius.circular(isExpanded2 ? 20 : 0),
                ),
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        TapToExpandIt,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 22,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      Icon(
                        isExpanded2
                            ? Icons.keyboard_arrow_down
                            : Icons.keyboard_arrow_up,
                        color: Colors.white,
                        size: 27,
                      ),
                    ],
                  ),
                  isExpanded2 ? SizedBox() : SizedBox(height: 20),
                  AnimatedCrossFade(
                    firstChild: Text(
                      '',
                      style: TextStyle(
                        fontSize: 0,
                      ),
                    ),
                    secondChild: Text(
                      Sentence,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 15.7,
                      ),
                    ),
                    crossFadeState: isExpanded2
                        ? CrossFadeState.showFirst
                        : CrossFadeState.showSecond,
                    duration: Duration(milliseconds: 1200),
                    reverseDuration: Duration.zero,
                    sizeCurve: Curves.fastLinearToSlowEaseIn,
                  ),
                ],
              ),
            ),
          ),*/
  }
}
