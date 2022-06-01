// ignore_for_file: avoid_unnecessary_containers, file_names

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:strong_core/splash_page.dart';

import 'google_sign_in.dart';

class UISingIn extends StatelessWidget {
  const UISingIn({Key? key}) : super(key: key);
  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => GoogleSignInProvider(),
      child: MaterialApp(
        initialRoute: '/splash',
        routes: {
          '/splash': (_) => SplashPage(),
        },
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.red,
        ),
        home: ListView(
          children: [
            Container(
              child: Padding(
                padding: const EdgeInsets.only(top: 60.0),
                child: Text(
                  'Seja bem vindo ao Strong Core!',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.w400,
                      fontFamily: 'Comfortaa'),
                ),
              ),
              height: 150,
            ),
            Container(
              child: Text(
                'Crie um usuário e digite seu e-mail para continuar',
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(height: 20),
            Container(
              child: TextFormField(
                keyboardType: TextInputType.emailAddress,
                autofocus: false,
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: BorderSide.none),
                    fillColor: Colors.red[200],
                    icon: Icon(
                      Icons.person,
                      color: Colors.red,
                    ),
                    filled: true,
                    //labelText: 'E-mail',
                    hintText: 'Usuário'),
                style: TextStyle(color: Colors.white),
              ),
            ),

            //e-mail
            SizedBox(height: 17),
            Container(
              child: TextFormField(
                style: TextStyle(color: Colors.white),
                keyboardType: TextInputType.emailAddress,
                autofocus: false,
                decoration: InputDecoration(
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
            //senha
            SizedBox(height: 17),
            Container(
              child: TextFormField(
                style: TextStyle(color: Colors.white),
                keyboardType: TextInputType.emailAddress,
                autofocus: false,
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: BorderSide.none),
                    fillColor: Colors.red[200],
                    icon: Icon(
                      Icons.lock,
                      color: Colors.red,
                    ),
                    filled: true,
                    //labelText: 'E-mail',
                    hintText: 'Senha'),
              ),
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: 20,
                ),
                RaisedButton(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(50))),
                  color: Colors.red[800],
                  child: Text(
                    "Entrar",
                    style: TextStyle(color: Colors.white),
                  ),
                  onPressed: () {},
                ),
                SizedBox(
                  width: 5,
                ),
                const Text(
                  'ou',
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  width: 10,
                ),
                Center(
                  child: RaisedButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(50))),
                    color: Colors.blue[300],
                    child: Text(
                      "Entrar com Google",
                      style: TextStyle(color: Colors.white),
                    ),
                    onPressed: () {
                      final provider = Provider.of<GoogleSignInProvider>(
                          context,
                          listen: false);
                      provider.googleLogin();
                    },
                  ),
                ),
              ],
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  ' Já possui uma conta?',
                  textAlign: TextAlign.center,
                ),
                TextButton(
                  onPressed: () {},
                  child: Text(
                    'Sing In',
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.red),
                  ),
                ),
                const SizedBox(height: 1),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
