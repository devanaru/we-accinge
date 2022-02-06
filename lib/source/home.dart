import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:firebase_study/source/login.dart';
import 'package:flutter/material.dart';
import 'dart:async';

class Home extends StatefulWidget {
  Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final auth = FirebaseAuth.instance;
  final firestore = FirebaseFirestore.instance;
  getdata(String component) async {
    List<String> doctor = <String>[];
    CollectionReference categories = firestore.collection('stock_items');
    DocumentSnapshot snap = await categories.doc('stock1').get();
    var data = snap.data() as Map;
    var items = data['items'] as List<dynamic>;
    items.forEach((element) {
      String curr = element[component];
      doctor.add(curr);
    });
    return (doctor);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            backgroundColor: Colors.blueGrey,
            title: const Text('We-Accinge'),
            actions: [
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pushReplacement(
                      MaterialPageRoute(builder: (context) => Login()));
                },
                child: Text('SIGN OUT'),
                style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all(Colors.blueGrey)),
              )
            ]),
        body:  Column(
          
        ));
  }
}
