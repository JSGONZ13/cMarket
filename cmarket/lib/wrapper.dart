
import 'package:cmarket/Home/home.dart';
import 'package:cmarket/Menu/menu.dart';
import 'package:cmarket/Models/user.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatelessWidget {
 

  @override
  Widget build(BuildContext context) {
    //Return Catalogo or Authentification

    final user = Provider.of<User>(context);
    if (user == null) {
      return Home();
    } else {
      print(user.uid);
      return Menu();
    }
  }

}