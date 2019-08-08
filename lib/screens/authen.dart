import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mj_pilab/screens/my_services.dart';

class Authen extends StatefulWidget {
  @override
  _AuthenState createState() => _AuthenState();
}

class _AuthenState extends State<Authen> {
  // explicit
  final formkey = GlobalKey<FormState>();
  String emailString = '', passwordString = '';
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  final scaffoldkey = GlobalKey<ScaffoldState>();

  //method
  Widget emailText() {
    return Container(
      alignment: Alignment.center,
      child: Container(
        width: 200.0,
        child: TextFormField(
          keyboardType: TextInputType.emailAddress,
          decoration: InputDecoration(labelText: 'e-Mail'),
          onSaved: (String value) {
            emailString = value;
          },
        ),
      ),
    );
  }

  Widget passwordText() {
    return Container(
      alignment: Alignment.center,
      child: Container(
        width: 200.0,
        child: TextFormField(
          obscureText: true,
          decoration: InputDecoration(labelText: 'Password'),
          onSaved: (String value) {
            passwordString = value;
          },
        ),
      ),
    );
  }

  Future<void> checkAuthen() async {
    await firebaseAuth
        .signInWithEmailAndPassword(
            email: emailString, password: passwordString)
        .then((response) {
      MaterialPageRoute myservicerount =
          MaterialPageRoute(builder: (BuildContext context) => MyServices());
      Navigator.of(context)
          .pushAndRemoveUntil(myservicerount, (Route<dynamic> rount) => false);
    }).catchError((response) {
      String errorMessageString = response.message;
      mySnacBar(errorMessageString);
    });
  }

  void mySnacBar(String messageString) {
    var snackBar = SnackBar(
      backgroundColor: Color.fromRGBO(158, 158, 158, 0),
      content: Text(messageString),
    );
    scaffoldkey.currentState.showSnackBar(snackBar);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldkey,
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(158, 158, 158, 0),
        title: Text('Authen'),
      ),
      body: Form(
        key: formkey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[emailText(), passwordText()],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color.fromRGBO(158, 158, 158, 0),
        child: Icon(Icons.navigate_next),
        onPressed: () {
          formkey.currentState.save();
          print('e-mail : $emailString , pssword : $passwordString');
          checkAuthen();
          // firebaseAuth.signInWithEmailAndPassword(email: emailString,password: passwordString).then((response){

          // });
        },
      ),
    );
  }
}
