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
  Widget showAppname() {
    return Text(
      'MJ Putor',
      style: TextStyle(
          fontSize: myh1, color: Colors.grey, fontWeight: FontWeight.bold,fontFamily: 'Montserrat'),
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
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[showAppLogo(), showAppname()],
      ),
    );
  }
}
