// ignore_for_file: avoid_unnecessary_containers

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:strong_core/SCREENS/basic_questions.dart';
import 'package:strong_core/SCREENS/forms.dart';

import '../provider/information_forms.dart';

class SingUpPage extends StatefulWidget {
  SingUpPage({Key? key}) : super(key: key);

  @override
  State<SingUpPage> createState() => _SingUpPageState();
}

class _SingUpPageState extends State<SingUpPage> {
//colocar após a pessoa fazer o registro, o formulario de questoes
  bool isActive = false;
  TextEditingController _emailControler = TextEditingController();
  TextEditingController _passwordControler = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

    return Scaffold(
      body: ListView(children: [
        Padding(
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
                  controller: _emailControler,
                  onChanged: (value) {
                    setState(() {});
                  },
                  style: TextStyle(color: Colors.white),
                  keyboardType: TextInputType.emailAddress,
                  autofocus: false,
                  decoration: InputDecoration(
                      hintStyle: TextStyle(color: Colors.white),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide: BorderSide.none),
                      fillColor: Colors.red[200],
                      icon: Icon(
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
                  style: TextStyle(color: Colors.white),
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                      hintStyle: TextStyle(color: Colors.white),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide: BorderSide.none),
                      fillColor: Colors.red[200],
                      icon: Icon(
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
                    // Unhandled Exception:
                    //[firebase_auth/email-already-in-use] The email address is already in use by another account.

                    print(_emailControler.text);
                    if (_passwordControler.text != '' ||
                        _passwordControler.text.length > 5) {}
                    await _firebaseAuth.createUserWithEmailAndPassword(
                        email: _emailControler.text,
                        password: _passwordControler.text);
                    Navigator.of(context).push(
                      MaterialPageRoute(
                          builder: (constect) =>
                              ChangeNotifierProvider<Information>(
                                  create: (context) => Information(),
                                  child: Forms()),
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
      ]),
    );
  }
}
