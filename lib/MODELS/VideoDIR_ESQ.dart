import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:strong_core/MODELS/VideoScreen.dart';
import 'package:video_player/video_player.dart';

import '../SCREENS/screen_semanas.dart';
import 'VideoTest.dart';

class VideoDirEsq extends VideoScreen {
  int? flag;
  bool? isLastVideo;
  bool? dontShowbuttun;
  int? tempoEspera;
  String numSemana;
  int dia;
  bool showButtun = false;
  VideoDirEsq(
      {this.tempoEspera,
      required this.dia,
      this.dontShowbuttun,
      required this.showButtun,
      required this.numSemana,
      required int tempo,
      this.flag,
      this.isLastVideo,
      required String url,
      required String nomeExercicio,
      required int loop})
      : super(
          numSemana: numSemana,
          tempo: tempo,
          url: url,
          nomeExercicio: nomeExercicio,
          loop: loop,
        );

  State<VideoDirEsq> createState() =>
      _VideoDirEsqState(tempo, url, nomeExercicio, loop, flag!);
}

class _VideoDirEsqState extends State<VideoDirEsq> {
  late Future<void> _inicializeVideoPlayer;
  final int tempo;
  final String url;
  final String nomeExercicio;
  final int loop;
  int flag;
  VideoPlayerController? _controller;
  CountDownController? _circulatTimerControl;

  late VoidCallback listener;
  _VideoDirEsqState(
      this.tempo, this.url, this.nomeExercicio, this.loop, this.flag);
  void createVideo() {
    /*   _controller = VideoPlayerController.asset(
      url,
    )
      ..setVolume(0)
      ..setLooping(true);

    _inicializeVideoPlayer = _controller!.initialize().then(
      (value) {
        setState(() {});
        _controller!.play();
      },
    );*/
    _controller = VideoPlayerController.asset(
      url,
    )
      ..addListener(
        () {
          setState(() {});
        },
      )
      ..setVolume(1)
      ..setLooping(true);
    _inicializeVideoPlayer = _controller!.initialize().then(
      (value) {
        setState(() {});
        _controller!.play();
        //    setState(() {});
      },
    );
  }

  @override
  void initState() {
    super.initState();
    listener = () {
      if (mounted) {
        setState(() {});
      }
    };
    _circulatTimerControl = CountDownController();

    createVideo();
  }

  @override
  void dispose() {
    //_controller!.removeListener(listener);
    _controller!.dispose();
    super.dispose();
  }

  void resumeController() {
    _circulatTimerControl!.resume();
  }

  @override
  Widget build(BuildContext context) {
    var user = FirebaseAuth.instance.currentUser;
    bool delay = true;
    Key key = Key('v1');
    return WillPopScope(
      onWillPop: (() async {
        final value = await showDialog<bool>(
            context: context,
            builder: (context) {
              _circulatTimerControl!.pause();
              WidgetsBinding.instance?.addPostFrameCallback((_) {
                _controller!.pause();
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
                        _circulatTimerControl!.resume();
                        WidgetsBinding.instance?.addPostFrameCallback((_) {
                          _controller!.play();
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
            width: MediaQuery.of(context).size.width * 0.9,
            decoration: const BoxDecoration(
                color: Color.fromARGB(169, 113, 112, 112),
                borderRadius: BorderRadius.all(Radius.circular(20))),
            child: Row(
              children: [
                SizedBox(
                  width: 20,
                ),

                /*   decoration: const BoxDecoration(
                            color: Color.fromARGB(169, 113, 112, 112),
                            borderRadius: BorderRadius.all(Radius.circular(20))),*/

                Expanded(
                  child: Text(
                    nomeExercicio,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Color.fromARGB(255, 255, 255, 255),
                        fontSize: nomeExercicio.length > 40 ? 15 : 20),
                    maxLines: 4,
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
                                /*   WidgetsBinding.instance.addPostFrameCallback((_) {
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
    */
                                //   _controller!.setLooping(true);
                                print('sssssss');
                                //circulatTimerControl.reset()

                                debugPrint('flag: $flag');
                                debugPrint('Countdown Started');
                              },
                              onComplete: () async {
                                //  circulatTimerControl.reset();
                                _circulatTimerControl!.pause();
                                _controller!.pause();
                                /*    var documentReference = FirebaseFirestore.instance
                                    .collection('user')
                                    .doc(user!.uid)
                                    .collection('exercicios');
    
                                await documentReference.add(
                                    //COMUNICA PARA O FIREBASE QUAL INSTANTE O INDIVIDUO ENCERROU O VIDEO
                                    {
                                      'EXERCICIO_${widget.nomeExercicio + flag.toString()}':
                                          _circulatTimerControl!.getTime()
                             /      });*/
                                var documentReference = FirebaseFirestore
                                    .instance
                                    .collection('user')
                                    .doc(user!.uid);

                                documentReference.update(
                                    //COMUNICA PARA O FIREBASE QUAL INSTANTE O INDIVIDUO ENCERROU O VIDEO
                                    {
                                      'SEM_${widget.numSemana}_DIA${widget.dia + 1}_EXERCICIO_${widget.nomeExercicio + flag.toString()}':
                                          _circulatTimerControl!.getTime()
                                    });
                                //                            if(eUltimo){}
                                _controller!.dispose();
                                if (widget.dontShowbuttun == true &&
                                    widget.showButtun == true) {
                                  Navigator.pop(
                                    context,
                                  );
                                } else {
                                  await Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => TelaEspera(
                                            istoShowButtun: widget.showButtun,
                                            tempoEspera: widget.tempoEspera),
                                      ));

                                  //AQUI TERMINA O EXRCICIO
                                  //     _controller!.removeListener(listener);

                                  Navigator.pop(
                                    context,
                                  );
                                }
                                //  _controller!.notifyListeners();
                                debugPrint('Countdown Ended');
                              },
                              onChange: (String timeStamp) async {}),
                        );
                      } else {
                        return Positioned(
                            top: MediaQuery.of(context).size.width * 0.5,
                            left: MediaQuery.of(context).size.width * 0.5,
                            child: const CircularProgressIndicator());
                      }
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
              _circulatTimerControl!.pause();
              _controller!.pause();

              var documentReference =
                  FirebaseFirestore.instance.collection('user').doc(user!.uid);

              documentReference.update(
                  //COMUNICA PARA O FIREBASE QUAL INSTANTE O INDIVIDUO ENCERROU O VIDEO
                  {
                    'SEM_${widget.numSemana}_DIA${widget.dia + 1}_EXERCICIO_${widget.nomeExercicio + flag.toString()}':
                        _circulatTimerControl!.getTime()
                  });
              _controller!.dispose();
              if (widget.dontShowbuttun == true && widget.showButtun == true) {
                Navigator.pop(
                  context,
                );
              } else {
                await Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => TelaEspera(
                          istoShowButtun: widget.showButtun,
                          tempoEspera: widget.tempoEspera),
                    ));

                //AQUI TERMINA O EXRCICIO
                //     _controller!.removeListener(listener);

                Navigator.pop(
                  context,
                );
              }
              //   setState(() {});
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
      ),
    );
  }
}
