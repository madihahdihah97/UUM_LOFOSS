import 'package:flutter/material.dart';
import 'package:uumlofoss/screenlofoss/home/reportlost.dart';
import 'package:uumlofoss/screenlofoss/home/lost.dart';

class Showprofil extends StatefulWidget {
  var myprofil;
 
  Showprofil({
    this.myprofil
  });
  
  @override
  _ShowprofilState createState() => _ShowprofilState();
}

class _ShowprofilState extends State<Showprofil> {
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      backgroundColor: Colors.blueAccent,
      appBar: AppBar(
        title: Text('PROFIL'),
        centerTitle: true,
        backgroundColor: Colors.blue[900],
      ),
      body:Padding(
    padding: EdgeInsets.fromLTRB(30.0, 40.0, 30.0, 0.0),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
        children:[
        Text(widget.myprofil.fname.toString()),
        Text(widget.myprofil.lname.toString()),
        Text(widget.myprofil.gender.toString()),
        Text(widget.myprofil.inasis.toString()),
        Text(widget.myprofil.phone.toString()),
        Text(widget.myprofil.matricno.toString()),
        ])
      )
    );
  }
}
