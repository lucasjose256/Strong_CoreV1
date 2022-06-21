// ignore_for_file: avoid_unnecessary_containers

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:strong_core/SCREENS/basic_questions.dart';
import 'package:strong_core/SCREENS/questions.dart';
import 'package:strong_core/SCREENS/screen_semanas.dart';

class SingUpPage extends StatefulWidget {
  const SingUpPage({Key? key}) : super(key: key);
//colocar após a pessoa fazer o registro, o formulario de questoes
//as quais somente poderam ser preenchidas nesse instante
  @override
  _SingUpPageState createState() => _SingUpPageState();
}

class _SingUpPageState extends State<SingUpPage> {
  bool isActive = false;

  @override
  Widget build(BuildContext context) {
    final TextEditingController _emailControler = TextEditingController();
    final TextEditingController _passwordControler = TextEditingController();
    final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * .06,
              ),
              const SizedBox(
                height: 90,
              ),
              const Text(
                'Registre-se',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 28,
                    color: Colors.black),
              ),
              const SizedBox(
                height: 40,
              ),
              const SizedBox(
                height: 14,
              ),
              Container(
                child: TextFormField(
                  validator: (value) => value != null && value.contains('@')
                      ? 'E-mail inválido'
                      : null,
                  controller: _emailControler,
                  style: const TextStyle(color: Colors.white),
                  keyboardType: TextInputType.emailAddress,
                  autofocus: false,
                  decoration: InputDecoration(
                      hintStyle: const TextStyle(color: Colors.white),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide: BorderSide.none),
                      fillColor: Colors.red[200],
                      icon: const Icon(
                        Icons.email,
                        color: Colors.red,
                      ),
                      filled: true,
                      //labelText: 'E-mail',
                      hintText: 'E-mail'),
                ),
              ),
              const SizedBox(
                height: 14,
              ),
              Container(
                child: TextFormField(
                  obscureText: true,
                  style: const TextStyle(color: Colors.white),
                  keyboardType: TextInputType.emailAddress,
                  autofocus: false,
                  decoration: InputDecoration(
                      hintStyle: const TextStyle(color: Colors.white),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide: BorderSide.none),
                      fillColor: Colors.red[200],
                      icon: const Icon(
                        Icons.lock,
                        color: Colors.red,
                      ),
                      filled: true,
                      hintText: 'Senha'),
                  controller: _passwordControler,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Checkbox(
                    value: isActive,
                    onChanged: (value) => null,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 18.0),
                    child: Text(
                      'I agree whit the terms and conditions\nand privacy policy',
                      style: TextStyle(color: Colors.grey[400], fontSize: 10),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width / 2,
                height: 50,
                child: MaterialButton(
                  color: Colors.red,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50)),
                  child: const Text(
                    'Registrar',
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                  onPressed: () async {
                    if (_passwordControler.text != '' ||
                        _passwordControler.text.length < 8) {}
                    await _firebaseAuth.createUserWithEmailAndPassword(
                        email: _emailControler.text,
                        password: _passwordControler.text);
                    Navigator.of(context).push(
                      MaterialPageRoute(
                          builder: (constect) => BasicQuestions(),
                          settings: const RouteSettings()),
                    );
                  },
                ),
              ),
              const SizedBox(
                height: 50,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
