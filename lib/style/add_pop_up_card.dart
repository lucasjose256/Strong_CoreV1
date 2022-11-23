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

  final String? number; //number o fbuttun
  Color? newColor = Colors.grey;
  String numberId = ''; //if the buttun has a duplicate
  String graudaDor = '';
  final String nomeMembro;
  final onChange;
  // ignore: avoid_init_to_null
  AddTodoButton({
    this.onChange,
    this.number,
    required this.nomeMembro,
    required this.numberId,
  });

  @override
  State<AddTodoButton> createState() => _AddTodoButtonState();
}

class _AddTodoButtonState extends State<AddTodoButton> {
  @override
  Widget build(BuildContext context) {
    // widget.newColor=Navigator.of(context).push();
    //Color? newButtunColor = Provider.of<newColorForCard>(context).color;
    //  bool flag = false;

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
          onTap: () async {
            Map temp = await Navigator.push(
                context,
                HeroDialogRoute(
                    builder: (context) => AddTodoPopupCard(
                          nome: widget.number! + widget.numberId,
                          nomeMembro: widget.nomeMembro,
                          esqDir: widget.numberId,
                        ),
                    settings:
                        const RouteSettings(arguments: null, name: null)));
            // settings: RouteSettings(arguments: null, name: null)

            widget.graudaDor = temp["numero"];
            setState(() {
              //    widget.newColor = Colors.purple;
              // widget.onChange(temp["color"]);
              widget.newColor = temp["color"];
            });
          },
          child: Hero(
            tag: _heroAddTodo + '${widget.number}' + widget.numberId,
            createRectTween: (begin, end) {
              return CustomRectTween(begin: begin!, end: end!);
            },
            child: Material(
              color: widget.newColor, // ?? Colors.grey,
              elevation: 2,
              shape: const CircleBorder(),
              child: Padding(
                padding: const EdgeInsets.all(7.0),
                child: widget.number!.length == 2
                    ? Text(
                        widget.number!,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                        ),
                      )
                    : Text(
                        widget.number!,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 22,
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
  final String? nomeMembro;
  final String? esqDir;
  //final Color? tempColor;
  AddTodoPopupCard({required this.nome, this.nomeMembro, this.esqDir});

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
            color: const Color.fromRGBO(181, 136, 136, 1),
            elevation: 2,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(32)),
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(mainAxisSize: MainAxisSize.min, children: [
                  FittedBox(
                      fit: BoxFit.fill,
                      child: Container(
                        width: 300,
                        height: 50,
                        child: Text(
                          'Selecione o grau de dor ${nomeMembro}',
                          style: TextStyle(fontSize: 20),
                        ),
                      )),
                  const Divider(
                    color: Color.fromARGB(255, 0, 0, 0),
                    thickness: 0.2,
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  MarcarRegiao('1', 'Nenhuma   ',
                      const Color.fromARGB(255, 31, 106, 34), context),
                  const SizedBox(
                    height: 5,
                  ),
                  MarcarRegiao('2', 'Leve            ',
                      const Color.fromARGB(255, 99, 179, 46), context),
                  const SizedBox(
                    height: 5,
                  ),
                  MarcarRegiao('3', 'Moderada  ',
                      const Color.fromARGB(255, 224, 220, 80), context),
                  const SizedBox(
                    height: 5,
                  ),
                  MarcarRegiao('4', 'Forte           ',
                      const Color.fromARGB(255, 230, 101, 8), context),
                  const SizedBox(
                    height: 5,
                  ),
                  MarcarRegiao('5', 'Muito Forte',
                      const Color.fromARGB(222, 238, 39, 29), context),
                  const SizedBox(
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
      String numero, String nome, Color? color, BuildContext context) {
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
                numero,
                style: const TextStyle(color: Colors.white),
              ),
            ),
            const SizedBox(
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

        Navigator.pop(context, {"color": color, "numero": numero});
      },
    );
  }
}

class newColorForCard extends ChangeNotifier {
  Color? _color;
  bool b = false;
  Color get color => _color!;
  // //newColorForCard(this.color);

}
