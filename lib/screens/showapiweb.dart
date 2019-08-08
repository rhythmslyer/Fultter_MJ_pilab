import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;


class ShowApiWeb extends StatefulWidget {
  @override
  _ShowApiWebState createState() => _ShowApiWebState();
}

class _ShowApiWebState extends State<ShowApiWeb> {
  // Expilicit
  String urlAPI = 'https://jsonplaceholder.typicode.com/photos';
  

  // Method
  Future<void> readApi() async{
    print('Start Get API');
     var respones = await http.get(urlAPI);
     if (respones.statusCode == 200) {
       var result = json.decode(respones.body);
       print('result : $result');

       
     }

  }

  @override
  void initState() {
    super.initState();
    readApi();
  }

  @override
  Widget build(BuildContext context) {
    return Text('This is aBook');
  }
}