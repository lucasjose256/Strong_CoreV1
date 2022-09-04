import 'dart:async';

import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:spotify/spotify.dart';
import 'package:strong_core/MODELS/VideoTest.dart';
import 'package:strong_core/SCREENS/corpo_humano.dart';
import 'package:video_player/video_player.dart';

class Video extends StatefulWidget {
  int time;
  List<String> nomeVideos;

  Video(this.time, this.nomeVideos);
  @override
  State<Video> createState() => _VideoState(time, nomeVideos);
}

class _VideoState extends State<Video> {
  bool cancelTime = false;
  double porcent = 0;
  VideoPlayerController? _controller;
  Future<void>? _initializePlayer;
  int flag = 0;
  int tempo;
  List<String> nomeVid;
  CountDownController circulatTimerControl = CountDownController();

  _VideoState(this.tempo, this.nomeVid);
  late String atualVid = nomeVid[0];
  void carregarBarra() {
    Timer.periodic(const Duration(seconds: 1), (timer) {
      if (porcent < 1 && !(cancelTime)) {
        setState(() {
          tempo--;
          // porcent += 0.034;
          porcent += ((1) / widget.time);
        });
      } else if ((cancelTime)) {
        setState(() {
          porcent = porcent;
          tempo = tempo;
          timer.cancel();
          cancelTime = false;
        });
      } else {
        setState(() {
          tempo = 0;
          porcent = 0;
          timer.cancel();
          tempo = widget.time;
        });
      }
    });
  }

  void initState() {
    super.initState();
    _controller = VideoPlayerController.network(atualVid);

    _controller!.addListener(() {
      setState(() {});
    });
    _controller!.setLooping(true);
    _controller!.initialize().then((_) => setState(() {}));
    _controller!.play();
    _controller!.setVolume(0);
  }

  @override
  void dispose() {
    _controller!.dispose();
    super.dispose();
  }

  Future<void> spotifyTest() async {
    final credentials = SpotifyApiCredentials(
        '4b5e568fadb2498789b4d712ce5c87ef', '93e891e4f16a4dc780dcefd252026671');
    final spotify = SpotifyApi(credentials);
    final artist =
        await spotify.artists.get('4b5e568fadb2498789b4d712ce5c87ef');
    print(artist.name);
  }

  @override
  Widget build(BuildContext context) {
    int i = 0;
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
            SizedBox(
              width: 250,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: SizedBox(
                  height: 18,
                  child: LinearProgressIndicator(
                    color: Colors.greenAccent,
                    value: porcent, // percent filled
                    valueColor: const AlwaysStoppedAnimation<Color>(
                        Color.fromARGB(255, 27, 27, 27)),
                    backgroundColor: const Color.fromARGB(129, 167, 166, 166),
                  ),
                ),
              ),
            ),
            /*  Padding(
              padding: EdgeInsets.all(15.0),
              child: LinearPercentIndicator(
                width: MediaQuery.of(context).size.width - 200,
                animation: true,
                lineHeight: 20.0,
                animationDuration: 2000,
                //animationDuration: 2000,
                percent: porcent,
                linearStrokeCap: LinearStrokeCap.roundAll,
                progressColor: Color.fromARGB(255, 9, 10, 10),
              ),
            ),*/
            const SizedBox(
              width: 5,
            ),
            Text(tempo.toString(),
                style: const TextStyle(
                  fontSize: 30,
                )),
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
                    duration: 6,
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
                      flag += (await Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => TelaEspera(),
                          )))!;
                      if (flag == 1)
                        setState(() {
                          // circulatTimerControl.restart(duration: 10);
                          circulatTimerControl.reset();
                          circulatTimerControl.start();
                        });
                      if (flag == 2) {
                        atualVid = nomeVid[1];
                        _controller = VideoPlayerController.network(atualVid);

                        _controller!.setLooping(true);
                        _controller!.initialize().then((_) => setState(() {}));
                        _controller!.play();
                        setState(() {
                          flag = 0;
                          circulatTimerControl.reset();
                          circulatTimerControl.start();
                        });
                      }

                      debugPrint('Countdown Ended');
                    },
                    onChange: (String timeStamp) {}),
              )
            ])),
        const SizedBox(
          height: 20,
        ),
        MaterialButton(
          child: const Text(
            'I N I C I A R',
            style: TextStyle(color: Colors.white),
          ),
          onPressed: () {
            carregarBarra();
          },
          color: Colors.black,
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
            setState(() async {
              circulatTimerControl.pause();
              DocumentReference documentReference = FirebaseFirestore.instance
                  .collection('user')
                  .doc(user!.displayName);

              await documentReference.update(
                  {'EXERCICIO ${flag}': circulatTimerControl.getTime()});

              flag += (await Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => TelaEspera(),
                  )))!;
              circulatTimerControl.start();
            });
          },
          color: const Color.fromARGB(255, 183, 183, 183),
        ),
        const SizedBox(
          height: 10,
        ),
        MaterialButton(
          child: Text('PLAY'),
          onPressed: () {
            setState(() {
              circulatTimerControl.resume();
              if (_controller!.value.isPlaying) {
                _controller!.pause();
              } else {
                _controller!.play();
              }
            });
          },
          color: Colors.green,
        ),
      ]),
    );
  }
}
