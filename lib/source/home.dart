import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_study/source/login.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  Home({Key? key}) : super(key: key);
  final auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return Container(
        child: ElevatedButton(
            onPressed: () {
              auth.signOut();
              Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (context) => Login()));
            },
            child: Text('LOG OUT')));
  }
}
