// ignore_for_file: prefer_const_constructors

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
// import 'package:flutter/src/widgets/container.dart';
// import 'package:flutter/src/widgets/framework.dart';
import 'package:samplefirebasee/firebaseservice.dart';

import 'package:samplefirebasee/homepage.dart';

class Loginpage extends StatefulWidget {
  const Loginpage({super.key});

  @override
  State<Loginpage> createState() => _LoginpageState();
}

class _LoginpageState extends State<Loginpage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [Colors.pink, Colors.black, Colors.indigo],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter)),
        child: Center(
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 30),
            child: ElevatedButton(
                onPressed: (() async {
                  await FirebaseServices().signInWithGoogle();
                  if (FirebaseAuth.instance.currentUser!.email!=null) {
                   
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Homepage(),
                      )); 
                  }
                }),
                child: Text('Signin with google')),
          ),
        ),
      ),
    );
  }
}
