//
//  Created by Faiz Ikhwan on 4 August 2019.
//  Copyright © 2019 Faiz Ikhwan. All rights reserved.
//

import 'package:flutter/material.dart';

class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {

  TextEditingController usernameController = TextEditingController();
  TextEditingController realnameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Register"),),
      body: Center(
        child: Container(
          margin: EdgeInsets.only(top: 20.0, left: 15.0, right: 15.0),
          child: Column(
            children: <Widget>[

              Text("Register"),

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
                      controller: realnameController,
                      validator: (String text) {
                        if(text.isEmpty)
                          return "Real name cannot be empty";
                      },
                      decoration: InputDecoration(
                        labelText: "Real name",
                      ),
                    ), // end TextFormField Real name

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

                    TextFormField(
                      controller: confirmPasswordController,
                      obscureText: true, // password
                      validator: (String text) {
                        if(text.isEmpty)
                          return "Password cannot be empty";
                      },
                      decoration: InputDecoration(
                        labelText: "Confirm password",
                      ),
                    ), // end TextFormField Confirm password

                    RaisedButton(
                      child: Text("Register"),
                      onPressed: () {
                        if(formKey.currentState.validate()) {
                          String username = usernameController.text;
                          String realName = realnameController.text;
                          String password = passwordController.text;
                          String confirmPassword = confirmPasswordController.text;
                          // AUTHENTICATION
                        }
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
}
