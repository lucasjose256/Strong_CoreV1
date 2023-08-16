import 'dart:async';

import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:strong_core/MODELS/lista_semanas.dart';
import 'package:strong_core/MODELS/user_preferences.dart';
import 'package:strong_core/SCREENS/screen_semanas.dart';
import 'package:video_player/video_player.dart';

import 'VideoDIR_ESQ.dart';
import 'VideoScreen.dart';
import 'VideoTest.dart';

class VideoManeger extends StatefulWidget {
  List<VideoScreen> videos;
  final int numSemana;
  VideoManeger({Key? key, required this.videos, required this.numSemana})
      : super(key: key);

  @override
  State<VideoManeger> createState() => _VideoManegerState(this.videos);
}

class _VideoManegerState extends State<VideoManeger> {
  late VideoPlayerController _controller;

  int index = 0;
  late Future<void> _inicializeVideoPlayer;

  bool islast = false;

  bool showButtun = false;
  //lembrar de adiconar ele no construtor
  int tempoEspera = 30;
  int tempoProxExercicio = 45;

  List<VideoScreen> videos;
  late CountDownController circulatTimerControl = CountDownController();
  bool delayVideo = false;

  bool isDeviceConnected = false;

  late StreamSubscription subscription;

  var isAlertSet = false;

  _VideoManegerState(this.videos);

  Timer? delayTimer;
  void createVideo() async {
    delayVideo = false;
    _controller = VideoPlayerController.asset(
      videos[index].url,
    )
      ..addListener(() async {
        if (mounted) {
          setState(() {});
        }
      })
      ..setVolume(1)
      ..setLooping(true);
    _inicializeVideoPlayer = _controller.initialize().then(
      (value) {
        if (mounted) setState(() {});
        _controller.play();
        delayTimer = Timer(
          Duration(seconds: videos[index].delay),
          () {
            delayVideo = true;
            try {
              circulatTimerControl.start();
            } catch (e) {
              print(e);
            }
          },
        );
        //    setState(() {});
      },
    );
  }

  int flag = 1;
  @override
  void initState() {
    super.initState();
    getConnectivity();
    createVideo();
  }

  getConnectivity() =>
      subscription = Connectivity().onConnectivityChanged.listen((event) async {
        isDeviceConnected = await InternetConnectionChecker().hasConnection;
        if (!isDeviceConnected && isAlertSet == false) {
          circulatTimerControl.pause();
          _controller.pause();
          showDialgBox();
          setState(() {
            isAlertSet = true;
          });
        } else {
          circulatTimerControl.resume();
          _controller.play();
        }
      });

  @override
  void dispose() {
    // videos.clear();
    _controller.dispose();
    // TODO: implement dispose
    super.dispose();
  }

  var user = FirebaseAuth.instance.currentUser;
  @override
  Widget build(BuildContext context) {
    bool unableStopButtun = true;
    int dia = UserPreferences.getSteps(widget.numSemana) as int ?? 0;

    return WillPopScope(
      onWillPop: (() async {
        final value = await showDialog<bool>(
            context: context,
            builder: (context) {
              circulatTimerControl.pause();
              WidgetsBinding.instance?.addPostFrameCallback((_) {
                _controller.pause();
              });
              return AlertDialog(
                title: Text(
                  'Exercicios',
                ),
                content: Text('Você realmente quer sair? \n' +
                    '(Se você sair o progresso desses exercícios será perdido)'),
                actions: [
                  ElevatedButton(
                      onPressed: (() {
                        circulatTimerControl.resume();
                        WidgetsBinding.instance?.addPostFrameCallback((_) {
                          _controller.play();
                        });

                        Navigator.pop(context);
                      }),
                      child: Text('Continuar')),
                  MaterialButton(
                    onPressed: (() => Navigator.push(context,
                        MaterialPageRoute(builder: ((context) => Semanas())))),
                    child: Text(
                      'Sair',
                      style: TextStyle(color: Colors.red),
                    ),
                  )
                ],
              );
            });
        if (value != null) {
          return Future.value(value);
        } else {
          return Future.value(false);
        }
      }),
      child: Scaffold(
        body: Column(children: [
          const SizedBox(
            height: 60,
          ),
          Container(
            // height: 50,
            width: MediaQuery.of(context).size.width * 0.9,
            decoration: const BoxDecoration(
                color: Color.fromARGB(169, 113, 112, 112),
                borderRadius: BorderRadius.all(Radius.circular(20))),
            child: Row(
              children: [
                SizedBox(
                  width: 20,
                ),
                Container(
                  child:
                      /*   decoration: const BoxDecoration(
                          color: Color.fromARGB(169, 113, 112, 112),
                          borderRadius: BorderRadius.all(Radius.circular(20))),*/

                      Expanded(
                    child: Text(
                      videos[index].nomeExercicio,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Color.fromARGB(255, 255, 255, 255),
                          fontSize: videos[index].nomeExercicio.length > 40
                              ? 15
                              : 20),
                      maxLines: 4,
                    ),
                  ),
                ),
                SizedBox(
                  width: 20,
                ),
                FittedBox(
                  fit: BoxFit.scaleDown,
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.19,
                    decoration: BoxDecoration(
                        color: Color.fromARGB(225, 69, 69, 69),
                        borderRadius: BorderRadius.all(Radius.circular(20))),
                    child: Text('${flag}/${videos[index].loop}',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Color.fromARGB(255, 255, 255, 255),
                            fontSize: 32)),
                  ),
                )
              ],
            ),
          ),
          const SizedBox(
            height: 60,
          ),
          FutureBuilder(
              //testar o create video aqui
              future: _inicializeVideoPlayer,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  return Stack(children: [
                    Container(
                        margin: EdgeInsets.all(8),
                        child: ClipRRect(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(30)),
                          child: AspectRatio(
                              child: VideoPlayer(
                                _controller!,
                              ),
                              aspectRatio: _controller!.value.aspectRatio),
                        )),
                    Positioned(
                      left: MediaQuery.of(context).size.width * 0.78,
                      child: CircularCountDownTimer(
                          duration: videos[index].tempo,
                          initialDuration: 0,
                          controller: delayVideo ? null : circulatTimerControl,
                          width: MediaQuery.of(context).size.width / 8.8,
                          height: MediaQuery.of(context).size.height / 8.8,
                          ringColor: Colors.grey[300]!,
                          ringGradient: null,
                          fillColor: Color.fromARGB(255, 114, 114, 114),
                          fillGradient: null,
                          backgroundColor: Color.fromARGB(255, 0, 0, 0),
                          backgroundGradient: null,
                          strokeWidth: 20.0,
                          strokeCap: StrokeCap.round,
                          textStyle: TextStyle(
                              fontSize: 30,
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                          textFormat: CountdownTextFormat.S,
                          // isReverse: true,
                          isReverseAnimation: true,
                          isTimerTextShown: true,
                          autoStart: delayVideo,
                          onStart: () async {},
                          onComplete: () async {
                            circulatTimerControl!.pause();
                            _controller.pause();
                            /*   setState(() {
                              delayVideo = false;
                            });*/

                            var connectivityResult =
                                await (Connectivity().checkConnectivity());
                            if (connectivityResult == ConnectivityResult.none) {
                              showDialgBox();
                            } else if (connectivityResult ==
                                    ConnectivityResult.wifi ||
                                connectivityResult ==
                                    ConnectivityResult.mobile) {
                              // I am connected to a mobile network.

                              try {
                                var documentReference = FirebaseFirestore
                                    .instance
                                    .collection('user')
                                    .doc(user!.uid);
                                if (dia < 3) {
                                  documentReference.update(
                                      //COMUNICA PARA O FIREBASE QUAL INSTANTE O INDIVIDUO ENCERROU O VIDEO
                                      {
                                        'SEM_${videos[index].numSemana}_DIA${dia + 1}_EXERCICIO_${videos[index].nomeExercicio + flag.toString()}':
                                            delayVideo
                                                ? circulatTimerControl!
                                                    .getTime()
                                                : videos[index].tempo
                                      });
                                  print(
                                      'SEM_${videos[index].numSemana}_DIA${dia + 1}_EXERCICIO_${videos[index].nomeExercicio + flag.toString()}');
                                }
                              } catch (e) {
                                ScaffoldMessenger.of(context).clearSnackBars();
                                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                    duration: Duration(seconds: 10),
                                    content: Text(
                                        'Erro ao enviar os dados do video${_controller.dataSource}')));
                              }

                              _controller.dispose();
                              //  _controller!.play();

                              /*  if (mounted) {
                _circulatTimerControl!.pause();
                DocumentReference documentReference =
                    FirebaseFirestore.instance.collection('user').doc(user!.uid);
    //testar sem o await
                documentReference.update(
                    //COMUNICA PARA O FIREBASE QUAL INSTANTE O INDIVIDUO ENCERROU O VIDEO
                    {
                      'SEM_${widget.numSemana}_EXERCICIO_${widget.nomeExercicio + flag.toString()}':
                          _circulatTimerControl!.getTime()
                    });
    */
                              if (flag == videos[index].loop &&
                                  videos[index].nomeExercicioDE == null) {
                                //AQUI TERMINA O EXRCICIO
                                if (videos[index].isLast == true &&
                                    flag == videos[index].loop) {
                                  Navigator.pop(context);
                                } else {
                                  //tempo longo
                                  flag += (await Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => TelaEspera(
                                            tempoEspera: tempoProxExercicio,
                                            istoShowButtun: true),
                                      )))!;
                                }
                              } else {
                                flag += (await Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      //tempo curto
                                      builder: (context) => TelaEspera(),
                                    )))!;
                                if (videos[index].nomeExercicioDE != null) {
                                  if (flag == videos[index].loop + 1) {
                                    tempoEspera = tempoProxExercicio;
                                    showButtun = true;
                                    islast = true;
                                  }
                                  await Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => VideoDirEsq(
                                            delay: videos[index].delay,
                                            //   ValueKey(videos[index].nomeExercicio),
                                            dia: dia,
                                            //   isLastVideo: islast,
                                            dontShowbuttun:
                                                videos[index].isLast,
                                            showButtun: showButtun,
                                            numSemana: videos[index].numSemana,
                                            tempoEspera: tempoEspera,
                                            flag: flag - 1,
                                            tempo: videos[index].tempo,
                                            loop: videos[index].loop,
                                            nomeExercicio:
                                                videos[index].nomeExercicioDE!,
                                            url: videos[index].urlDE!),
                                      ));
                                }
                              }

                              if (flag == videos[index].loop + 1) {
                                //  Navigator.of(context).pop();
                                if (index == videos.length - 1) {
                                  Navigator.pop(context);
                                } else {
                                  flag = 1;
                                  tempoEspera = 30;
                                  showButtun = false;
                                  islast = false;
                                  if (mounted) {
                                    setState(() {
                                      index++;
                                    });
                                  }
                                }
                              }
                              createVideo();
                            }
                            // circulatTimerControl.start();
                          },
                          onChange: (String timeStamp) async {}),
                    ),
                  ]);
                } else {
                  return Center(child: CircularProgressIndicator());
                }
              }),
          const SizedBox(
            height: 20,
          ),
          const SizedBox(
            height: 10,
          ),
          MaterialButton(
              child: const CircleAvatar(
                backgroundColor: Color.fromARGB(255, 57, 56, 56),
                radius: 60,
                child: Text(
                  'P A R A R',
                  style: TextStyle(color: Colors.white),
                ),
              ),
              onPressed: unableStopButtun
                  ? () async {
                      delayTimer!.cancel();
                      /* if (delayVideo == false) {
                        circulatTimerControl.start();
                      }*/
                      circulatTimerControl!.pause();
                      setState(() {
                        unableStopButtun = false;
                        //     delayVideo = false;
                      });
                      var connectivityResult =
                          await (Connectivity().checkConnectivity());
                      if (connectivityResult == ConnectivityResult.none) {
                        showDialgBox();
                      } else if (connectivityResult ==
                              ConnectivityResult.wifi ||
                          connectivityResult == ConnectivityResult.mobile) {
                        // _controller!.removeListener(listener);
                        _controller.dispose();

                        try {
                          var documentReference = FirebaseFirestore.instance
                              .collection('user')
                              .doc(user!.uid);
                          if (dia < 3) {
                            documentReference.update(
                                //COMUNICA PARA O FIREBASE QUAL INSTANTE O INDIVIDUO ENCERROU O VIDEO
                                {
                                  'SEM_${videos[index].numSemana}_DIA${dia + 1}_EXERCICIO_${videos[index].nomeExercicio + flag.toString()}':
                                      delayVideo
                                          ? circulatTimerControl!.getTime()
                                          : 0
                                });
                          }
                          print(
                              'KILL: ${delayVideo ? circulatTimerControl!.getTime() : videos[index].tempo}');
                        } catch (e) {
                          ScaffoldMessenger.of(context).clearSnackBars();
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              duration: Duration(seconds: 10),
                              content: Text(
                                  'Erro ao enviar os dados do video${_controller.dataSource}')));
                        }
                        print(
                            'SEM_${videos[index].numSemana}_DIA${dia + 1}_EXERCICIO_${videos[index].nomeExercicio + flag.toString()}');

                        //  _controller!.play();

                        /*  if (mounted) {
                _circulatTimerControl!.pause();
                DocumentReference documentReference =
                    FirebaseFirestore.instance.collection('user').doc(user!.uid);
    //testar sem o await
                documentReference.update(
                    //COMUNICA PARA O FIREBASE QUAL INSTANTE O INDIVIDUO ENCERROU O VIDEO
                    {
                      'SEM_${widget.numSemana}_EXERCICIO_${widget.nomeExercicio + flag.toString()}':
                          _circulatTimerControl!.getTime()
                    });
    */
                        if (flag == videos[index].loop &&
                            videos[index].nomeExercicioDE == null) {
                          //AQUI TERMINA O EXRCICIO
                          if (videos[index].isLast == true &&
                              flag == videos[index].loop) {
                            Navigator.pop(context);
                          } else {
                            flag += (await Navigator.push(
                                context, //tempo longo
                                MaterialPageRoute(
                                  builder: (context) => TelaEspera(
                                      tempoEspera: tempoProxExercicio,
                                      istoShowButtun: true),
                                )))!;
                          }
                        } else {
                          flag += (await Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => TelaEspera(),
                              )))!;
                          if (videos[index].nomeExercicioDE != null) {
                            if (flag == videos[index].loop + 1) {
                              tempoEspera = 45;
                              showButtun = true;
                              islast = true;
                            }
                            await Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => VideoDirEsq(
                                      delay: videos[index].delay,
                                      //    ValueKey(videos[index].nomeExercicio),
                                      dia: dia,
                                      dontShowbuttun: videos[index].isLast,
                                      showButtun: showButtun,
                                      numSemana: videos[index].numSemana,
                                      tempoEspera: tempoEspera,
                                      flag: flag - 1,
                                      tempo: videos[index].tempo,
                                      loop: videos[index].loop,
                                      nomeExercicio:
                                          videos[index].nomeExercicioDE!,
                                      url: videos[index].urlDE!),
                                ));
                          }
                        }

                        if (flag == videos[index].loop + 1) {
                          //  Navigator.of(context).pop();
                          /*if (index == videos.length - 1) {
                    Navigator.pop(context);
                  }*/

                          if (index == videos.length - 1) {
                            Navigator.pop(context);
                          } else {
                            flag = 1;
                            tempoEspera = 30;
                            showButtun = false;
                            islast = false;
                            if (mounted) {
                              setState(() {
                                index++;
                              });
                            }
                          }
                        }
                        createVideo();
                        //   circulatTimerControl.start();

                        //setState(() {});*/
                      }
                    }
                  : null),

          //  color: const Color.fromARGB(255, 183, 183, 183),

          const SizedBox(
            height: 10,
          ),
        ]),
      ),
    );
  }

  void showDialgBox() => showDialog(
        context: context,
        builder: (context) => AlertDialog(
          actions: [
            TextButton(
                onPressed: () async {
                  Navigator.of(context).pop();

                  setState(() {
                    isAlertSet = false;
                  });
                  isDeviceConnected =
                      await InternetConnectionChecker().hasConnection;
                  if (!isDeviceConnected) {
                    showDialgBox();
                    setState(() {
                      isAlertSet = true;
                    });
                  }
                },
                child: Text('Ok'))
          ],
          title: const Text('Sem Conexão'),
          content: const Text('Por favor confira a sua conexão com a internet'),
        ),
      );
}
