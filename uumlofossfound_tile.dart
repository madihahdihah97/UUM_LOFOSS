import 'package:flutter/material.dart';
import 'package:uumlofoss/models/lofossf.dart';



class UumLofossfoundTile extends StatelessWidget {

  final Lofossf lofossf;
  UumLofossfoundTile ({ this.lofossf});


  @override

  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 8.0),
      child: Card(
        margin: EdgeInsets.fromLTRB(20.0, 6.0, 20.0, 0.0),
        child: ListTile(
          leading:CircleAvatar(
            radius: 40.0,
          ),
          title: Text(lofossf.item),
          subtitle: Column(
          children:<Widget> [
            Text(lofossf.color),
            Text(lofossf.wherefound),
            Text(lofossf.datefound),
            
            
            
          ],
          ),
          
          
        ),
      ),
    );
  }
}
