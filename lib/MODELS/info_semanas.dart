import 'package:flutter/material.dart';
import 'package:strong_core/MODELS/VideoScreen.dart';
import 'package:strong_core/MODELS/card_expansivel_semana.dart';

class InfoSemanas {
  final Color backGroundColor;
  final String titulo;
  final double height;
  //final Widget checkBox;
  final List<VideoScreen> Conteudo;
  final int numeroSem;
  InfoSemanas(this.backGroundColor, this.titulo, this.Conteudo, this.numeroSem,
      this.height);
}
