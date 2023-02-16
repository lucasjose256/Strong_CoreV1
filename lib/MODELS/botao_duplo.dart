// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:strong_core/SCREENS/corpo_humano.dart';
import 'package:strong_core/provider/colors2.dart';
import 'package:strong_core/style/add_pop_up_card.dart';

import 'package:strong_core/style/custom_rect_tween.dart';

import '../provider/colors.dart';
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

  final double? buttunDistance;
  final String? numberButtun;
  final String? phraseCard;
  late String painDegreeRight;
  late String painDegreeleft;
  Color? colorRight;
  Color? colorleft;

  BotaoDuplo({
    this.colorRight,
    this.colorleft,
    this.buttunDistance,
    this.numberButtun,
    this.phraseCard,
  });

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
    AddTodoButton membroDir = AddTodoButton(
      corSemanaAnterior: widget.colorRight,
      number: widget.numberButtun,
      numberId: 'DIR',
      nomeMembro: '${widget.phraseCard} DIREITO',
    );
    AddTodoButton membroEsq = AddTodoButton(
      corSemanaAnterior: widget.colorleft,
      number: widget.numberButtun,
      numberId: 'ESQ',
      nomeMembro: '${widget.phraseCard} ESQUERDO',
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
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: GestureDetector(
                onTap: () async {
                  Map temp = await Navigator.push(
                      context,
                      HeroDialogRoute(
                          builder: (context) => AddTodoPopupCard(
                                nome: membroEsq.number! + membroEsq.numberId,
                                nomeMembro: membroEsq.nomeMembro,
                                esqDir: membroEsq.numberId,
                              ),
                          settings: const RouteSettings(
                              arguments: null, name: null)));
                  // settings: RouteSettings(arguments: null, name: null)

                  corProvider.changeColor(temp["color"]);
                  membroEsq.graudaDor = temp["numero"];
                  widget.painDegreeleft = membroEsq.graudaDor;
                  if (cor2Provider.cor == null && widget.colorRight == null) {
                    Map temp2 = await Navigator.push(
                        context,
                        HeroDialogRoute(
                            builder: (context) => AddTodoPopupCard(
                                  nome: membroDir.number! + membroDir.numberId,
                                  nomeMembro: membroDir.nomeMembro,
                                  esqDir: membroDir.numberId,
                                ),
                            settings: const RouteSettings(
                                arguments: null, name: null)));

                    membroDir.graudaDor = temp2["numero"];
                    widget.painDegreeRight = temp2["numero"];
                    cor2Provider.changeColor(temp2["color"]);
                  }
                },
                child: Hero(
                  tag:
                      _heroAddTodo + '${membroEsq.number}' + membroEsq.numberId,
                  createRectTween: (begin, end) {
                    return CustomRectTween(begin: begin!, end: end!);
                  },
                  child: Material(
                    color: corProvider.cor ??
                        widget.colorleft ??
                        Colors.grey, // ?? Colors.grey,
                    elevation: 2,
                    shape: const CircleBorder(),
                    child: Padding(
                      padding: const EdgeInsets.all(7.0),
                      child: membroEsq.number!.length == 2
                          ? Text(
                              membroEsq.number!,
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 15,
                              ),
                            )
                          : Text(
                              membroDir.number!,
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
            width: widget.buttunDistance,
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
                                nome: membroDir.number! + membroDir.numberId,
                                nomeMembro: membroDir.nomeMembro,
                                esqDir: membroDir.numberId,
                              ),
                          settings: const RouteSettings(
                              arguments: null, name: null)));
                  // settings: RouteSettings(arguments: null, name: null)

                  membroDir.graudaDor = temp3["numero"];
                  widget.painDegreeRight = temp3["numero"];
                  cor2Provider.changeColor(temp3["color"]);

                  if (corProvider.cor == null && widget.colorleft == null) {
                    Map temp4 = await Navigator.push(
                        context,
                        HeroDialogRoute(
                            builder: (context) => AddTodoPopupCard(
                                  nome: membroEsq.number! + membroEsq.numberId,
                                  nomeMembro: membroEsq.nomeMembro,
                                  esqDir: membroEsq.numberId,
                                ),
                            settings: const RouteSettings(
                                arguments: null, name: null))) as Map;

                    corProvider.changeColor(temp4["color"]);
                    widget.painDegreeleft = temp4["numero"];
                    membroEsq.graudaDor = temp4["numero"];
                  }
                },
                child: Hero(
                  tag:
                      _heroAddTodo + '${membroDir.number}' + membroDir.numberId,
                  createRectTween: (begin, end) {
                    return CustomRectTween(begin: begin!, end: end!);
                  },
                  child: Material(
                    color: cor2Provider.cor ??
                        widget.colorRight ??
                        Colors.grey, // ?? Colors.grey,
                    elevation: 2,
                    shape: const CircleBorder(),
                    child: Padding(
                      padding: const EdgeInsets.all(7.0),
                      child: membroEsq.number!.length == 2
                          ? Text(
                              membroEsq.number!,
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 15,
                              ),
                            )
                          : Text(
                              membroEsq.number!,
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
