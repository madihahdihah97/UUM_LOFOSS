import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:uumlofoss/models/user.dart';
//import 'package:uumlofoss/screenlofoss/intro.dart';
import 'package:uumlofoss/screenlofoss/wrapper.dart';
import 'package:uumlofoss/services/auth.dart';
import 'package:uumlofoss/screenlofoss/home/found.dart';
import 'package:uumlofoss/screenlofoss/home/model.dart';
import 'package:uumlofoss/screenlofoss/home/resultf.dart';
import 'package:uumlofoss/screenlofoss/home/piclost.dart';
import 'package:splashscreen/splashscreen.dart';

void main()=>runApp(MyApp());
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamProvider<User>.value(
      value: AuthService().user,
          child: MaterialApp(
        debugShowCheckedModeBanner: false,  
        title: 'Flutter Database',
        theme: ThemeData(
          primaryColor:Colors.blue[900],
          accentColor:Colors.blue[100],
        ), 
        home: Wrapper(),
      ),
    ); 
  }
}
  

