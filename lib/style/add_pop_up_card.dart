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
  const AddTodoButton(this.number);

  @override
  State<AddTodoButton> createState() => _AddTodoButtonState();
}

class _AddTodoButtonState extends State<AddTodoButton> {
  @override
  Widget build(BuildContext context) {
    //Color? newButtunColor = Provider.of<newColorForCard>(context).color;
    //  bool flag = false;
    return Padding(
        padding: const EdgeInsets.all(8.0),
        child: GestureDetector(
          onTap: () {
            Navigator.of(context).push(HeroDialogRoute(
                builder: (context) {
                  return AddTodoPopupCard(
                    nome: widget.number,
                  );
                },
                settings: RouteSettings(arguments: null, name: null)));
          },
          child: Hero(
            tag: _heroAddTodo + '${widget.number}',
            createRectTween: (begin, end) {
              return CustomRectTween(begin: begin!, end: end!);
            },
            child: Material(
              color: // Provider.of<newColorForCard>(context).colortr
                  true ? Colors.grey : Colors.pink,
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
        ));
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
  const AddTodoPopupCard({required this.nome});

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
                      const Color.fromARGB(255, 11, 103, 14), context),
                  SizedBox(
                    height: 5,
                  ),
                  MarcarRegiao('2', 'Leve            ',
                      Color.fromARGB(185, 126, 206, 21), context),
                  SizedBox(
                    height: 5,
                  ),
                  MarcarRegiao('3', 'Moderada  ',
                      Color.fromARGB(255, 247, 239, 15), context),
                  SizedBox(
                    height: 5,
                  ),
                  MarcarRegiao('4', 'Forte           ',
                      Color.fromARGB(184, 230, 100, 8), context),
                  SizedBox(
                    height: 5,
                  ),
                  MarcarRegiao('5', 'Muito Forte',
                      Color.fromARGB(184, 215, 26, 16), context),
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
      String num, String nome, Color color, BuildContext context) {
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
        //   Provider.of<newColorForCard>(context, listen: false).changeColor(false);
        Navigator.of(context).pop();
        //Mandar para o servidor
      },
    );
  }
}

class newColorForCard extends ChangeNotifier {
  bool color = true;
  // Color get _color =>
  // //newColorForCard(this.color);

  void changeColor(bool newColor) {
    color = newColor;
    notifyListeners();
  }
}
