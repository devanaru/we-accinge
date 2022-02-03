import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_study/source/home.dart';
import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  String _email='', _password='';
  final auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('LOGIN'),
          backgroundColor: Colors.blueGrey,
        ),
        body: Column(children: <Widget>[
          TextField(
            keyboardType: TextInputType.emailAddress,
            decoration: const InputDecoration(
              hintText: 'EMAIL',
            ),
            onChanged: (value) {
              _email = value.trim();
            },
          ),
          TextField(
            obscureText: true,
            decoration: const InputDecoration(
              hintText: 'PASSWORD',
            ),
            onChanged: (value) {
              _password = value.trim();
            },
          ),
          Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                onPressed: () {
                  auth.signInWithEmailAndPassword(
                      email: _email, password: _password);
                   Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => Home()));
                },
                child: const Text('LOGIN'),
                style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all(Colors.blueGrey)),
              ))
        ]));
  }
}
