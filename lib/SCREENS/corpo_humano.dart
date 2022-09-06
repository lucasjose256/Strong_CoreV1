import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:screenshot/screenshot.dart';
import 'package:strong_core/SCREENS/screen_semanas.dart';
import 'package:strong_core/style/add_pop_up_card.dart';

class CorpoHumano extends StatefulWidget {
  const CorpoHumano({Key? key}) : super(key: key);

  @override
  State<CorpoHumano> createState() => _CorpoHumanoState();
}

class _CorpoHumanoState extends State<CorpoHumano> {
  Uint8List? bytes;
  @override
  Widget build(BuildContext context) {
    Stack dataCorpo;
    return Scaffold(
      /*  appBar: AppBar(
        automaticallyImplyLeading: false,
        // foregroundColor: Colors.orange,
        backgroundColor: Color.fromARGB(188, 198, 40, 40),
        title: const Center(
          child: Text('Strong Core',
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  fontFamily: 'Comfortaa')),
        ),
      ),*/
      body: ListView(
        children: [
          const SizedBox(
            height: 20,
          ),
          buildCorpo(),
          const SizedBox(
            height: 20,
          ),
          if (bytes != null) Container(child: Image.memory(bytes!)),
          MaterialButton(
            onPressed: () async {
              final controller = ScreenshotController();
              final bytes = await controller
                  .captureFromWidget(Material(child: buildCorpo()));
              setState(() => this.bytes = bytes);

              await FirebaseFirestore.instance
                  .collection('user')
                  .doc(FirebaseAuth.instance.currentUser!.displayName!)
                  .collection('Corpo HUmano')
                  .add({'Anaminese': 'sasasasasasa'});

              Navigator.of(context).push(
                MaterialPageRoute(
                    builder: (constect) => const Semanas(),
                    settings: const RouteSettings()),
              );
            },
            color: Colors.green,
            child: const Text('Continuar'),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
          )
        ],
      ),
    );
  }

  Stack buildCorpo() {
    return Stack(alignment: AlignmentDirectional.centerStart, children: [
      Image.asset('Assets/images/corpoHumano.png'),
      Positioned(
          right: 138, top: 75, child: AddTodoButton(number: '1', numberId: '')),
      Positioned(
          right: 138,
          top: 130,
          child: AddTodoButton(number: '2', numberId: '')),
      Positioned(
          right: 138,
          top: 177,
          child: AddTodoButton(number: '3', numberId: '')),
      Positioned(
          right: 138,
          top: 211,
          child: AddTodoButton(number: '4', numberId: '')),
      Positioned(
          right: 138,
          top: 247,
          child: AddTodoButton(number: '5', numberId: '')),
      Positioned(
          right: 79, top: 90, child: AddTodoButton(number: '6', numberId: '1')),
      Positioned(
          right: 200,
          top: 90,
          child: AddTodoButton(number: '6', numberId: '2')),
      /* Positioned(
              right: 5,
              top: 90,
              child: AddTodoButtonDouble(
                numberId: '',
                number: '8',
              ))*/
    ]);
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