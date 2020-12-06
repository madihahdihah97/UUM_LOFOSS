import 'package:flutter/material.dart';
import 'package:uumlofoss/screenlofoss/home/newfound.dart';
import 'package:uumlofoss/screenlofoss/home/lost.dart';

class Newresultfound extends StatefulWidget {
  var myfound;
 
  Newresultfound({
    this.myfound
  });
  
  @override
  _NewresultfoundState createState() => _NewresultfoundState();
}

class _NewresultfoundState extends State<Newresultfound> {
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      backgroundColor: Colors.blueAccent,
      appBar: AppBar(
        title: Text('METHOD FOUND'),
        centerTitle: true,
        backgroundColor: Colors.blue[900],
      ),
      body:Padding(
    padding: EdgeInsets.fromLTRB(30.0, 40.0, 30.0, 0.0),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
        children:[
        Text(widget.myfound.item.toString()),
        Text(widget.myfound.wherefound.toString()),
        Text(widget.myfound.datefound.toString()),
        Text(widget.myfound.foundby.toString()),
        Text(widget.myfound.color.toString()),
        Text(widget.myfound.deliverymethod.toString()),
        ])
      )
    );
  }
}

