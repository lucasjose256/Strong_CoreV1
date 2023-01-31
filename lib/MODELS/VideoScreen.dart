import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:strong_core/MODELS/VideoDIR_ESQ.dart';
import 'package:video_player/video_player.dart';

import 'VideoTest.dart';

class VideoScreen extends StatefulWidget {
  final int tempo;
  final String url;
  final String nomeExercicio;
  final int loop;
  String? nomeExercicioDE;
  String? urlDE;

  VideoScreen(
      {Key? key,
      this.urlDE,
      this.nomeExercicioDE,
      required this.tempo,
      required this.url,
      required this.nomeExercicio,
      required this.loop})
      : super(key: key);

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
  VideoPlayerController? _controller;
  CountDownController? _circulatTimerControl;

  _VideoScreenState(this.tempo, this.url, this.nomeExercicio, this.loop);
  late Future<void> _inicializeVideoPlayer;
  bool showTimer = true;

  @override
  void initState() {
    super.initState();
    _circulatTimerControl = CountDownController();
    _controller = VideoPlayerController.asset(url);
    _inicializeVideoPlayer = _controller!.initialize();
  }

  @override
  void dispose() {
    _controller!.dispose();
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
                        fontSize: 22),
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
        const SizedBox(
          height: 60,
        ),
        Padding(
            padding: const EdgeInsets.all(8.0),
            child: Stack(children: [
              ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(30)),
                child: AspectRatio(
                    child: VideoPlayer(_controller!),
                    aspectRatio: _controller!.value.aspectRatio),
              ),
              FutureBuilder(
                  future: _inicializeVideoPlayer,
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.done) {
                      return Positioned(
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
                            // autoStart: true,
                            onStart: () async {
                              WidgetsBinding.instance.addPostFrameCallback((_) {
                                _controller!.addListener(() {
                                  setState(() {});
                                });
                                _controller!.initialize().then((_) {
                                  setState(() {});
                                });
                                _controller!.setLooping(true);
                                _controller!.setVolume(0);
                                _controller!.play();
                                // Add Your Code here.
                              });

                              //   _controller!.setLooping(true);
                              print('sssssss');
                              //circulatTimerControl.reset()

                              debugPrint('flag: $flag');
                              debugPrint('Countdown Started');
                            },
                            onComplete: () async {
                              //  circulatTimerControl.reset();
                              //  circulatTimerControl.reset();
                              if (flag == loop &&
                                  widget.nomeExercicioDE == null) {
                                flag += (await Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          TelaEspera(tempoEspera: 6),
                                    )))!;
                                _controller!.notifyListeners();
                              } else {
                                flag += (await Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          TelaEspera(tempoEspera: 2),
                                    )))!;
                                _controller!.notifyListeners();
                              }
                              if (widget.nomeExercicioDE != null) {
                                if (flag == loop + 1) {
                                  tempoEspera = 10;
                                }

                                await Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => VideoDirEsq(
                                          tempoEspera: tempoEspera,
                                          flag: flag - 1,
                                          tempo: tempo,
                                          loop: loop,
                                          nomeExercicio:
                                              widget.nomeExercicioDE!,
                                          url: widget.urlDE!),
                                    ));

                                if (flag == loop + 1) {
                                  //AQUI TERMINA O EXRCICIO
                                  if (mounted) {
                                    Navigator.pop(
                                      context,
                                    );
                                  }
                                }
                                if (flag < loop + 1) {
                                  if (mounted) {
                                    //circulatTimerControl.restart(duration: 10);
                                    setState(() {
                                      _circulatTimerControl!.reset();
                                      _circulatTimerControl!.start();
                                    });
                                  }
                                }
                              }

                              if (flag == loop + 1 &&
                                  widget.nomeExercicioDE == null) {
                                //AQUI TERMINA O EXRCICIO

                                if (mounted) {
                                  setState(() {
                                    Navigator.pop(
                                      context,
                                    );
                                  });
                                }
                              }
                              if (flag < loop + 2 &&
                                  widget.nomeExercicioDE == null) {
                                if (mounted) {
                                  //circulatTimerControl.restart(duration: 10);
                                  setState(() {
                                    _circulatTimerControl!.reset();
                                    _circulatTimerControl!.start();
                                  });
                                }
                              }

                              debugPrint('Countdown Ended');
                            },
                            onChange: (String timeStamp) async {}),
                      );
                    } else
                      return Positioned(
                          top: MediaQuery.of(context).size.width * 0.5,
                          left: MediaQuery.of(context).size.width * 0.5,
                          child: CircularProgressIndicator());
                  })
            ])),
        const SizedBox(
          height: 20,
        ),
        const SizedBox(
          height: 10,
        ),
        MaterialButton(
          child: CircleAvatar(
            backgroundColor: Color.fromARGB(255, 57, 56, 56),
            radius: 60,
            child: const Text(
              'P A R A R',
              style: TextStyle(color: Colors.white),
            ),
          ),
          onPressed: () async {
            if (mounted) {
              _circulatTimerControl!.pause();
              DocumentReference documentReference =
                  FirebaseFirestore.instance.collection('user').doc(user!.uid);

              await documentReference.update(
                  //COMUNICA PARA O FIREBASE QUAL INSTANTE O INDIVIDUO ENCERROU O VIDEO
                  {
                    'EXERCICIO_${widget.nomeExercicio + flag.toString()}':
                        _circulatTimerControl!.getTime()
                  });

              if (flag == loop) {
                //AQUI TERMINA O EXRCICIO
                if (mounted) {
                  flag += (await Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => TelaEspera(tempoEspera: 6),
                      )))!;
                }
              } else {
                flag += (await Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => TelaEspera(),
                    )))!;
              }
              if (flag == loop + 1) {
                Navigator.of(context).pop();
              }
              _circulatTimerControl!.start();
              setState(() {});
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
}
