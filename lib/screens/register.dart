import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:mj_pilab/screens/my_services.dart';

class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  //explicit
  final formkey = GlobalKey<FormState>();
  String nameString, emailString, passwordString;

  FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  //method

 

  Widget nameText() {
    return TextFormField(
      decoration: InputDecoration(
        icon: Icon(
          Icons.account_box,
          size: 40.0,
          color: Colors.green,
        ),
        labelText: 'Name : ',
        labelStyle: TextStyle(color: Colors.green),
        helperText: 'Type Your Name',
        helperStyle: TextStyle(color: Colors.yellowAccent[700]),
        hintText: 'English Only',
      ),
      validator: (String valuename) {
        if (valuename.isEmpty) {
          return 'Plese fill name in bank';
        }
      },
      onSaved: (String value) {
        nameString = value;
      },
    );
  }

  Widget emailText() {
    return TextFormField(
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        icon: Icon(
          Icons.email,
          size: 40.0,
          color: Colors.black87,
        ),
        labelText: 'e-Mail : ',
        labelStyle: TextStyle(color: Colors.black),
        helperText: 'Type Your e-Mail',
        helperStyle: TextStyle(color: Colors.yellowAccent[700]),
        hintText: 'email@mail.com',
      ),
      validator: (String valueemail) {
        if (!((valueemail.contains('@')) && (valueemail.contains('.')))) {
          return 'Plese fill e-mail format';
        }
      },
      onSaved: (String value) {
        emailString = value;
      },
    );
  }

  Widget passwordText() {
    return TextFormField(
      decoration: InputDecoration(
        icon: Icon(
          Icons.vpn_key,
          size: 40.0,
          color: Colors.red,
        ),
        labelText: 'Password : ',
        labelStyle: TextStyle(color: Colors.red),
        helperText: 'Type Your password',
        helperStyle: TextStyle(color: Colors.yellowAccent[700]),
        hintText: 'xxxxxx',
      ),
      validator: (String value) {
        if (value.length < 6) {
          return 'Plese 6 chalector';
        }
      },
      onSaved: (String value) {
        passwordString = value;
      },
    );
  }

  Widget groupText() {
    return Form(
      key: formkey,
      child: ListView(
        padding: EdgeInsets.only(top: 50.0, left: 50.0, right: 50.0),
        children: <Widget>[nameText(), emailText(), passwordText()],
      ),
    );
  }

  Widget registerBtn() {
    return IconButton(
      tooltip: 'Register',
      icon: Icon(Icons.cloud_upload),
      onPressed: () {
        if (formkey.currentState.validate()) {
          formkey.currentState.save();

          uploadvalueTofriebase();
          setUpDisplayName();

          print(
              'Name : $nameString , E-Mail : $emailString , Password : $passwordString');
        }
      },
    );
  }

  Future<void> uploadvalueTofriebase() async {
    await firebaseAuth
        .createUserWithEmailAndPassword(
            email: emailString, password: passwordString)
        .then((response) {
      print('Register Success');
    }).catchError((response) {
      print('Registor Error : $response');

      String title = response.code;
      String desc = response.message;
      myAlter(title, desc);
    });
  }

  Future<void> setUpDisplayName() async {
    await firebaseAuth.currentUser().then((response) {
      UserUpdateInfo unserinfo = new UserUpdateInfo();
      unserinfo.displayName = nameString;
      response.updateProfile(unserinfo);
      var myservicerount =
          MaterialPageRoute(builder: (BuildContext context) => MyServices());
      Navigator.of(context)
          .pushAndRemoveUntil(myservicerount, (Route<dynamic> rount) => false);
    });
  }

  void myAlter(String title, String massage) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title),
          content: Text(massage),
          actions: <Widget>[
            FlatButton(
              child: Text('OK'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[registerBtn()],
        backgroundColor: Color.fromRGBO(158, 158, 158, 0),
        title: Text('Register'),
      ),
      body: groupText(),
    );
  }
}
