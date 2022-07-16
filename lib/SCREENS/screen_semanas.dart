import 'package:expansion_card/expansion_card.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:strong_core/MODELS/card_semana_model.dart';

import '../main.dart';

class Semanas extends StatelessWidget {
  const Semanas({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    User? user = FirebaseAuth.instance.currentUser;
    onRefrash(userCreed) {
      user = userCreed;
    }

    Future<void> logOut() async {
      await FirebaseAuth.instance.signOut();
      onRefrash(null);
    }

    return SafeArea(
      child: Scaffold(
        drawer: Drawer(
          // Add a ListView to the drawer. This ensures the user can scroll
          // through the options in the drawer if there isn't enough vertical
          // space to fit everything.
          child: ListView(
            // Important: Remove any padding from the ListView.
            padding: EdgeInsets.zero,
            children: [
              DrawerHeader(
                decoration: BoxDecoration(
                  color: Color.fromARGB(241, 186, 30, 22),
                ),
                child: Column(
                  children: [
                    Text(
                      user!.displayName!,
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                    SizedBox(
                      height: 6,
                    ),
                    CircleAvatar(
                      radius: 45,
                      backgroundImage: NetworkImage(user!.photoURL!),
                    )
                  ],
                ),
              ),
              ListTile(
                leading: Icon(Icons.question_mark),
                title: Text('Ajuda'),
                onTap: () {
                  // Update the state of the app.
                  // ...
                },
              ),
              ListTile(
                leading: Icon(Icons.settings),
                title: const Text('Configurações'),
                onTap: () {
                  // Update the state of the app.
                  // ...
                },
              ),
              ListTile(
                leading: Icon(Icons.exit_to_app),
                title: const Text('Sair'),
                onTap: () {
                  logOut();
                  Navigator.of(context).push(
                    MaterialPageRoute(
                        builder: (constect) => const MyHomePage(),
                        settings: const RouteSettings()),
                  );
                  // Update the state of the app.
                  // ...
                },
              ),
            ],
          ),
        ),
        appBar: AppBar(
          //   automaticallyImplyLeading: false,

          centerTitle: true,
          // foregroundColor: Colors.orange,
          backgroundColor: Colors.red[800],
          title: const Text('Strong Core',
              style: TextStyle(
                  fontSize: 21,
                  fontWeight: FontWeight.w600,
                  fontFamily: 'Comfortaa')),
        ),
        body: buildSemanas(),
      ),
    );
  }

  Container buildSemanas() {
    return Container(
      margin: const EdgeInsets.only(left: 10, right: 10, top: 10),
      child: ListView(
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
              const SizedBox(
                height: 40,
              ),
              Container(
                color: Colors.black,
                child: const Text(
                  'Os exercícios para esta semana são:',
                  style: TextStyle(
                      color: Color.fromARGB(255, 255, 255, 254), fontSize: 18),
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
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
              const SizedBox(
                height: 40,
              ),
              Container(
                color: Colors.black,
                child: const Text(
                  'Os exercícios para esta semana são:',
                  style: TextStyle(
                      color: Color.fromARGB(255, 255, 255, 254), fontSize: 18),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          CardSemanas(
            title: 'SEMANA 3',
          ),
        ],
      ),
    );
  }
}
