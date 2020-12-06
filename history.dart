import 'package:flutter/material.dart';
import 'package:uumlofoss/screenlofoss/home/reportlost.dart';
import 'package:uumlofoss/screenlofoss/home/lost.dart';

class History extends StatefulWidget {
  var mylost;
 
  History({
    this.mylost
  });
  
  @override
  _HistoryState createState() => _HistoryState();
}

class _HistoryState extends State<History> {
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      backgroundColor: Colors.blueAccent,
      appBar: AppBar(
        title: Text('HISTORY METHOD LOST'),
        centerTitle: true,
        backgroundColor: Colors.blue[900],
      ),
      body:Padding(
    padding: EdgeInsets.fromLTRB(30.0, 40.0, 30.0, 0.0),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
        children:[
        Text(widget.mylost.name.toString()),
        Text(widget.mylost.number.toString()),
        Text(widget.mylost.item.toString()),
        Text(widget.mylost.datelost.toString()),
        Text(widget.mylost.wherelost.toString()),
        Text(widget.mylost.colorlost.toString()),
        ])
      )
    );
  }
}
