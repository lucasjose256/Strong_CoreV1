import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SingUpPage extends StatefulWidget {
  const SingUpPage({Key? key}) : super(key: key);

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
              const SizedBox(
                height: 14,
              ),
              Container(
                child: TextFormField(
                  obscureText: true,
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
                    onChanged: (value) => setState(() {
                      isActive = value!;
                    }),
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
                    'Sign up',
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                  onPressed: () async {
                    await _firebaseAuth.createUserWithEmailAndPassword(
                        email: _emailControler.text,
                        password: _passwordControler.text);
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
