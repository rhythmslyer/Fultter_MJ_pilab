import 'dart:ui' as prefix0;

import 'package:flutter/material.dart';
import 'package:mj_pilab/main.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  //Explicit
  double mywidth = 200.0;
  double myheight = 200.0;
  double myh1 = 36.0;

  //Method

  Widget signUpBtnHome() {
    return Container(
      child: OutlineButton(
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
        child: Text(
          'Sign Up',
          style: TextStyle(color: Colors.black),
        ),
        onPressed: () {},
      ),
      width: 200.0,
    );
  }

  Widget signInBtnHome() {
    return Container(
      width: 200.0,
      child: RaisedButton(
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
        color: Colors.black87,
        child: Text(
          'Sign In',
          style: TextStyle(color: Colors.white),
        ),
        onPressed: () {},
      ),
    );
  }

  Widget showAppname() {
    return Text(
      'MJ Putor',
      style: TextStyle(
          fontSize: myh1,
          color: Colors.grey,
          fontWeight: FontWeight.bold,
          fontFamily: 'Montserrat'),
    );
  }

  Widget showAppLogo() {
    return Container(
      alignment: Alignment.center,
      child: Container(
        width: mywidth,
        height: myheight,
        child: Image.asset('images/jw.png'),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: RadialGradient(
            colors: [Colors.white, Colors.black],radius: 1.5,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            showAppLogo(),
            showAppname(),
            signInBtnHome(),
            signUpBtnHome()
          ],
        ),
      ),
    );
  }
}
