import 'package:flutter/material.dart';

class Semanas extends StatefulWidget {
  const Semanas({Key? key}) : super(key: key);

  @override
  State<Semanas> createState() => _SemanasState();
}

class _SemanasState extends State<Semanas> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
        physics: BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.width / 5.5,
          ),
          Container(
            height: 100,
            child: Card(
              borderOnForeground: true,
              semanticContainer: true,
              child: RaisedButton(
                child: Text(
                  'Semana 1',
                  textAlign: TextAlign.start,
                  style: TextStyle(color: Colors.white),
                  textScaleFactor: 2,
                ),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(50))),
                color: Colors.red,
                onPressed: () {},
              ),
            ),
          ),
        ],
      ),
    );
  }
}
