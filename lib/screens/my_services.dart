import 'dart:async';
import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mj_pilab/screens/showapiweb.dart';

class MyServices extends StatefulWidget {
  @override
  _MyServicesState createState() => _MyServicesState();
}

class _MyServicesState extends State<MyServices> {
  //explicit
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  Widget myWiget = ShowApiWeb();

  //medthod
  Widget showSignOut() {
    return IconButton(
      icon: Icon(Icons.exit_to_app),
      onPressed: () {
        processSignOut();
      },
    );
  }

  Future<void> processSignOut() async {
    await firebaseAuth.signOut().then((response) {
      // firebaseAuth.currentUser() = null;
      exit(0);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(158, 158, 158, 0),
        title: Text('My Services'),
        actions: <Widget>[showSignOut()],
      ),
      body: myWiget,
    );
  }
}
