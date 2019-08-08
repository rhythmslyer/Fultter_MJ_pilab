import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mj_pilab/screens/home.dart';

main() {
  runApp(Paputor());
}

class Paputor extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Home(),
    );
  }
}
