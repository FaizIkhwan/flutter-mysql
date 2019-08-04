//
//  Created by Faiz Ikhwan on 4 August 2019.
//  Copyright © 2019 Faiz Ikhwan. All rights reserved.
//

import 'package:flutter/material.dart';
import 'edit_profile.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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

              Text("NAME"),

              RaisedButton(
                child: Text("Edit profile information"),
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(
                      builder: (context) => EditProfile()),
                  );
                },
              ),

              RaisedButton(
                child: Text("Delete account"),
                onPressed: () {
                  // DELETE ACCOUNT
                },
              ),

            ],
          ),
        ),
      ),
    );
  }
}
