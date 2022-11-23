// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:strong_core/SCREENS/corpo_humano.dart';
import 'package:strong_core/notifier/colors2.dart';
import 'package:strong_core/style/add_pop_up_card.dart';

import 'package:strong_core/style/custom_rect_tween.dart';

import '../notifier/colors.dart';
import '../style/hero_dialog_route.dart';

/// {@template add_todo_button}
/// Button to add a new [Todo].
///
/// Opens a [HeroDialogRoute] of [_AddTodoPopupCard].
///
/// Uses a [Hero] with tag [_heroAddTodo].
/// {@endtemplate}
class BotaoDuplo extends StatefulWidget {
  /// {@macro add_todo_button}
  ///

  BotaoDuplo();

  @override
  State<BotaoDuplo> createState() => _BotaoDuploState();
}

class _BotaoDuploState extends State<BotaoDuplo> {
  @override
  Widget build(BuildContext context) {
    // widget.newColor=Navigator.of(context).push();
    //Color? newButtunColor = Provider.of<newColorForCard>(context).color;
    //  bool flag = false;
    final corProvider = Provider.of<Cor1>(context);
    final cor2Provider = Provider.of<Cor2>(context);
    AddTodoButton ombroDir = AddTodoButton(
      number: '6',
      numberId: 'DIR',
      nomeMembro: 'na região do ombro DIREITO',
    );
    AddTodoButton ombroEsq = AddTodoButton(
      number: '6',
      numberId: 'ESQ',
      nomeMembro: 'na região do ombro ESQUERDO',
    );
    const String _heroAddTodo = 'add-todo-hero';
    Map? temp;
    Color? color;
    return Container(
      // color: Colors.black,
      width: 300,
      height: 60,
      child: Row(
        children: [
          CircleAvatar(
            backgroundColor: Colors.blue,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: GestureDetector(
                onTap: () async {
                  Map temp = await Navigator.push(
                      context,
                      HeroDialogRoute(
                          builder: (context) => AddTodoPopupCard(
                                nome: ombroDir.number! + ombroDir.numberId,
                                nomeMembro: ombroDir.nomeMembro,
                                esqDir: ombroDir.numberId,
                              ),
                          settings: const RouteSettings(
                              arguments: null, name: null)));
                  // settings: RouteSettings(arguments: null, name: null)

                  ombroDir.graudaDor = temp["numero"];
                  corProvider.changeColor(temp["color"]);

                  Map temp2 = await Navigator.push(
                      context,
                      HeroDialogRoute(
                          builder: (context) => AddTodoPopupCard(
                                nome: ombroEsq.number! + ombroEsq.numberId,
                                nomeMembro: ombroEsq.nomeMembro,
                                esqDir: ombroEsq.numberId,
                              ),
                          settings: const RouteSettings(
                              arguments: null, name: null)));

                  ombroEsq.graudaDor = temp2["numero"];
                  cor2Provider.changeColor(temp2["color"]);
                },
                child: Hero(
                  tag: _heroAddTodo + '${ombroDir.number}' + ombroDir.numberId,
                  createRectTween: (begin, end) {
                    return CustomRectTween(begin: begin!, end: end!);
                  },
                  child: Material(
                    color: corProvider.cor ?? Colors.pink, // ?? Colors.grey,
                    elevation: 2,
                    shape: const CircleBorder(),
                    child: Padding(
                      padding: const EdgeInsets.all(7.0),
                      child: ombroDir.number!.length == 2
                          ? Text(
                              ombroDir.number!,
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 15,
                              ),
                            )
                          : Text(
                              ombroDir.number!,
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 22,
                              ),
                            ),
                    ),
                  ),
                )),
          ),
          SizedBox(
            width: 50,
          ),
          /////////////////////////////////////
          /////////////////////////////
          ///
          ///
          ///
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: GestureDetector(
                onTap: () async {
                  Map temp3 = await Navigator.push(
                      context,
                      HeroDialogRoute(
                          builder: (context) => AddTodoPopupCard(
                                nome: ombroEsq.number! + ombroEsq.numberId,
                                nomeMembro: ombroEsq.nomeMembro,
                                esqDir: ombroEsq.numberId,
                              ),
                          settings: const RouteSettings(
                              arguments: null, name: null)));
                  // settings: RouteSettings(arguments: null, name: null)

                  //ombroDir.graudaDor = temp3["numero"];
                  cor2Provider.changeColor(temp3["color"]);
                },
                child: Hero(
                  tag: _heroAddTodo + '${ombroEsq.number}' + ombroEsq.numberId,
                  createRectTween: (begin, end) {
                    return CustomRectTween(begin: begin!, end: end!);
                  },
                  child: Material(
                    color: cor2Provider.cor ?? Colors.pink, // ?? Colors.grey,
                    elevation: 2,
                    shape: const CircleBorder(),
                    child: Padding(
                      padding: const EdgeInsets.all(7.0),
                      child: ombroDir.number!.length == 2
                          ? Text(
                              ombroDir.number!,
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 15,
                              ),
                            )
                          : Text(
                              ombroDir.number!,
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 22,
                              ),
                            ),
                    ),
                  ),
                )),
          ),
        ],
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
      ),
    );
  }
}
