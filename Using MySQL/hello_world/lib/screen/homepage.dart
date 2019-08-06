//
//  Created by Faiz Ikhwan on 4 August 2019.
//  Copyright © 2019 Faiz Ikhwan. All rights reserved.
//

import 'package:flutter/material.dart';
import 'package:hello_world/utils/NavigatorHelper.dart';
import 'dart:async';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {

  final String realname;
  final String username;

  HomePage(this.username, this.realname);

  @override
  _HomePageState createState() => _HomePageState(this.username, this.realname);

}

class _HomePageState extends State<HomePage> {

  final String realname;
  final String username;

  _HomePageState(this.username, this.realname);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Homepage"),
      ),
      body: Center(
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[

              Text("Welcome"),

              Text(realname),

              RaisedButton(
                child: Text("Edit profile information"),
                onPressed: () {
                  NavigatorHelper.goToEditProfile(context, username);
                },
              ),

              RaisedButton(
                child: Text("Delete account"),
                onPressed: () {
                  deleteAccount(username);
                },
              ),

            ],
          ),
        ),
      ),
    );
  }

  Future<void> deleteAccount(String username) async {
    final response = await http.post("http://35.197.148.177/deleteaccount.php", body: {
      "username" : username,
    });

    NavigatorHelper.goToLogin(context);
  }

}
