import 'package:flutter/material.dart';
import 'package:strong_core/MODELS/VideoDIR_ESQ.dart';
import 'package:strong_core/MODELS/VideoScreen.dart';
import 'package:strong_core/MODELS/info_semanas.dart';

final LISTASEMANAS = [
  InfoSemanas(Color.fromARGB(255, 102, 132, 111), 'SEMANA 1', videos1, 1),
  InfoSemanas(Color.fromARGB(255, 36, 108, 14), 'SEMANA 2', videos2, 2),
  InfoSemanas(Color.fromARGB(255, 109, 173, 41), 'SEMANA 3', videos3, 3),
  InfoSemanas(Color.fromARGB(255, 205, 208, 60), 'SEMANA 4', videos4, 4),
  InfoSemanas(Color.fromARGB(255, 193, 130, 41), 'SEMANA 5', videos5, 5),
  InfoSemanas(Color.fromARGB(255, 183, 82, 82), 'SEMANA 6', videos6, 6),
  InfoSemanas(Color.fromARGB(255, 187, 47, 47), 'SEMANA 7', videos7, 7),
  InfoSemanas(Color.fromARGB(255, 99, 29, 93), 'SEMANA 8', videos8, 8),
  InfoSemanas(Color.fromARGB(255, 87, 26, 54), 'SEMANA 9', videos9, 9),

  /*
  InfoSemanas(Color.fromARGB(255, 220, 151, 49), 'SEMANA 1', videos, 1),
  InfoSemanas(Color.fromARGB(255, 68, 181, 206), 'SEMANA 2', videos, 2),
  InfoSemanas(Color.fromARGB(255, 157, 98, 199), 'SEMANA 3', videos, 3),
  InfoSemanas(Color.fromARGB(255, 98, 199, 157), 'SEMANA 4', videos, 4),
  InfoSemanas(Color.fromARGB(255, 155, 124, 154), 'SEMANA 5', videos, 5),
  InfoSemanas(Color.fromARGB(255, 199, 98, 98), 'SEMANA 6', videos, 6),
  InfoSemanas(Color.fromARGB(255, 111, 64, 91), 'SEMANA 7', videos, 7),*/
];
List<VideoScreen> videos1 = [
  VideoScreen(
      numSemana: '1',
      tempo: 5,
      url: 'Assets/video/SEM1/pranchaNORM.mp4',
      nomeExercicio: 'PRANCHA VENTRAL',
      loop: 3) //Video(20, nomeVideos),
  ,
  VideoScreen(
      numSemana: '1',
      tempo: 1,
      url: 'Assets/video/SEM1/ponte.mp4',
      nomeExercicio: 'PRANCHA DORSAL',
      loop: 3) //Video(20, nomeVideos),
  ,
  VideoScreen(
      isLast: true,
      //ValueKey('sem2ex3'),
      nomeExercicioDE: 'PRANCHA LATERAL DIREITA',
      urlDE: 'Assets/video/SEM2/pranchaD_40.mp4',
      numSemana: '1',
      nomeSemLado: 'PRANCHA LATERAL',
      tempo: 10,
      url: 'Assets/video/SEM2/pranchaE_40.mp4',
      nomeExercicio: 'PRANCHA LATERAL ESQUERDA',
      loop: 3) //Video(20, nomeVideos),
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
      numSemana: '2',
      tempo: 1,
      url: 'Assets/video/SEM2/pranchaS2.mp4',
      nomeExercicio: 'PRANCHA VENTRAL',
      loop: 5),
  VideoScreen(
    tempo: 1,
    url: 'Assets/video/SEM2/ponte_dorsal_40.mp4',
    nomeExercicio: 'PRANCHA DORSAL',
    loop: 5,
    numSemana: '2',
  ),
  VideoScreen(
      nomeExercicioDE: 'PRANCHA LATERAL DIREITA',
      urlDE: 'Assets/video/SEM2/pranchaD_40.mp4',
      numSemana: '2',
      nomeSemLado: 'PRANCHA LATERAL',
      isLast: true,
      tempo: 3,
      url: 'Assets/video/SEM2/pranchaE_40.mp4',
      nomeExercicio: 'PRANCHA LATERAL ESQUERDA',
      loop: 5) //Video(20, nomeVideos),
  ,
];
//////////////////////////////
List<VideoScreen> videos3 = [
  VideoScreen(
      //ValueKey('sem3ex1'),
      urlDE: 'Assets/video/SEM3/prancha_com_elevacao_da_perna_D_30.mp4',
      nomeExercicioDE: 'PRANCHA COM ELEVAÇÃO DA PERNA DIREITA',
      nomeSemLado: 'PRANCHA COM ELEVAÇÃO DA PERNA',
      numSemana: '3',
      tempo: 2,
      url: 'Assets/video/SEM3/prancha_com_elevacao_da_perna_E_30.mp4',
      nomeExercicio: 'PRANCHA COM ELEVAÇÃO DA PERNA ESQUERDA',
      loop: 2) //Video(20, nomeVideos),
  ,
  VideoScreen(
    //  ValueKey('sem3ex2'),
    tempo: 5,
    url:
        'Assets/video/SEM3/ponte_dorsal_com_elevacao_dos_calcanhares.mp4', //'Assets/video/prancha.mp4',
    nomeExercicio: 'PRANCHA DORSAL COM ELEVAÇÃO DOS CALCANHARES',
    loop: 2, numSemana: '3',
  ) //Video(20, nomeVideos),
  ,
  VideoScreen(
      //ValueKey('sem3ex3'),
      isLast: true,
      urlDE: 'Assets/video/SEM3/prancha_lateral_elevacao_do_braco_D_30.mp4',
      nomeExercicioDE: 'PRANCHA COM ELEVAÇÃO DO BRAÇO DIREITO',
      nomeSemLado: 'PRANCHA COM ELEVAÇÃO DO BRAÇO',
      numSemana: '3',
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
      //ValueKey('sem4ex1'),
      urlDE: 'Assets/video/SEM4/prancha_elevacao_da_perna_D_40_.mp4',
      nomeExercicioDE: 'PRANCHA COM ELEVAÇÃO DA PERNA DIREITA',
      nomeSemLado: 'PRANCHA COM ELEVAÇÃO DA PERNA',
      numSemana: '4',
      tempo: 2,
      url: 'Assets/video/SEM4/prancha_elevacao_da_perna_E_40.mp4',
      nomeExercicio: 'PRANCHA COM ELEVAÇÃO DA PERNA ESQUERDA',
      loop: 2) //Video(20, nomeVideos),
  ,
  VideoScreen(
    // ValueKey('sem4ex2'),
    //TA ERRADO O EXERCICIO
    tempo: 5,
    url:
        'Assets/video/SEM4/prancha_dorsal_c_elevacao_de_calcanhar.mp4', //'Assets/video/prancha.mp4',
    nomeExercicio: 'PRANCHA DORSAL COM ELEVAÇÃO DO calcanhar',
    loop: 2, numSemana: '4',
  ) //Video(20, nomeVideos),
  ,
  VideoScreen(
      //ValueKey('sem4ex3'),
      isLast: true,
      urlDE: 'Assets/video/SEM4/prancha_latera_elevacao_do_bracoD40.mp4',
      nomeExercicioDE: 'PRANCHA COM ELEVAÇÃO DO BRAÇO DIREITO',
      nomeSemLado: 'PRANCHA COM ELEVAÇÃO DA PERNA',
      numSemana: '4',
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
      //ValueKey('sem5ex1'),
      urlDE: 'Assets/video/SEM5/prancha_superman_30_BD.mp4',
      nomeExercicioDE: 'PRANCHA SUPERMAN LADO DIREITO',
      nomeSemLado: 'PRANCHA SUPERMAN',
      numSemana: '5',
      tempo: 7,
      url: 'Assets/video/SEM5/prancha_superman_30_BE.mp4',
      nomeExercicio: 'PRANCHA SUPERMAN LADO ESQUERDO',
      loop: 2) //Video(20, nomeVideos),
  ,
  VideoScreen(
      //ValueKey('sem5ex2'),
      numSemana: '5',
      tempo: 2,
      url: 'Assets/video/SEM5/elevacao_dorsal_paraquedista_30.mp4',
      nomeExercicio: 'PRANCHA PARAQUEDISTA',
      loop: 2) //Video(20, nomeVideos),
  ,
  VideoScreen(
    // ValueKey('sem5ex3'),
    isLast: true,
    tempo: 5,
    url:
        'Assets/video/SEM5/prancha_isometrica_canoa_30.mp4', //'Assets/video/prancha.mp4',
    nomeExercicio: 'PRANCHA CANOA',
    loop: 2, numSemana: '5',
  ) //Video(20, nomeVideos),
  ,
];
//////////////////////////////////
///////////// VIDEOS 6

List<VideoScreen> videos6 = [
  VideoScreen(
      urlDE: 'Assets/video/SEM6/S6_prancha_superman_D_40.mp4',
      nomeExercicioDE: 'PRANCHA SUPERMAN LADO DIREITO',
      nomeSemLado: 'PRANCHA SUPERMAN',
      numSemana: '6',
      tempo: 7,
      url: 'Assets/video/SEM6/S6_prancha_superman_E_40.mp4',
      nomeExercicio: 'PRANCHA SUPERMAN LADO ESQUERDO',
      loop: 2) //Video(20, nomeVideos),
  ,
  VideoScreen(
      numSemana: '6',
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
    loop: 2, numSemana: '6',
  ) //Video(20, nomeVideos),
];
//////////////////////
///VIDEOS 7
List<VideoScreen> videos7 = [
  VideoScreen(
      //CONFERIR OS VIDEOS
      urlDE:
          'Assets/video/SEM7/S7_prancha_alta_c_elevacao_de_braco_e_pernaD_contralateral.mp4',
      nomeExercicioDE: 'PRANCHA COM E BRAÇO E PERNA ',
      nomeSemLado: 'PRANCHA COM ELEVAÇÃO DA PERNA',
      numSemana: '7',
      tempo: 2,
      url:
          'Assets/video/SEM7/S7_prancha_alta_c_elevacao_de_braco_e_pernaE_contralateral.mp4',
      nomeExercicio: 'PRANCHA ALTA ELEV BRAÇO E PERNA ESQ',
      loop: 2) //Video(20, nomeVideos),
  ,
  VideoScreen(
      urlDE: 'Assets/video/SEM7/S7_ponte_c_elevacao_da_perna_D_30.mp4',
      nomeExercicioDE: 'PONTE COM ELEVAÇÃO DA PERNA DIR',
      nomeSemLado: 'PRANCHA COM ELEVAÇÃO DA PERNA',
      numSemana: '7',
      tempo: 2,
      url: 'Assets/video/SEM7/S7_ponte_elevacao_da_perna_E_30.mp4',
      nomeExercicio: 'PONTE COM ELEVAÇÃO DA PERNA ESQ',
      loop: 2) //Video(20, nomeVideos),
  ,
  VideoScreen(
      isLast: true,
      urlDE:
          'Assets/video/SEM7/S7_prancha_lateral_com_elevacao_do_braco_e_pernaD.mp4',
      nomeExercicioDE: 'PRANCHA LATERAL COM ELEVAÇÃO DO BRAÇO DIR',
      nomeSemLado: 'PRANCHA LATERAL COM ELEVAÇÃO DO BRAÇO E PERNA',
      numSemana: '7',
      tempo: 2,
      url:
          'Assets/video/SEM7/S7_prancha_lateral_com_elevacao_do_braco_e_pernaE.mp4',
      nomeExercicio: 'PRANCHA LATERAL COM ELEVAÇÃO DO BRAÇO ESQ',
      loop: 2) //Video(20, nomeVideos),
  ,
];
/////////////////
///VIDEOS SEMANA 8=SEMANA 7
List<VideoScreen> videos8 = [
  VideoScreen(
      urlDE:
          'Assets/video/SEM7/S7_prancha_alta_c_elevacao_de_braco_e_pernaD_contralateral.mp4',
      nomeExercicioDE: 'PRANCHA ALTA ELEV BRAÇO E PERNA DIR',
      nomeSemLado: 'PRANCHA COM ELEVAÇÃO DA PERNA',
      numSemana: '8',
      tempo: 2,
      url:
          'Assets/video/SEM7/S7_prancha_alta_c_elevacao_de_braco_e_pernaE_contralateral.mp4',
      nomeExercicio: 'PRANCHA ALTA ELEV BRAÇO E PERNA ESQ',
      loop: 2) //Video(20, nomeVideos),
  ,
  VideoScreen(
      urlDE: 'Assets/video/SEM7/S7_ponte_c_elevacao_da_perna_D_30.mp4',
      nomeExercicioDE: 'PONTE COM ELEV DA PERNA DIR',
      nomeSemLado: 'PRANCHA COM ELEVAÇÃO DA PERNA',
      numSemana: '8',
      tempo: 2,
      url: 'Assets/video/SEM7/S7_ponte_elevacao_da_perna_E_30.mp4',
      nomeExercicio: 'PONTE COM ELEV DA PERNA ESQ',
      loop: 2) //Video(20, nomeVideos),
  ,
  VideoScreen(
      isLast: true,
      urlDE:
          'Assets/video/SEM7/S7_prancha_lateral_com_elevacao_do_braco_e_pernaD.mp4',
      nomeExercicioDE: 'PRANCHA LATERAL COM ELEVAÇÃO DO BRAÇO DIR',
      nomeSemLado: 'PRANCHA LATERAL COM ELEVAÇÃO DO BRAÇO E PERNA',
      numSemana: '8',
      tempo: 2,
      url:
          'Assets/video/SEM7/S7_prancha_lateral_com_elevacao_do_braco_e_pernaE.mp4',
      nomeExercicio: 'PRANCHA LATERAL COM ELEVAÇÃO DO BRAÇO ESQ',
      loop: 2) //Video(20, nomeVideos),
  ,
];
/////////////////////////////
///VIDEOS 9
List<VideoScreen> videos9 = [
  VideoScreen(
      urlDE:
          'Assets/video/SEM9/S9_Prancha_lateral_com_elevacao_dos_bracos_e_perna_D.mp4',
      nomeExercicioDE: 'PRANCHA ALTA ELEV BRAÇO E PERNA DIR',
      nomeSemLado: 'PRANCHA COM ELEVAÇÃO DA PERNA',
      numSemana: '9',
      tempo: 2,
      url: 'Assets/video/SEM9/S9_Prancha_alta_c_elevacao_do_braco_e_pernaE.mp4',
      nomeExercicio: 'PRANCHA ALTA ELEV BRAÇO E PERNA ESQ',
      loop: 2) //Video(20, nomeVideos),
  ,
  VideoScreen(
      urlDE: 'Assets/video/SEM9/S9_ponte_dorsal_elevacao_da_pernaD.mp4',
      nomeExercicioDE: 'PONTE ELEVAÇÃO DA PERNA DIR',
      nomeSemLado: 'PRANCHA COM ELEVAÇÃO DA PERNA',
      numSemana: '9',
      tempo: 2,
      url: 'Assets/video/SEM9/S9_ponte_c_elevacao_da_pernaE.mp4',
      nomeExercicio: 'PONTE ELEVAÇÃO DA PERNA ESQ',
      loop: 2) //Video(20, nomeVideos),
  ,
  VideoScreen(
      isLast: true,
      urlDE:
          'Assets/video/SEM9/S9_Prancha_lateral_com_elevacao_dos_bracos_e_perna_D.mp4',
      nomeExercicioDE: 'PRANCHA LATERAL ELEVAÇÃO DO BRAÇO DIR',
      nomeSemLado: 'PRANCHA LATERAL COM ELEVAÇÃO DO BRAÇO E PERNA',
      numSemana: '9',
      tempo: 2,
      url:
          'Assets/video/SEM9/S9_Prancha_lateral_com_elevacao_dos_bracos_e_perna_E.mp4',
      nomeExercicio: 'PRANCHA LATERAL ELEVAÇÃO DO BRAÇO ESQ',
      loop: 2) //Video(20, nomeVideos),
  ,
];
