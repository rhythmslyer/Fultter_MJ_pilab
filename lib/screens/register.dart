import 'package:flutter/material.dart';

class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  //explicit

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
    );
  }

  Widget groupText() {
    return ListView(
      padding: EdgeInsets.only(top: 50.0, left: 50.0, right: 50.0),
      children: <Widget>[nameText(), emailText(), passwordText()],
    );
  }

  Widget registerBtn() {
    return IconButton(
      tooltip: 'Register',
      icon: Icon(Icons.cloud_upload),
      onPressed: () {
        print('Save Register');
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
