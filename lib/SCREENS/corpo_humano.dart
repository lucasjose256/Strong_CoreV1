import 'package:flutter/material.dart';
import 'package:strong_core/SCREENS/basic_questions.dart';
import 'package:strong_core/SCREENS/provisoria.dart';
import 'package:strong_core/SCREENS/screen_semanas.dart';
import 'package:strong_core/style/add_pop_up_card.dart';

class CorpoHumano extends StatefulWidget {
  CorpoHumano({Key? key}) : super(key: key);

  @override
  State<CorpoHumano> createState() => _CorpoHumanoState();
}

class _CorpoHumanoState extends State<CorpoHumano> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Stack(children: [
            Image.asset('Assets/images/corpoHumano.png'),
            Positioned(right: 138, top: 75, child: AddTodoButton('1')),
            Positioned(right: 138, top: 130, child: AddTodoButton('2'))
          ]),
          MaterialButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                    builder: (constect) => Semanas(),
                    settings: RouteSettings()),
              );
            },
            color: Colors.green,
            child: Text('Continuar'),
          )
        ],
      ),
    );
  }
}
/*
class NewWidget extends StatelessWidget {
  const NewWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
        shape: CircleBorder(),
        color: Colors.red,
        height: 20,
        minWidth: 10,
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
                builder: (constect) => AddTodoPopupCard(),
                settings: RouteSettings()),
          );
        },
        child: Text(
          '1',
          textAlign: TextAlign.center,
          style:
              TextStyle(color: Color.fromARGB(255, 16, 16, 16), fontSize: 20),
        ));
  }
}
*/