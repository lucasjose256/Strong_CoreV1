import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

import 'VideoTest.dart';

class VideoScreen extends StatefulWidget {
  final int tempo;
  final String url;
  final String nomeExercicio;
  final int loop;

  VideoScreen(
      {Key? key,
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
  int flag = 0;
  VideoPlayerController? _controller;
  CountDownController circulatTimerControl = CountDownController();

  _VideoScreenState(this.tempo, this.url, this.nomeExercicio, this.loop);

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.asset(url);

    _controller!.addListener(() {
      setState(() {});
    });
    _controller!.setLooping(true);
    _controller!.initialize().then((_) {
      setState(() {});
    });
    _controller!.play();
    _controller!.setVolume(5);
  }

  @override
  void dispose() {
    _controller!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var user = FirebaseAuth.instance.currentUser;
    return Scaffold(
      body: Column(children: [
        const SizedBox(
          height: 30,
        ),
        const SizedBox(
          height: 50,
        ),
        Row(
          children: [
            const SizedBox(
              width: 50,
            ),
            const SizedBox(
              width: 5,
            ),
          ],
        ),
        const SizedBox(
          height: 30,
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
              Positioned(
                left: 300,
                child: CircularCountDownTimer(
                    duration: 5,
                    initialDuration: 0,
                    controller: circulatTimerControl,
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
                    onStart: () {
                      //circulatTimerControl.reset()
                      debugPrint('flag: $flag');
                      debugPrint('Countdown Started');
                    },
                    onComplete: () async {
                      //  circulatTimerControl.reset();
                      //  circulatTimerControl.reset();

                      //_controller!.dispose();
                      flag += (await Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => TelaEspera(),
                          )))!;
                      _controller!.notifyListeners();
                      if (flag == loop - 1) {
                        //AQUI TERMINA O EXRCICIO
                        if (mounted) {
                          setState(() {
                            Navigator.pop(
                              context,
                            );
                            _controller!.dispose();
                          });
                        }
                      }
                      if (flag < loop) {
                        if (mounted) {
                          setState(() {
                            // circulatTimerControl.restart(duration: 10);
                            circulatTimerControl.reset();
                            circulatTimerControl.start();
                          });
                        }
                      }

                      debugPrint('Countdown Ended');
                    },
                    onChange: (String timeStamp) {}),
              )
            ])),
        const SizedBox(
          height: 20,
        ),
        const SizedBox(
          height: 10,
        ),
        MaterialButton(
          child: const Text(
            'P A R A R',
            style: TextStyle(color: Colors.white),
          ),
          onPressed: () {
            if (mounted) {
              setState(() async {
                circulatTimerControl.pause();
                DocumentReference documentReference = FirebaseFirestore.instance
                    .collection('user')
                    .doc(user!.uid);

                await documentReference.update(
                    //COMUNICA PARA O FIREBASE QUAL INSTANTE O INDIVIDUO ENCERROU O VIDEO
                    {'EXERCICIO{flag}': circulatTimerControl.getTime()});

                if (flag == loop - 1) {
                  //AQUI TERMINA O EXRCICIO
                  Navigator.pop(context);
                } else
                  flag += (await Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => TelaEspera(),
                      )))!;
                circulatTimerControl.start();
              });
            }
          },
          color: const Color.fromARGB(255, 183, 183, 183),
        ),
        const SizedBox(
          height: 10,
        ),
        MaterialButton(
          child: Text('PLAY'),
          onPressed: () {
            if (mounted) {
              setState(() {
                circulatTimerControl.resume();
                if (_controller!.value.isPlaying) {
                  _controller!.pause();
                } else {
                  _controller!.play();
                }
              });
            }
          },
          color: Colors.green,
        ),
      ]),
    );
  }
}
