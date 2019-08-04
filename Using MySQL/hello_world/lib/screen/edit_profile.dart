//
//  Created by Faiz Ikhwan on 4 August 2019.
//  Copyright © 2019 Faiz Ikhwan. All rights reserved.
//

import 'package:flutter/material.dart';

class EditProfile extends StatefulWidget {
  @override
  _EditProfileState createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {

  TextEditingController usernameController = TextEditingController();
  TextEditingController realNameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Edit profile"),),
      body: Center(
        child: Container(
          margin: EdgeInsets.all(30.0),
          child: Form(
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
                ),

                TextFormField(
                  controller: realNameController,
                  validator: (String text) {
                    if(text.isEmpty)
                      return "Real name cannot be empty";
                  },
                  decoration: InputDecoration(
                    labelText: "Real name",
                  ),
                ),

                TextFormField(
                  controller: passwordController,
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
}
