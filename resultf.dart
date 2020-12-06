import 'package:flutter/material.dart';
import 'model.dart';



class Resultf extends StatelessWidget {
 Model model;

Resultf({this.model});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('METHOD FOUND'),
        
      ),
      body: Container(
        margin: EdgeInsets.all(10.0),
        child: Column(
             crossAxisAlignment: CrossAxisAlignment.start,
              children:<Widget>[
              Text(model.item,
          style: TextStyle(fontSize: 22),
          ),
         Text(model.color,
          style: TextStyle(fontSize: 22),
          ), 
          Text(model.wheref,
          style: TextStyle(fontSize: 22),
          ),
          Text(model.datef,
          style: TextStyle(fontSize: 22),
          ),
          Text(model.fby,
          style: TextStyle(fontSize: 22),
          ),
          Text(model.deliverymethod,
          style: TextStyle(fontSize: 22),
          ),
          Text(model.email,
          style: TextStyle(fontSize: 22),
          ),
          Text(model.password,
          style: TextStyle(fontSize: 22),
          ),


          ],
          
        ),
      ),
      ); 
  }
}    
