// ignore_for_file: avoid_unnecessary_containers

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import 'package:strong_core/SCREENS/basic_questions.dart';
import 'package:strong_core/SCREENS/forms.dart';
import 'package:flutter/gestures.dart';
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
  TextEditingController _passwordConfirmControler = TextEditingController();

  bool _obscureText = true;
  bool _obscureText2 = false;
  @override
  Widget build(BuildContext context) {
    final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
    var textPdf = """ Privacy Policy
TFESP built the Strong Core app as a Free app. This SERVICE is provided by TFESP at no cost and is intended for use as is.

This page is used to inform visitors regarding our policies with the collection, use, and disclosure of Personal Information if anyone decided to use our Service.

If you choose to use our Service, then you agree to the collection and use of information in relation to this policy. The Personal Information that we collect is used for providing and improving the Service. We will not use or share your information with anyone except as described in this Privacy Policy.

The terms used in this Privacy Policy have the same meanings as in our Terms and Conditions, which are accessible at Strong Core unless otherwise defined in this Privacy Policy.

Information Collection and Use

For a better experience, while using our Service, we may require you to provide us with certain personally identifiable information, including but not limited to Name, Date of birth, Weight, Activities, Employment information, . The information that we request will be retained by us and used as described in this privacy policy.

The app does use third-party services that may collect information used to identify you.

Link to the privacy policy of third-party service providers used by the app

Google Play Services
Google Analytics for Firebase
Firebase Crashlytics
Log Data

We want to inform you that whenever you use our Service, in a case of an error in the app we collect data and information (through third-party products) on your phone called Log Data. This Log Data may include information such as your device Internet Protocol (“IP”) address, device name, operating system version, the configuration of the app when utilizing our Service, the time and date of your use of the Service, and other statistics.

Cookies

Cookies are files with a small amount of data that are commonly used as anonymous unique identifiers. These are sent to your browser from the websites that you visit and are stored on your device's internal memory.

This Service does not use these “cookies” explicitly. However, the app may use third-party code and libraries that use “cookies” to collect information and improve their services. You have the option to either accept or refuse these cookies and know when a cookie is being sent to your device. If you choose to refuse our cookies, you may not be able to use some portions of this Service.

Service Providers

We may employ third-party companies and individuals due to the following reasons:

To facilitate our Service;
To provide the Service on our behalf;
To perform Service-related services; or
To assist us in analyzing how our Service is used.
We want to inform users of this Service that these third parties have access to their Personal Information. The reason is to perform the tasks assigned to them on our behalf. However, they are obligated not to disclose or use the information for any other purpose.

Security

We value your trust in providing us your Personal Information, thus we are striving to use commercially acceptable means of protecting it. But remember that no method of transmission over the internet, or method of electronic storage is 100% secure and reliable, and we cannot guarantee its absolute security.

Links to Other Sites

This Service may contain links to other sites. If you click on a third-party link, you will be directed to that site. Note that these external sites are not operated by us. Therefore, we strongly advise you to review the Privacy Policy of these websites. We have no control over and assume no responsibility for the content, privacy policies, or practices of any third-party sites or services.

Children’s Privacy

These Services do not address anyone under the age of 13. We do not knowingly collect personally identifiable information from children under 13 years of age. In the case we discover that a child under 13 has provided us with personal information, we immediately delete this from our servers. If you are a parent or guardian and you are aware that your child has provided us with personal information, please contact us so that we will be able to do the necessary actions.

Changes to This Privacy Policy

We may update our Privacy Policy from time to time. Thus, you are advised to review this page periodically for any changes. We will notify you of any changes by posting the new Privacy Policy on this page.

This policy is effective as of 2023-03-09

Contact Us

If you have any questions or suggestions about our Privacy Policy, do not hesitate to contact us at Tfesp2017@gmail.com.

This privacy policy page was created at privacypolicytemplate.net and modified/generated by App Privacy Policy Generator""";
    return Scaffold(
      body: ListView(children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                child: const Padding(
                  padding: EdgeInsets.only(top: 50.0),
                  child: Text(
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
              SizedBox(
                height: MediaQuery.of(context).size.height * .03,
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
                  obscureText: _obscureText,
                  style: TextStyle(color: Colors.white),
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                      suffixIcon: GestureDetector(
                        onTap: (() {
                          setState(() {
                            _obscureText = !_obscureText;
                          });
                        }),
                        child: Icon(_obscureText
                            ? Icons.visibility
                            : Icons.visibility_off),
                      ),
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
              SizedBox(
                height: 10,
              ),
              Container(
                child: TextFormField(
                  obscureText: _obscureText2,
                  style: TextStyle(color: Colors.white),
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    labelStyle: TextStyle(color: Colors.white),
                    suffixIcon: GestureDetector(
                      onTap: (() {
                        setState(() {
                          _obscureText2 = !_obscureText2;
                        });
                      }),
                      child: Icon(_obscureText2
                          ? Icons.visibility
                          : Icons.visibility_off),
                    ),
                    hintText: 'Confirme a senha',
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
                  ),
                  controller: _passwordConfirmControler,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Checkbox(
                    value: isActive,
                    onChanged: (value) => setState(() {
                      if (!isActive) {
                        isActive = true;
                      } else {
                        isActive = false;
                      }
                    }),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 18.0),
                    child: Container(
                      width: 200,
                      child: Text.rich(
                        TextSpan(
                            style: TextStyle(
                                color: Colors.grey[400], fontSize: 18),
                            text: 'Eu concordo com os ',
                            children: [
                              TextSpan(
                                  text: '\Termos de Uso e privacidade',
                                  style: TextStyle(
                                      fontSize: 15,
                                      color: Colors.black,
                                      decoration: TextDecoration.underline),
                                  recognizer: TapGestureRecognizer()
                                    ..onTap = (() {
                                      showDialog(
                                        context: context,
                                        builder: (context) => AlertDialog(
                                          actions: [
                                            TextButton(
                                                onPressed: () =>
                                                    Navigator.of(context).pop(),
                                                child: Text('Ok'))
                                          ],
                                          title: const Text('Termos de Uso',
                                              style: TextStyle(fontSize: 25)),
                                          content: SingleChildScrollView(
                                            child: Column(children: [
                                              Text(
                                                textPdf,
                                                style: TextStyle(fontSize: 20),
                                              ),
                                            ]),
                                          ),
                                        ),
                                      );
                                    })),
                            ]),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 25,
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
                      if (_passwordConfirmControler.text !=
                          _passwordControler.text) {
                        showDialog(
                          context: context,
                          builder: (context) => AlertDialog(
                            actions: [
                              TextButton(
                                  onPressed: () => Navigator.of(context).pop(),
                                  child: Text('Ok'))
                            ],
                            title: const Text('Senha',
                                style: TextStyle(fontSize: 25)),
                            content: Text(
                              'As senhas não são iguais',
                              style: TextStyle(fontSize: 20),
                            ),
                          ),
                        );
                      } else if (isActive != false) {
                        // Unhandled Exception:
                        //[firebase_auth/email-already-in-use] The email address is already in use by another account.

                        print(_emailControler.text);
                        if (_passwordControler.text != '' ||
                            _passwordControler.text.length > 5) {}
                        try {
                          await _firebaseAuth
                              .createUserWithEmailAndPassword(
                                  email: _emailControler.text,
                                  password: _passwordControler.text)
                              .then((value) => Navigator.of(context).push(
                                    MaterialPageRoute(
                                        builder: (constect) =>
                                            ChangeNotifierProvider<Information>(
                                                create: (context) =>
                                                    Information(),
                                                child: Forms()),
                                        settings: const RouteSettings()),
                                  ));
                        } on FirebaseAuthException catch (e) {
                          var message =
                              'Algo deu Errado!\ Preencha novamente os campos';
                          if (e.code == 'email-already-in-use') {
                            message =
                                'Esse email já está sendo usado. Por favor digite outro';
                          } else if (e.code == 'invalid-email') {
                            message = 'Esse email não é válido!';
                          } else if (e.code == 'operation-not-allowed') {
                            message = 'Operação não permitida!';
                          } else if (e.code == 'weak-password') {
                            message =
                                'Senha Fraca. Por favor crie uma senha com no mínimo 6 caracteres';
                          }
                          showDialog(
                            context: context,
                            builder: (context) => AlertDialog(
                              actions: [
                                TextButton(
                                    onPressed: () =>
                                        Navigator.of(context).pop(),
                                    child: Text('Ok'))
                              ],
                              title: const Text('Erro',
                                  style: TextStyle(fontSize: 25)),
                              content: Text(
                                message,
                                style: TextStyle(fontSize: 20),
                              ),
                            ),
                          );
                        }
                      } else {
                        showDialog(
                          context: context,
                          builder: (context) => AlertDialog(
                            actions: [
                              TextButton(
                                  onPressed: () => Navigator.of(context).pop(),
                                  child: Text('Ok'))
                            ],
                            title: const Text('Termos de Uso',
                                style: TextStyle(fontSize: 25)),
                            content: Text(
                              'Para proseguir é necessário concordar com os termos de uso',
                              style: TextStyle(fontSize: 20),
                            ),
                          ),
                        );
                      }
                    }),
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
