import 'package:flutter/material.dart';
import 'package:strong_core/MODELS/VideoDIR_ESQ.dart';
import 'package:strong_core/MODELS/VideoScreen.dart';
import 'package:strong_core/MODELS/info_semanas.dart';

final LISTASEMANAS = [
  InfoSemanas(Color.fromARGB(255, 220, 151, 49), 'SEMANA 1', videos, 1),
  InfoSemanas(Color.fromARGB(255, 68, 181, 206), 'SEMANA 2', videos, 2),
  InfoSemanas(Color.fromARGB(255, 157, 98, 199), 'SEMANA 3', videos, 3),
  InfoSemanas(Color.fromARGB(255, 98, 199, 157), 'SEMANA 4', videos, 4),
  InfoSemanas(Color.fromARGB(255, 155, 124, 154), 'SEMANA 5', videos, 5),
  InfoSemanas(Color.fromARGB(255, 199, 98, 98), 'SEMANA 6', videos, 6),
  InfoSemanas(Color.fromARGB(255, 248, 0, 140), 'SEMANA 7', videos, 7),
];
List<VideoScreen> videos = [
  /*VideoScreen(
      nomeExercicioDE: 'PRANCHA DIR',
      urlDE: 'Assets/video/pranchaESQ.mp4',
      tempo: 1,
      url: 'Assets/video/pranchaDIR.mp4', //'Assets/video/prancha.mp4',
      nomeExercicio: 'PRANCHA ESQ',
      loop: 2) //Video(20, nomeVideos),
  ,*/
  /*VideoDirEsq(
      tempo: 5, url: 'Assets/video/ponte.mp4', nomeExercicio: 'PONTE', loop: 3),*/
  VideoScreen(
      tempo: 2,
      url: 'Assets/video/pranchaESQ.mp4',
      nomeExercicio: 'PRANCHA ESQ',
      loop: 2) //Video(20, nomeVideos),
  ,
  VideoScreen(
      tempo: 2,
      url: 'Assets/video/pranchaNORM.mp4',
      nomeExercicio: 'PRANCHA',
      loop: 2) //Video(20, nomeVideos),
  ,
  VideoScreen(
      tempo: 1,
      url: 'Assets/video/ponte.mp4',
      nomeExercicio: 'PONTE',
      loop: 1) //Video(20, nomeVideos),
  ,
];

MaterialButton botao = MaterialButton(onPressed: () {});
