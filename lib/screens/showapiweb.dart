import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:mj_pilab/model/profile.dart';

class ShowApiWeb extends StatefulWidget {
  @override
  _ShowApiWebState createState() => _ShowApiWebState();
}

class _ShowApiWebState extends State<ShowApiWeb> {
  // Expilicit
  String urlAPI = 'https://jsonplaceholder.typicode.com/photos';
  List<ProfileModel> profiles = new List<ProfileModel>();

  // Method
  Future<void> readApi() async {
    var respones = await http.get(urlAPI);
    if (respones.statusCode == 200) {
      var result = json.decode(respones.body);
      // print('result : $result');
      for (var profile in result) {
        ProfileModel profileModel = ProfileModel.formAPI(profile);
        setState(() {
          profiles.add(profileModel);
        });
      }
    }
  }

  @override
  void initState() {
    super.initState();
    readApi();
  }

  Widget myListview(int index) {
    return Container(
      child: Row(
        children: <Widget>[
          Container(
            width: MediaQuery.of(context).size.width * 0.4,
            child: Image.network(profiles[index].thumbnailUrl),
          ),
          Container(
            width: MediaQuery.of(context).size.width * 0.4,
            child: Text(profiles[index].title),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: profiles.length,
      itemBuilder: (BuildContext context, int index) {
        return GestureDetector(
          child: myListview(index),
          onTap: () {
            // print('your click : ${profiles[index].title}');
            printModel(profiles[index]);
          },
        );
      },
    );
  }
}

void printModel(ProfileModel model){
  int albumId = model.albumId;
  int id = model.id;
  String title = model.title;
  String url = model.url;
  String thumbnailUrl = model.thumbnailUrl;
  print('albumId : $albumId');
  print('id : $id');
  print('title : $title');
  print('url : $url');
  print('thumbnailUrl : $thumbnailUrl');


}