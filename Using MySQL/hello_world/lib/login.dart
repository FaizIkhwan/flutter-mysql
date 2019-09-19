//
//  Created by Faiz Ikhwan on 4 August 2019.
//  Copyright © 2019 Faiz Ikhwan. All rights reserved.
//

import 'package:flutter/material.dart';
import 'package:hello_world/register.dart';
import 'package:hello_world/homepage.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {

  final String ipAddress = "35.240.250.178";
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Login"),),
      resizeToAvoidBottomPadding: false,
      body: Center(
        child: Container(
          margin: EdgeInsets.only(top: 20.0, left: 15.0, right: 15.0),
          child: Column(
            children: <Widget>[

              Text("Login"),

              Form(
                key: formKey,
                child: Column(
                  children: <Widget>[

                    TextFormField(
                      controller: usernameController,
                      validator: (String text) {
                        if(text.isEmpty)
                          return "Username cannot be empty";
                      },
                      decoration: InputDecoration(
                          labelText: "Username",
                      ),
                    ), // end TextFormField Username

                    TextFormField(
                      controller: passwordController,
                      obscureText: true, // password
                      validator: (String text) {
                        if(text.isEmpty)
                          return "Password cannot be empty";
                      },
                      decoration: InputDecoration(
                        labelText: "Password",
                      ),
                    ), // end TextFormField Password

                    RaisedButton(
                      child: Text("Login"),
                      onPressed: () {
                        if(formKey.currentState.validate()) {
                          String username = usernameController.text;
                          String password = passwordController.text;

                          login(username, password);
                        }
                      },
                    ), // end RaisedButton

                    RaisedButton(
                      child: Text("Register"),
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(
                            builder: (context) => Register()),
                        );
                      },
                    ), // end RaisedButton

                  ],
                ),

              ), // end form

            ],
          ), // end column
        ),
      ),
    );
  }

  Future<void> login(String username, String password) async{
    try {
      final response = await http.post("http://${ipAddress}/loginn.php", body: {
        "username" : username,
        "password" : password,
      });

      var datauser =  json.decode(response.body);

      String u = datauser[0]["username"];
      String fn = datauser[0]["first_name"];
      String ln = datauser[0]["last_name"];

      String realname = "${fn} ${ln}";
      Navigator.push(context, MaterialPageRoute(
        builder: (BuildContext context) => HomePage(u, realname),
      ));

    }catch (e) {
      _showDialog("Login Failed!");
    }
  }

  void _showDialog(String title) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title),
          shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(20.0)),
          actions: <Widget>[
            new FlatButton(
              child: Text("Close"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

}
