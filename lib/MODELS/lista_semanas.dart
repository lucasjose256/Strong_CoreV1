import 'package:flutter/material.dart';
import 'package:strong_core/MODELS/VideoDIR_ESQ.dart';
import 'package:strong_core/MODELS/VideoScreen.dart';
import 'package:strong_core/MODELS/info_semanas.dart';

final LISTASEMANAS = [
  InfoSemanas(Color.fromARGB(255, 102, 132, 111), 'SEMANA 1', videos, 1),
  InfoSemanas(Color.fromARGB(255, 36, 108, 14), 'SEMANA 2', videos2, 2),
  InfoSemanas(Color.fromARGB(255, 109, 173, 41), 'SEMANA 3', videos3, 3),
  InfoSemanas(Color.fromARGB(255, 205, 208, 60), 'SEMANA 4', videos4, 4),
  InfoSemanas(Color.fromARGB(255, 193, 130, 41), 'SEMANA 5', videos5, 5),
  InfoSemanas(Color.fromARGB(255, 183, 82, 82), 'SEMANA 6', videos6, 6),
  InfoSemanas(Color.fromARGB(255, 187, 47, 47), 'SEMANA 7', videos7, 7),
  InfoSemanas(Color.fromARGB(255, 99, 29, 93), 'SEMANA 8', videos, 8),
  InfoSemanas(Color.fromARGB(255, 87, 26, 54), 'SEMANA 9', videos, 9),

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
  /*VideoScreen(
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
  ,*/
  VideoScreen(
      isLast: true,
      numSemana: '1',
      tempo: 1,
      url: 'Assets/video/SEM1/pranchaNORM.mp4',
      nomeExercicio: 'PRANCHA VENTRAL',
      loop: 1) //Video(20, nomeVideos),
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
/////////////////////////////////////
List<VideoScreen> videos2 = [
  VideoScreen(
    tempo: 40,
    url: 'Assets/video/SEM2/ponte_dorsal_40.mp4', //'Assets/video/prancha.mp4',
    nomeExercicio: 'PRANCHA DORSAL',
    loop: 2, numSemana: '2',
  ) //Video(20, nomeVideos),
  ,
  VideoScreen(
      numSemana: '2',
      tempo: 2,
      url: 'Assets/video/SEM2/pranchaS2.mp4',
      nomeExercicio: 'PRANCHA VENTRAL',
      loop: 2) //Video(20, nomeVideos),
  ,
  VideoScreen(
      nomeExercicioDE: 'PRANCHA LATERAL DIREITA',
      urlDE: 'Assets/video/SEM2/pranchaD_40.mp4',
      numSemana: '2',
      nomeSemLado: 'PRANCHA LATERAL',
      isLast: true,
      tempo: 40,
      url: 'Assets/video/SEM2/pranchaE_40.mp4',
      nomeExercicio: 'PRANCHA LATERAL ESQUERDA',
      loop: 2) //Video(20, nomeVideos),
  ,
];
//////////////////////////////
List<VideoScreen> videos3 = [
  VideoScreen(
      urlDE: 'Assets/video/SEM3/prancha_com_elevacao_da_perna_D_30.mp4',
      nomeExercicioDE: 'PRANCHA COM ELEVAÇÃO DA PERNA DIREITA',
      nomeSemLado: 'PRANCHA COM ELEVAÇÃO DA PERNA',
      numSemana: '2',
      tempo: 2,
      url: 'Assets/video/SEM3/prancha_com_elevacao_da_perna_E_30.mp4',
      nomeExercicio: 'PRANCHA COM ELEVAÇÃO DA PERNA ESQUERDA',
      loop: 2) //Video(20, nomeVideos),
  ,
  VideoScreen(
    tempo: 5,
    url:
        'Assets/video/SEM3/ponte_dorsal_com_elevacao_dos_calcanhares.mp4', //'Assets/video/prancha.mp4',
    nomeExercicio: 'PRANCHA DORSAL COM ELEVAÇÃO DOS CALCANHARES',
    loop: 2, numSemana: '2',
  ) //Video(20, nomeVideos),
  ,
  VideoScreen(
      isLast: true,
      urlDE: 'Assets/video/SEM3/prancha_lateral_elevacao_do_braco_D_30.mp4',
      nomeExercicioDE: 'PRANCHA COM ELEVAÇÃO DO BRAÇO DIREITO',
      nomeSemLado: 'PRANCHA COM ELEVAÇÃO DO BRAÇO',
      numSemana: '2',
      tempo: 5,
      url: 'Assets/video/SEM3/prancha_lateral_elevacao_do_braco_E_30.mp4',
      nomeExercicio: 'PRANCHA COM ELEVAÇÃO DO BRAÇO ESQUERDO',
      loop: 2) //Video(20, nomeVideos),
  ,
];
///////////////////////////////////////
/////VIDEO 4
List<VideoScreen> videos4 = [
  VideoScreen(
      urlDE: 'Assets/video/SEM4/prancha_elevacao_da_perna_D_40_.mp4',
      nomeExercicioDE: 'PRANCHA COM ELEVAÇÃO DA PERNA DIREITA',
      nomeSemLado: 'PRANCHA COM ELEVAÇÃO DA PERNA',
      numSemana: '2',
      tempo: 2,
      url: 'Assets/video/SEM4/prancha_elevacao_da_perna_E_40.mp4',
      nomeExercicio: 'PRANCHA COM ELEVAÇÃO DA PERNA ESQUERDA',
      loop: 2) //Video(20, nomeVideos),
  ,
  VideoScreen(
    //TA ERRADO O EXERCICIO
    tempo: 5,
    url:
        'Assets/video/SEM4/prancha_dorsal_c_elevacao_de_calcanhar.mp4', //'Assets/video/prancha.mp4',
    nomeExercicio: 'PRANCHA DORSAL COM ELEVAÇÃO DO calcanhar',
    loop: 2, numSemana: '2',
  ) //Video(20, nomeVideos),
  ,
  VideoScreen(
      isLast: true,
      urlDE: 'Assets/video/SEM4/prancha_latera_elevacao_do_bracoD40.mp4',
      nomeExercicioDE: 'PRANCHA COM ELEVAÇÃO DO BRAÇO DIREITO',
      nomeSemLado: 'PRANCHA COM ELEVAÇÃO DA PERNA',
      numSemana: '2',
      tempo: 2,
      url: 'Assets/video/SEM4/prancha_lateral_elevacao_do_braco_E_40.mp4',
      nomeExercicio: 'PRANCHA COM ELEVAÇÃO DO BRAÇO ESQUERDO',
      loop: 2) //Video(20, nomeVideos),
  ,
];
//////////////////////////////////////////////////
///VIDEOS 5
List<VideoScreen> videos5 = [
  VideoScreen(
      urlDE: 'Assets/video/SEM5/prancha_superman_30_BD.mp4',
      nomeExercicioDE: 'PRANCHA SUPERMAN BRAÇO DIREITO',
      nomeSemLado: 'PRANCHA SUPERMAN',
      numSemana: '5',
      tempo: 7,
      url: 'Assets/video/SEM5/prancha_superman_30_BE.mp4',
      nomeExercicio: 'PRANCHA SUPERMAN BRAÇO ESQUERDO',
      loop: 2) //Video(20, nomeVideos),
  ,
  VideoScreen(
      numSemana: '5',
      tempo: 2,
      url: 'Assets/video/SEM5/elevacao_dorsal_paraquedista_30.mp4',
      nomeExercicio: 'PRANCHA PARAQUEDISTA',
      loop: 2) //Video(20, nomeVideos),
  ,
  VideoScreen(
    isLast: true,
    tempo: 5,
    url:
        'Assets/video/SEM5/prancha_isometrica_canoa_30.mp4', //'Assets/video/prancha.mp4',
    nomeExercicio: 'PRANCHA CANIVETE',
    loop: 2, numSemana: '5',
  ) //Video(20, nomeVideos),
  ,
];
//////////////////////////////////
///////////// VIDEOS 6

List<VideoScreen> videos6 = [
  VideoScreen(
      urlDE: 'Assets/video/SEM6/S6_prancha_superman_D_40.mp4',
      nomeExercicioDE: 'PRANCHA SUPERMAN BRAÇO DIREITO',
      nomeSemLado: 'PRANCHA SUPERMAN',
      numSemana: '5',
      tempo: 7,
      url: 'Assets/video/SEM6/S6_prancha_superman_E_40.mp4',
      nomeExercicio: 'PRANCHA SUPERMAN BRAÇO ESQUERDO',
      loop: 2) //Video(20, nomeVideos),
  ,
  VideoScreen(
      numSemana: '5',
      tempo: 2,
      url: 'Assets/video/SEM6/S6_Elevacao_dorsal_paraquedista_40.mp4',
      nomeExercicio: 'PRANCHA PARAQUEDISTA',
      loop: 2) //Video(20, nomeVideos),
  ,
  VideoScreen(
    isLast: true,
    tempo: 5,
    url:
        'Assets/video/SEM6/S6_prancha_isometrica_canoa.mp4', //'Assets/video/prancha.mp4',
    nomeExercicio: 'PRANCHA CANIVETE',
    loop: 2, numSemana: '5',
  ) //Video(20, nomeVideos),
  ,
];
//////////////////////
///VIDEOS 7
List<VideoScreen> videos7 = [
  VideoScreen(
      urlDE:
          'Assets/video/SEM7/S7_prancha_alta_c_elevacao_de_braco_e_pernaD_contralateral.mp4',
      nomeExercicioDE: 'PRANCHA ALTA ELEV BRAÇO E PERNA DIR',
      nomeSemLado: 'PRANCHA COM ELEVAÇÃO DA PERNA',
      numSemana: '2',
      tempo: 2,
      url:
          'Assets/video/SEM7/S7_prancha_alta_c_elevacao_de_braco_e_pernaE_contralateral.mp4',
      nomeExercicio: 'PRANCHA ALTA ELEV BRAÇO E PERNA ESQ',
      loop: 2) //Video(20, nomeVideos),
  ,
  VideoScreen(
      urlDE: 'Assets/video/SEM7/S7_ponte_c_elevacao_da_perna_D_30.mp4',
      nomeExercicioDE: 'PPNTE C/ELEVAÇÃO DA PERNA DIR',
      nomeSemLado: 'PRANCHA COM ELEVAÇÃO DA PERNA',
      numSemana: '2',
      tempo: 2,
      url: 'Assets/video/SEM7/S7_ponte_elevacao_da_perna_E_30.mp4',
      nomeExercicio: 'PONTE C/ELEVAÇÃO DA PERNA ESQ',
      loop: 2) //Video(20, nomeVideos),
  ,
  VideoScreen(
      urlDE:
          'Assets/video/SEM7/S7_prancha_lateral_com_elevacao_do_braco_e_pernaD.mp4',
      nomeExercicioDE: 'PRANCHA LATERAL C/ELEVAÇÃO DO BRAÇO DIR',
      nomeSemLado: 'PRANCHA LATERAL COM ELEVAÇÃO DO BRAÇO E PERNA',
      numSemana: '2',
      tempo: 2,
      url:
          'Assets/video/SEM7/S7_prancha_lateral_com_elevacao_do_braco_e_pernaE.mp4',
      nomeExercicio: 'PRANCHA LATERAL C/ELEVAÇÃO DO BRAÇO ESQ',
      loop: 2) //Video(20, nomeVideos),
  ,
];
