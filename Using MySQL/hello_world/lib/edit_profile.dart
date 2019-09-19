//
//  Created by Faiz Ikhwan on 4 August 2019.
//  Copyright © 2019 Faiz Ikhwan. All rights reserved.
//

import 'package:flutter/material.dart';
import 'package:hello_world/homepage.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

class EditProfile extends StatefulWidget {

  final String username;

  EditProfile(this.username);

  @override
  _EditProfileState createState() => _EditProfileState(this.username);
}

class _EditProfileState extends State<EditProfile> {

  final String ipAddress = "35.240.250.178";
  final String username;

  _EditProfileState(this.username);

  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  var formKey = GlobalKey<FormState>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getInformation(username);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Edit profile"),),
      resizeToAvoidBottomPadding: false,
      body: Center(
        child: Container(
          margin: EdgeInsets.all(30.0),
          child: Form(
            key: formKey,
            child: Column(
              children: <Widget>[

                TextFormField(
                  controller: firstNameController,
                  validator: (String text) {
                    if(text.isEmpty)
                      return "First name cannot be empty";
                  },
                  decoration: InputDecoration(
                    labelText: "First name",
                  ),
                ),

                TextFormField(
                  controller: lastNameController,
                  validator: (String text) {
                    if(text.isEmpty)
                      return "Last name cannot be empty";
                  },
                  decoration: InputDecoration(
                    labelText: "Last name",
                  ),
                ),

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
                ),

                RaisedButton(
                  child: Text("Update"),
                  onPressed: () {
                    if(formKey.currentState.validate()) {
                      debugPrint("UPDATE");
                      String firstName = firstNameController.text;
                      String lastName = lastNameController.text;
                      String password = passwordController.text;
                      updateInfo(username, firstName, lastName, password);
                    }
                  },
                ),

              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> getInformation(String username) async {
    final response = await http.post("http://${ipAddress}/getinfo.php", body: {
      "username" : username,
    });

    var datauser =  json.decode(response.body);

    String p = datauser[0]["password"];
    String fn = datauser[0]["first_name"];
    String ln = datauser[0]["last_name"];

    setState(() {
      firstNameController.text = fn;
      lastNameController.text = ln;
      passwordController.text = p;
    });
  }

  Future<void> updateInfo(String username, String firstName, String lastName, String password) async {
    final response = await http.post("http://${ipAddress}/sendinfo.php", body: {
      "username" : username,
      "first_name" : firstName,
      "last_name" : lastName,
      "password" : password,
    });

    var realname = "${firstName} ${lastName}";
    Navigator.push(context, MaterialPageRoute(
       builder: (BuildContext context) => HomePage(username, realname)
    ));
  }

}
