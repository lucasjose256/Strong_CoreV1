import 'package:flutter/material.dart';
import 'package:strong_core/MODELS/info_semanas.dart';

final LISTASEMANAS = [
  InfoSemanas(Colors.orange, 'SEMANA 1', botao),
  InfoSemanas(Color.fromARGB(255, 68, 181, 206), 'SEMANA 2', botao),
  InfoSemanas(Color.fromARGB(255, 157, 98, 199), 'SEMANA 3', botao),
  InfoSemanas(Color.fromARGB(255, 98, 199, 157), 'SEMANA 4', botao),
  InfoSemanas(Color.fromARGB(255, 201, 94, 196), 'SEMANA 5', botao),
  InfoSemanas(Color.fromARGB(255, 199, 98, 98), 'SEMANA 6', botao),
  InfoSemanas(Color.fromARGB(255, 202, 193, 62), 'SEMANA 7', botao),
];

MaterialButton botao = MaterialButton(onPressed: () {});
