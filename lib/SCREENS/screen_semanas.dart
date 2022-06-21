// ignore_for_file: sized_box_for_whitespace

import 'package:flutter/material.dart';

class Semanas extends StatefulWidget {
  const Semanas({Key? key}) : super(key: key);

  @override
  State<Semanas> createState() => _SemanasState();
}

class _SemanasState extends State<Semanas> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => Future.value(false),
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Colors.red[800],
          title: const Center(
            child: Text('Strong Core',
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    fontFamily: 'Comfortaa')),
          ),
        ),
        body: ListView(
          padding: EdgeInsets.all(8),
          physics: const BouncingScrollPhysics(
              parent: AlwaysScrollableScrollPhysics()),
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.width / 5.5,
            ),
            Container(
              height: 100,
              child: ElevatedButton(
                child: Column(
                  children: [
                    ExpansionTile(
                      title: Text(
                        'Semana 1',
                        style: TextStyle(
                          fontSize: 25,
                          fontFamily: 'Comfortaa',
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
                style: ButtonStyle(
                  foregroundColor:
                      MaterialStateProperty.all<Color>(Colors.white),
                  backgroundColor: MaterialStateProperty.all<Color>(Colors.red),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(50)),
                    ),
                  ),
                ),
                onPressed: () {},
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              height: 100,
              child: ElevatedButton(
                child: const Text('Semana 2', style: TextStyle(fontSize: 18)),
                style: ButtonStyle(
                  foregroundColor:
                      MaterialStateProperty.all<Color>(Colors.white),
                  backgroundColor: MaterialStateProperty.all<Color>(
                      Color.fromARGB(255, 255, 77, 65)),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(50)),
                    ),
                  ),
                ),
                onPressed: () {},
              ),
            ),
          ],
        ),
      ),
    );
  }
}
