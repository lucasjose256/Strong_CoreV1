import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:date_format/date_format.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:strong_core/MODELS/VideoDIR_ESQ.dart';

import 'package:video_player/video_player.dart';

import 'VideoTest.dart';

class VideoScreen extends StatefulWidget {
  String numSemana = '';
  final int tempo;
  final String url;
  final String nomeExercicio;
  final int loop;
  String? nomeExercicioDE;
  String? urlDE;
  String? nomeSemLado;
  bool? isLast;

  int delay;
  VideoScreen({
    required this.delay,
    this.isLast,
    required this.numSemana,
    this.urlDE,
    this.nomeSemLado,
    this.nomeExercicioDE,
    required this.tempo,
    required this.url,
    required this.nomeExercicio,
    required this.loop,
  });

  @override
  State<VideoScreen> createState() =>
      _VideoScreenState(tempo, url, nomeExercicio, loop);
}

class _VideoScreenState extends State<VideoScreen> {
  Future<void>? _initializePlayer;
  final int tempo;
  final String url;
  final String nomeExercicio;
  final int loop;
  int flag = 1;
  late VideoPlayerController _controller; //
  CountDownController? _circulatTimerControl;
  late VoidCallback listener;

  bool islast = false;
  _VideoScreenState(this.tempo, this.url, this.nomeExercicio, this.loop);
  late Future<void> _inicializeVideoPlayer;
  bool showButtun = false;
  void inicializaVideo(VideoPlayerController _controller) async {}

  void createVideo() {
    _controller = VideoPlayerController.asset(
      url,
    )
      ..addListener(listener)
      ..setVolume(0)
      ..setLooping(true);
    _inicializeVideoPlayer = _controller.initialize().then(
      (value) {
        // setState(() {});
        return _controller.play();
        //    setState(() {});
      },
    );
    _inicializeVideoPlayer.ignore();
    /* _controller.initialize().then(
      (value) async {
   await _controller.play();
      },
    );     */
  }

  @override
  void initState() {
    super.initState();
    listener = () {
      if (mounted) {
        setState(() {});
      }
    };
    createVideo();

    _circulatTimerControl = CountDownController();
  }

  @override
  void dispose() {
    //_controller!.removeListene;
    _controller!.dispose();

    print('fechou');
    super.dispose();
  }

  void resumeController() {
    _circulatTimerControl!.resume();
  }

  @override
  Widget build(BuildContext context) {
    var user = FirebaseAuth.instance.currentUser;
    int tempoEspera = 2;
    bool delay = true;
    Key key = Key('v1');
    return Scaffold(
      body: Column(children: [
        const SizedBox(
          height: 60,
        ),
        Container(
          width: MediaQuery.of(context).size.width * 0.9,
          decoration: const BoxDecoration(
              color: Color.fromARGB(169, 113, 112, 112),
              borderRadius: BorderRadius.all(Radius.circular(20))),
          child: FittedBox(
            child: Row(
              children: [
                SizedBox(
                  width: 20,
                ),
                Center(
                  child: Container(
                    /*   decoration: const BoxDecoration(
                        color: Color.fromARGB(169, 113, 112, 112),
                        borderRadius: BorderRadius.all(Radius.circular(20))),*/
                    child: Text(
                      nomeExercicio,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Color.fromARGB(255, 255, 255, 255),
                          fontSize: nomeExercicio.length > 40 ? 15 : 20),
                    ),
                  ),
                ),
                SizedBox(
                  width: 35,
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 0.19,
                  decoration: BoxDecoration(
                      color: Color.fromARGB(225, 69, 69, 69),
                      borderRadius: BorderRadius.all(Radius.circular(20))),
                  child: Text('${flag}/${loop}',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Color.fromARGB(255, 255, 255, 255),
                          fontSize: 32)),
                )
              ],
            ),
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
                  Container(margin: EdgeInsets.all(8), child: buildVideo()),
                  Positioned(
                    left: MediaQuery.of(context).size.width * 0.78,
                    child: CircularCountDownTimer(
                        duration: widget.tempo + 1,
                        initialDuration: 0,
                        controller: _circulatTimerControl,
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
                            fontSize: 33.0,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                        textFormat: CountdownTextFormat.S,
                        isReverse: true,
                        isReverseAnimation: true,
                        isTimerTextShown: true,
                        autoStart: true,
                        onStart: () async {
                          //     _controller.play();

                          /*    _controller!.addListener(() {
                              //     setState(() {});
                            });*/
                          /*   WidgetsBinding.instance.addPostFrameCallback((_) {
                            _controller.addListener(() {
                              setState(() {});
                            });
                            _controller!.setLooping(true);
                            _controller!.setVolume(0);
                            _controller!.initialize().then((_) {
                              setState(() {});
                              _controller.play();
                            });

                            print('aqui foi o momento');
                          });*/
                          // Add Your Code here.

                          // Add Your Code here.

                          //   _controller!.setLooping(true);

                          //circulatTimerControl.reset()
                        },
                        onComplete: () async {
                          _circulatTimerControl!.pause();
                          /*      var documentReference = FirebaseFirestore.instance
                              .collection('user')
                              .doc(user!.uid);
                          documentReference.update(
                              //COMUNICA PARA O FIREBASE QUAL INSTANTE O INDIVIDUO ENCERROU O VIDEO
                              {
                                'SEM_${widget.numSemana}_EXERCICIO_${widget.nomeExercicio+ flag.toString()}':
                                    _circulatTimerControl!.getTime()
                              });
*/
                          //   _controller.removeListener(listener);
                          _controller.dispose();

                          //  circulatTimerControl.reset();
                          //  circulatTimerControl.reset();
                          //   _controller!.notifyListeners();

                          if (flag == loop && widget.nomeExercicioDE == null) {
                            if (widget.isLast == true) {
                              Navigator.pop(context);
                            } else {
                              flag += (await Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => TelaEspera(
                                        tempoEspera: 5, istoShowButtun: true),
                                  )))!;
                            }
                            //  _controller.notifyListeners();
                          } else {
                            flag += (await Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      TelaEspera(tempoEspera: 3),
                                )))!;
                            //  _controller.notifyListeners();
                          }

                          if (widget.nomeExercicioDE != null) {
                            if (flag == loop + 1) {
                              islast = true;
                              showButtun = true;
                              tempoEspera = 3;
                            }

                            await Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => VideoDirEsq(
                                      delay: widget.delay,
                                      //         ValueKey(widget.nomeExercicio),
                                      dia: 2,
                                      showButtun: showButtun,
                                      numSemana: widget.numSemana,
                                      isLastVideo: islast,
                                      tempoEspera: tempoEspera,
                                      flag: flag - 1,
                                      tempo: tempo,
                                      loop: loop,
                                      nomeExercicio: widget.nomeExercicioDE!,
                                      url: widget.urlDE!),
                                ));
                            //   _controller!.notifyListeners();
                            if (flag == loop + 1) {
                              //AQUI TERMINA O EXRCICIO
                              /* _controller!.removeListener(listener);
                              _controller.dispose();*/
                              Navigator.pop(
                                context,
                              );
                            }
                            if (flag < loop + 1) {
                              //circulatTimerControl.restart(duration: 10);

                              _circulatTimerControl!.reset();
                              _circulatTimerControl!.start();
                            }
                          }

                          if (flag == loop + 1 &&
                              widget.nomeExercicioDE == null) {
                            //AQUI TERM INA O EXRCICIO
                            //4 semanas de exercicio seguidas sem travar
                            if (mounted) {
                              Navigator.pop(
                                context,
                              );
                            }
                          }
                          if (flag < loop + 2 &&
                              widget.nomeExercicioDE == null) {
                            if (mounted) {
                              // _controller.notifyListeners();

                              //circulatTimerControl.restart(duration: 10);

                              _circulatTimerControl!.reset();
                              _circulatTimerControl!.start();
                            }
                          }

                          createVideo();
                          /*  _inicializeVideoPlayer = _controller!.initialize();
                          _controller!.play();*/
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
          onPressed: () async {
            _circulatTimerControl!.pause();
            // _controller!.removeListener(listener);
            _controller.dispose();
            //  _controller!.play();

            if (mounted) {
              try {
                DocumentReference documentReference = FirebaseFirestore.instance
                    .collection('user')
                    .doc(user!.uid);
//testar sem o await
                documentReference.update(
                    //COMUNICA PARA O FIREBASE QUAL INSTANTE O INDIVIDUO ENCERROU O VIDEO
                    {
                      'SEM_${widget.numSemana}_EXERCICIO_${widget.nomeExercicio + flag.toString()}':
                          _circulatTimerControl!.getTime()
                    });
              } catch (e) {
                ScaffoldMessenger.of(context).clearSnackBars();
                ScaffoldMessenger.of(context)
                    .showSnackBar(SnackBar(content: Text('Algo deu errado!')));
              }

              if (flag == loop && widget.nomeExercicioDE == null) {
                //AQUI TERMINA O EXRCICIO
                if (widget.isLast == true) {
                  Navigator.pop(context);
                } else {
                  flag += (await Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            TelaEspera(tempoEspera: 6, istoShowButtun: true),
                      )))!;
                }
              } else {
                flag += (await Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => TelaEspera(),
                    )))!;
                if (widget.nomeExercicioDE != null) {
                  if (flag == loop + 1) {
                    tempoEspera = 5;
                    showButtun = true;
                    islast = true;
                  }
                  await Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => VideoDirEsq(
                            delay: widget.delay,
                            //    ValueKey(widget.nomeExercicio),
                            dia: 2,
                            isLastVideo: islast,
                            showButtun: showButtun,
                            numSemana: widget.numSemana,
                            tempoEspera: tempoEspera,
                            flag: flag - 1,
                            tempo: tempo,
                            loop: loop,
                            nomeExercicio: widget.nomeExercicioDE!,
                            url: widget.urlDE!),
                      ));
                }
              }
              if (flag == loop + 1) {
                Navigator.of(context).pop();
              }
              createVideo();
              _circulatTimerControl!.start();

              //setState(() {});
            }
          },
          //  color: const Color.fromARGB(255, 183, 183, 183),
        ),
        const SizedBox(
          height: 10,
        ),
        /*  MaterialButton(
          child: Text('PLAY'),
          onPressed: () {
            if (mounted) {
              setState(() {
                _circulatTimerControl!.resume();
                if (_controller!.value.isPlaying) {
                  _controller!.pause();
                } else {
                  _controller!.play();
                }
              });
            }
          },
          color: Colors.green,
        ),*/
      ]),
    );
  }

  ClipRRect buildVideo() {
    return ClipRRect(
      borderRadius: const BorderRadius.all(Radius.circular(30)),
      child: AspectRatio(
          child: VideoPlayer(
            _controller!,
          ),
          aspectRatio: _controller!.value.aspectRatio),
    );
  }
}
