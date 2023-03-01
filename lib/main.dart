// ignore_for_file: prefer_const_constructors
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:splash_screen_view/SplashScreenView.dart';
import 'package:strong_core/MODELS/user_preferences.dart';
import 'package:strong_core/SCREENS/basic_questions.dart';
import 'package:strong_core/SCREENS/corpo_humano.dart';
import 'package:strong_core/SCREENS/forms.dart';
import 'package:strong_core/SCREENS/questions.dart';
import 'package:strong_core/SCREENS/screen_semanas.dart';
import 'package:strong_core/SCREENS/sing_up_Page.dart';
import 'package:strong_core/provider/colors2.dart';
import 'package:strong_core/provider/information_forms.dart';
import 'package:strong_core/style/add_pop_up_card.dart';

import 'API/google_sign_in.dart';
import 'SCREENS/auxiliar_corpo_humano.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await UserPreferences.init();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  bool? flag;

  DateTime? horario;

  bool? primeiroAcessoCompleto;
  @override
  void initState() {
    super.initState();

    primeiroAcessoCompleto = UserPreferences.getBool() as bool ?? false;
  }

  void caregaMap() async {
    final DocumentSnapshot dadosUsuario = await FirebaseFirestore.instance
        .collection('user')
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .get();
    //mudar para um provider
    setState(() {
      primeiroAcessoCompleto = dadosUsuario.get('PRIMEIRO_ACESSO_COMPLETO');
    });
    //PRECISO CRIAR UMA FUNÇAO PARA SETAR ESSE CAMPO COMO FALSO AO INICIO
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // Get the firebase user

    User? firebaseUser = FirebaseAuth.instance.currentUser;
// Define a widget
    Widget firstWidget;
    Widget secondWidget;

// Assign widget based on availability of currentUser

    if (firebaseUser != null) {
      print(primeiroAcessoCompleto);
      if (primeiroAcessoCompleto!) {
        firstWidget = Semanas();
      } else {
        firstWidget = ChangeNotifierProvider<Information>(
            create: (context) => Information(), child: Forms());
      } //Question();
      //firstWidget = Semanas();
    } else {
      firstWidget = MyHomePage(primeiroAcessoCompleto!);
    }
    return ChangeNotifierProvider(
        create: (context) => GoogleSignInProvider(),
        child: MaterialApp(
            //  initialRoute: '/splash',
            routes: {
              //     '/splash': (_) => SingUpPage(),
            },
            debugShowCheckedModeBanner: false,
            title: 'Flutter Demo',
            theme: ThemeData(
              primarySwatch: Colors.red,
            ),
            home: SplashScreenView(
              navigateRoute: firstWidget,
              duration: 1800,
              text: 'Strong Core',
              textStyle: TextStyle(
                  color: Colors.white,
                  fontFamily: 'Comfortaa',
                  fontSize: 32,
                  fontWeight: FontWeight.w500),
              backgroundColor: Colors.red,
            )));
  }
}

class MyHomePage extends StatelessWidget {
  final bool isLandingPage;
  MyHomePage(this.isLandingPage);
  final TextEditingController _emailControler = TextEditingController();
  final TextEditingController _passwordControler = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
    Widget landingWidget;

    return WillPopScope(
      onWillPop: () => Future.value(false),
      child: Scaffold(
          //backgroundColor: Color.fromRGBO(254, 159, 103, 1),
          /* appBar: AppBar(
            // foregroundColor: Colors.orange,
    
            backgroundColor: Colors.red[800],
            title: Center(
              child: Text('Strong Core',
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      fontFamily: 'Comfortaa')),
            ),
          ),*/
          body: Padding(
        padding: const EdgeInsets.only(left: 10, right: 10),
        child: ListView(
          children: [
            SizedBox(
              height: 50,
            ),
            Container(
              child: Padding(
                padding: const EdgeInsets.only(top: 50.0),
                child: const Text(
                  'Seja bem-vindo ao Strong Core!',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 35,
                      color: Colors.black),
                ),
              ),
              height: 150,
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              child: Text(
                'Insira seu e-mail e senha para continuar',
                textAlign: TextAlign.center,
              ),
            ),
            //e-mail
            SizedBox(height: 17),
            Container(
              child: TextFormField(
                controller: _emailControler,
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
            //////////////////////                       SENHA
            SizedBox(height: 17),
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
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: 20,
                ),
                ElevatedButton(
                  child: Text('Entrar', style: TextStyle(fontSize: 14)),
                  style: ButtonStyle(
                    foregroundColor: MaterialStateProperty.all<Color>(
                        Color.fromARGB(255, 255, 255, 255)),
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Colors.red),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(50)),
                      ),
                    ),
                  ),
                  onPressed: () async {
                    await _firebaseAuth.signInWithEmailAndPassword(
                        email: _emailControler.text,
                        password: _passwordControler.text);
                    if (isLandingPage) {
                      landingWidget = Semanas();
                    } else {
                      landingWidget = ChangeNotifierProvider<Information>(
                          create: (context) => Information(), child: Forms());
                    }
                    Navigator.of(context).push(
                      MaterialPageRoute(
                          builder: (constect) => landingWidget,
                          settings: RouteSettings()),
                    );
                  },
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
                    child: ElevatedButton(
                  child:
                      Text('Entrar com google', style: TextStyle(fontSize: 14)),
                  style: ButtonStyle(
                    foregroundColor:
                        MaterialStateProperty.all<Color>(Colors.white),
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Colors.blue),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(50)),
                      ),
                    ),
                  ),
                  onPressed: () async {
                    final provider = Provider.of<GoogleSignInProvider>(context,
                        listen: false);
                    await provider.googleLogin();

                    if (isLandingPage) {
                      landingWidget = Semanas();
                    } else {
                      await FirebaseFirestore.instance
                          .collection('user')
                          .doc(FirebaseAuth.instance.currentUser!.uid)
                          .set({
                        'PRIMEIRO_ACESSO_COMPLETO': false,
                      });
                      landingWidget = ChangeNotifierProvider<Information>(
                          create: (context) => Information(), child: Forms());
                    }
                    Navigator.of(context).push(
                      MaterialPageRoute(
                          builder: (constect) => landingWidget,
                          settings: RouteSettings()),
                    );
                  },
                )),
              ],
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  ' Não possui uma conta?',
                  textAlign: TextAlign.center,
                ),
                TextButton(
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                          builder: (constect) => SingUpPage(),
                          settings: RouteSettings()),
                    );
                  },
                  child: Text(
                    'Registre-se',
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.red),
                  ),
                ),
                const SizedBox(height: 1),
              ],
            ),
          ],
        ),
      ) // This trailing comma makes auto-formatting nicer for build methods.
          ),
    );
  }
}
