import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:strong_core/MODELS/VideoTest.dart';
import 'package:strong_core/MODELS/card_expansivel_semana.dart';
import 'package:strong_core/MODELS/cartao_bloqueado.dart';
import 'package:strong_core/MODELS/user_preferences.dart';
import 'package:strong_core/MODELS/_____video_model.dart';
import 'package:strong_core/SCREENS/basic_questions.dart';
import 'package:strong_core/SCREENS/corpo_humano.dart';
import 'package:strong_core/SCREENS/questions.dart';
import 'package:strong_core/SCREENS/questions2.dart';
import 'package:strong_core/SCREENS/questions3.dart';
import 'package:strong_core/SCREENS/screen_semanas.dart';

import '../provider/information_forms.dart';
import '../style/add_pop_up_card.dart';

class Forms extends StatefulWidget {
  Forms({Key? key}) : super(key: key);

  @override
  State<Forms> createState() => _FormsState();
}

class _FormsState extends State<Forms> {
  int stepCounter = 0;
  List<Step> stepsList() => [
        Step(
            state: stepCounter > 0 ? StepState.complete : StepState.indexed,
            isActive: stepCounter >= 0,
            title: Text('', style: TextStyle(color: Colors.black)),
            content: BasicQuestions()),
        Step(
            state: stepCounter > 1 ? StepState.complete : StepState.indexed,
            isActive: stepCounter >= 1,
            title: Text('', style: TextStyle(color: Colors.black)),
            content: Question()),
        Step(
          state: stepCounter > 2 ? StepState.complete : StepState.indexed,
          isActive: stepCounter >= 2,
          title: Text('', style: TextStyle(color: Colors.black)),
          content: Question2(),
        ),
        Step(
          state: stepCounter > 3 ? StepState.complete : StepState.indexed,
          isActive: stepCounter >= 3,
          title: Text('', style: TextStyle(color: Colors.black)),
          content: Question3(),
        ),
      ];

  @override
  Widget build(BuildContext context) {
    final infoForms = Provider.of<Information>(context);
    String dores = '';
    String Aux = '';
    for (int i = 0; i < infoForms.dores.length; i++) {
      dores += infoForms.dores[i] + ',';
    }
    return Scaffold(
      appBar: AppBar(
        title: Text('Strong Core'),
      ),
      body: Stepper(
        steps: stepsList(),
        elevation: 5,

        onStepContinue: () async {
          final isLastStep = stepCounter == stepsList().length - 1;
          if (isLastStep) {
            await FirebaseFirestore.instance
                .collection('user')
                .doc(FirebaseAuth.instance.currentUser!.uid)
                .set({
              'seu nome é': infoForms.nome,
              'Sexo': infoForms.sexo,
              'Lista de Dores': dores
            });
            await UserPreferences.setBool(false);

            Navigator.of(context).push(
              MaterialPageRoute(
                  builder: (constect) => const CorpoHumano(),
                  settings: const RouteSettings()),
            );
          } else {
            setState(() {
              stepCounter++;
            });
          }
        },
        onStepCancel: stepCounter == 0
            ? null
            : (() {
                setState(() {
                  stepCounter--;
                  if (stepCounter < 0) {
                    stepCounter++;
                  }
                });
              }),
        // type: StepperType.horizontal,
        controlsBuilder: (BuildContext context, ControlsDetails details) {
          return Row(
            children: <Widget>[
              stepCounter == stepsList().length - 1
                  ? Expanded(
                      child: MaterialButton(
                        onPressed: details.onStepContinue,
                        child: const Text(
                          'ENVIAR',
                          style: TextStyle(color: Colors.red, fontSize: 15),
                        ),
                      ),
                    )
                  : Expanded(
                      child: MaterialButton(
                          onPressed: details.onStepContinue,
                          child: const Text(
                            'PROXIMO',
                            style: TextStyle(color: Colors.red, fontSize: 15),
                          )),
                    ),
              Expanded(
                child: MaterialButton(
                  onPressed: details.onStepCancel,
                  child: const Text(
                    'VOLTAR',
                    style: TextStyle(fontSize: 15),
                  ),
                ),
              ),
            ],
          );
        },
        currentStep: stepCounter,
        type: StepperType.horizontal,
      ),
    );
  }
}
