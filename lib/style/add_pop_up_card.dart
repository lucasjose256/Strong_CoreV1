// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:strong_core/style/custom_rect_tween.dart';

import 'hero_dialog_route.dart';

/// {@template add_todo_button}
/// Button to add a new [Todo].
///
/// Opens a [HeroDialogRoute] of [_AddTodoPopupCard].
///
/// Uses a [Hero] with tag [_heroAddTodo].
/// {@endtemplate}
class AddTodoButton extends StatefulWidget {
  /// {@macro add_todo_button}
  ///

  final String? number;
  late Color? newColor = Colors.yellow;
  String numberId = '';
  AddTodoButton({this.number, this.newColor, required this.numberId});

  @override
  State<AddTodoButton> createState() => _AddTodoButtonState();
}

class _AddTodoButtonState extends State<AddTodoButton> {
  @override
  Widget build(BuildContext context) {
    // widget.newColor=Navigator.of(context).push();
    //Color? newButtunColor = Provider.of<newColorForCard>(context).color;
    //  bool flag = false;

    return ChangeNotifierProvider(
      create: (context) => newColorForCard(),
      child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: GestureDetector(
            onTap: () async {
              Color tempColor = await Navigator.push(
                  context,
                  HeroDialogRoute(
                      builder: (context) => AddTodoPopupCard(
                            nome: widget.number! + widget.numberId!,
                          ),
                      settings: RouteSettings(arguments: null, name: null)));
              // settings: RouteSettings(arguments: null, name: null)

              setState(() {
                widget.newColor = tempColor;
              });
            },
            child: Hero(
              tag: _heroAddTodo + '${widget.number}' + '${widget.numberId}',
              createRectTween: (begin, end) {
                return CustomRectTween(begin: begin!, end: end!);
              },
              child: Material(
                color: widget.newColor == null
                    ? Colors.grey
                    : widget
                        .newColor, //Provider.of<newColorForCard>(context)._color,
                elevation: 2,
                shape: CircleBorder(),
                child: Padding(
                  padding: const EdgeInsets.all(7.0),
                  child: Text(
                    widget.number!,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 22,
                    ),
                  ),
                ),
              ),
            ),
          )),
    );
  }
}

/// Tag-value used for the add todo popup button.
const String _heroAddTodo = 'add-todo-hero';

/// {@template add_todo_popup_card}
/// Popup card to add a new [Todo]. Should be used in conjuction with
/// [HeroDialogRoute] to achieve the popup effect.
///
/// Uses a [Hero] with tag [_heroAddTodo].
/// {@endtemplate}
class AddTodoPopupCard extends StatelessWidget {
  /// {@macro add_todo_popup_card}
  final String? nome;
  //final Color? tempColor;
  AddTodoPopupCard({required this.nome});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(32.0),
        child: Hero(
          tag: _heroAddTodo + '$nome',
          createRectTween: (begin, end) {
            return CustomRectTween(begin: begin!, end: end!);
          },
          child: Material(
            color: Color.fromRGBO(181, 136, 136, 1),
            elevation: 2,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(32)),
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(mainAxisSize: MainAxisSize.min, children: [
                  const Text('Selecione o grau de dor nessa região'),
                  const Divider(
                    color: Colors.white,
                    thickness: 0.2,
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  MarcarRegiao('1', 'Nenhuma   ',
                      Color.fromARGB(255, 31, 106, 34), context),
                  SizedBox(
                    height: 5,
                  ),
                  MarcarRegiao('2', 'Leve            ',
                      Color.fromARGB(255, 99, 179, 46), context),
                  SizedBox(
                    height: 5,
                  ),
                  MarcarRegiao('3', 'Moderada  ',
                      Color.fromARGB(255, 224, 220, 80), context),
                  SizedBox(
                    height: 5,
                  ),
                  MarcarRegiao('4', 'Forte           ',
                      Color.fromARGB(255, 230, 101, 8), context),
                  SizedBox(
                    height: 5,
                  ),
                  MarcarRegiao('5', 'Muito Forte',
                      Color.fromARGB(222, 238, 39, 29), context),
                  SizedBox(
                    height: 20,
                  ),
                ]),
              ),
            ),
          ),
        ),
      ),
    );
  }

  MaterialButton MarcarRegiao(
      String num, String nome, Color? color, BuildContext context) {
    return MaterialButton(
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          mainAxisSize: MainAxisSize.max,
          //crossAxisAlignment: CrossAxisAlignment.baseline,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CircleAvatar(
              radius: 13,
              backgroundColor: color,
              child: Text(
                num,
                style: TextStyle(color: Colors.white),
              ),
            ),
            SizedBox(
              width: 10,
            ),
            Text(
              nome,
            ),
          ],
        ),
      ),
      onPressed: () {
        /* Provider.of<newColorForCard>(context, listen: false)
            .changeColor(color, true);*/
        //Mandar para o servidor
        Navigator.pop(context, color);
      },
    );
  }
}

class newColorForCard extends ChangeNotifier {
  Color? _color;
  bool b = false;
  Color get color => _color!;
  // //newColorForCard(this.color);

  void changeColor(Color newColor, bool b) {
    this.b = b;
    _color = newColor;
    notifyListeners();
  }
}
