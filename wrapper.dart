import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:uumlofoss/models/user.dart';
import 'package:uumlofoss/screenlofoss/home/home.dart';
import 'package:uumlofoss/screenlofoss/authenticate/authenticate.dart';


class Wrapper extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
  
   final user = Provider.of<User>(context);
   print(user);
   
 // return either Home or Authenticate widget
    if (user == null){
     return Authenticate();
    } else {
      return Home();
    }
  }
}
