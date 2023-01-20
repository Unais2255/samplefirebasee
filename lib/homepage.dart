import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
// import 'package:flutter/src/widgets/container.dart';
// import 'package:flutter/src/widgets/framework.dart';
// import 'package:firebase_core/firebase_core.dart';

import 'package:samplefirebasee/Loginpage.dart';
import 'package:samplefirebasee/firebaseservice.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          children: [
            ElevatedButton(
                onPressed: () async {
                  await FirebaseServices().signOut();
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Loginpage(),
                      ));
                },
                child: Text("Log out")),
            Text(FirebaseAuth.instance.currentUser!.email!),
            Text(FirebaseAuth.instance.currentUser!.displayName!),
            Image.network(FirebaseAuth.instance.currentUser!.photoURL!),
            // Text(FirebaseAuth.instance.currentUser!.phoneNumber!),
          ],
        ),

        // levatedButton(
        //     child: Text('Logout'),
        //     style: ElevatedButton.styleFrom(
        //       primary: Color.fromARGB(255, 23, 6, 255),
        //     ),
        //     onPressed: () async {
        //       await FirebaseServices().signOut();
        //       Navigator.push(
        //         context,
        //         MaterialPageRoute(builder: (context) => const loginpage()),
        //       );
        //     }),
      ),
    );
  }
}
