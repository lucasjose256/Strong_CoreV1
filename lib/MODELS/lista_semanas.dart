import 'package:flutter/material.dart';
import 'package:strong_core/MODELS/VideoDIR_ESQ.dart';
import 'package:strong_core/MODELS/VideoScreen.dart';
import 'package:strong_core/MODELS/info_semanas.dart';

final LISTASEMANAS = [
  InfoSemanas(Color.fromARGB(255, 102, 132, 111), 'SEMANA 1', videos, 1),
  InfoSemanas(Color.fromARGB(255, 36, 108, 14), 'SEMANA 2', videos, 2),
  InfoSemanas(Color.fromARGB(255, 109, 173, 41), 'SEMANA 3', videos, 3),
  InfoSemanas(Color.fromARGB(255, 205, 208, 60), 'SEMANA 4', videos, 4),
  InfoSemanas(Color.fromARGB(255, 193, 130, 41), 'SEMANA 5', videos, 5),
  InfoSemanas(Color.fromARGB(255, 183, 82, 82), 'SEMANA 6', videos, 6),
  InfoSemanas(Color.fromARGB(255, 187, 47, 47), 'SEMANA 7', videos, 7),
  InfoSemanas(Color.fromARGB(255, 99, 29, 93), 'SEMANA 8', videos, 8),

  /*
  InfoSemanas(Color.fromARGB(255, 220, 151, 49), 'SEMANA 1', videos, 1),
  InfoSemanas(Color.fromARGB(255, 68, 181, 206), 'SEMANA 2', videos, 2),
  InfoSemanas(Color.fromARGB(255, 157, 98, 199), 'SEMANA 3', videos, 3),
  InfoSemanas(Color.fromARGB(255, 98, 199, 157), 'SEMANA 4', videos, 4),
  InfoSemanas(Color.fromARGB(255, 155, 124, 154), 'SEMANA 5', videos, 5),
  InfoSemanas(Color.fromARGB(255, 199, 98, 98), 'SEMANA 6', videos, 6),
  InfoSemanas(Color.fromARGB(255, 111, 64, 91), 'SEMANA 7', videos, 7),*/
];
List<VideoScreen> videos = [
  VideoScreen(
    nomeSemLado: 'PRANCHA LATERAL',
    nomeExercicioDE: 'PRANCHA LATERAL DIR',
    urlDE: 'Assets/video/SEM1/pranchaESQ.mp4',
    tempo: 5,
    url: 'Assets/video/SEM1/pranchaDIR.mp4', //'Assets/video/prancha.mp4',
    nomeExercicio: 'PRANCHA LATERAL ESQ',
    loop: 3, numSemana: '1',
  ) //Video(20, nomeVideos),
  ,
  VideoScreen(
      numSemana: '1',
      tempo: 1,
      url: 'Assets/video/SEM1/ponte.mp4',
      nomeExercicio: 'PRANCHA DORSAL',
      loop: 2) //Video(20, nomeVideos),
  ,
  VideoScreen(
      isLast: true,
      numSemana: '1',
      tempo: 1,
      url: 'Assets/video/SEM1/pranchaNORM.mp4',
      nomeExercicio: 'PRANCHA VENTRAL',
      loop: 2) //Video(20, nomeVideos),
  ,
  /* VideoScreen(
    isLast: true,
    tempo: 5,
    url: 'Assets/video/SEM1/ponte.mp4',
    nomeExercicio: 'PRANCHA DORSAL',
    loop: 3,
    numSemana: '1',
  ) //Video(20, nomeVideos),
  ,*/
];
List<VideoScreen> videos2 = [
  VideoScreen(
      numSemana: '2',
      nomeSemLado: 'PRANCHA LATERAL',
      nomeExercicioDE: 'PRANCHA DIR',
      urlDE: 'Assets/video/SEM1/pranchaESQ.mp4',
      tempo: 40,
      url: 'Assets/video/SEM1/pranchaDIR.mp4', //'Assets/video/prancha.mp4',
      nomeExercicio: 'PRANCHA ESQ',
      loop: 5) //Video(20, nomeVideos),
  ,
  VideoScreen(
      numSemana: '2',
      tempo: 40,
      url: 'Assets/video/SEM1/pranchaNORM.mp4',
      nomeExercicio: 'PRANCHA VENTRAL',
      loop: 5) //Video(20, nomeVideos),
  ,
  VideoScreen(
      numSemana: '2',
      isLast: true,
      tempo: 40,
      url: 'Assets/video/SEM1/ponte.mp4',
      nomeExercicio: 'PRANCHA DORSAL',
      loop: 5) //Video(20, nomeVideos),
  ,
];

MaterialButton botao = MaterialButton(onPressed: () {});
