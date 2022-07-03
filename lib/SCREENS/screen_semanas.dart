import 'package:expansion_card/expansion_card.dart';
import 'package:flutter/material.dart';

class Semanas extends StatelessWidget {
  const Semanas({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          // foregroundColor: Colors.orange,
          backgroundColor: Colors.red[800],
          title: const Center(
            child: Text('Strong Core',
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    fontFamily: 'Comfortaa')),
          ),
        ),
        body: buildSemanas(),
      ),
    );
  }

  Container buildSemanas() {
    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: 10,
        vertical: 15,
      ),
      child: Column(
        children: [
          ExpansionCard(
            borderRadius: 30,
            background:
                Image.network('https://thumb.mais.uol.com.br/16666100.jpg'),
            title: Container(
              child: const Padding(
                padding: EdgeInsets.only(
                  left: 40,
                ),
                child: Text(
                  'SEMANA 1',
                  style: TextStyle(
                    color: Color.fromARGB(255, 239, 235, 235),
                    fontSize: 38,
                    fontFamily: 'Comfortaa',
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ),
            ),
            children: [
              SizedBox(
                height: 40,
              ),
              Container(
                color: Colors.black,
                child: Text(
                  'Os exercícios para esta semana são:',
                  style: TextStyle(
                      color: Color.fromARGB(255, 255, 255, 254), fontSize: 18),
                ),
              ),
            ],
          ),
          SizedBox(height: 20),
          /////////////////////
          ExpansionCard(
            borderRadius: 30,
            background: Image.network(
              'https://i.insider.com/5f2320cd40c1f3752c73a185?width=1000&format=jpeg&auto=webp',
              scale: 1,
            ),
            title: Container(
              child: const Padding(
                padding: EdgeInsets.only(
                  left: 40,
                ),
                child: Text(
                  'SEMANA 2',
                  style: TextStyle(
                    color: Color.fromARGB(255, 239, 235, 235),
                    fontSize: 38,
                    fontFamily: 'Comfortaa',
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ),
            ),
            children: [
              SizedBox(
                height: 40,
              ),
              Container(
                color: Colors.black,
                child: Text(
                  'Os exercícios para esta semana são:',
                  style: TextStyle(
                      color: Color.fromARGB(255, 255, 255, 254), fontSize: 18),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
