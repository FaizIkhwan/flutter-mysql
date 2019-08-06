//
//  Created by Faiz Ikhwan on 6 August 2019.
//  Copyright © 2019 Faiz Ikhwan. All rights reserved.
//

import 'package:flutter/material.dart';
import 'package:hello_world/screen/edit_profile.dart';
import 'package:hello_world/screen/homepage.dart';
import 'package:hello_world/screen/login.dart';
import 'package:hello_world/screen/register.dart';

class NavigatorHelper {

  static void goToHomepage(BuildContext context, String username, String realname) {
    Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => HomePage(username, realname),
    ));
  }

//  static void goToHomepageWithoutTurnBack(BuildContext context) {
//    Navigator.pushReplacement(context, MaterialPageRoute(
//      builder: (BuildContext context) => HomePage(),
//    ));
//  }

  static void goToEditProfile(BuildContext context, String username) {
    Navigator.push(context, MaterialPageRoute(
        builder: (context) => EditProfile(username)),
    );
  }

  static void goToLogin(BuildContext context) {
    Navigator.push(context, MaterialPageRoute(
        builder: (context) => Login()),
    );
  }

  static void goToRegister(BuildContext context) {
    Navigator.push(context, MaterialPageRoute(
        builder: (context) => Register()),
    );
  }

}

