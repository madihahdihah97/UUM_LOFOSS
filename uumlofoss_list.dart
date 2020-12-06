import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:uumlofoss/models/lofossf.dart';
import 'package:uumlofoss/screenlofoss/home/uumlofossfound_tile.dart';



class UumLofossList extends StatefulWidget {
  @override
  _UumLofossListState createState() => _UumLofossListState();
}

class _UumLofossListState extends State<UumLofossList> {
  @override
  Widget build(BuildContext context) {

   final uumlofossfound = Provider.of<List<Lofossf>>(context) ?? [];
  
   

  


    return ListView.builder(
      itemCount: uumlofossfound.length,
      itemBuilder: (context, index){
      return UumLofossfoundTile(lofossf: uumlofossfound [index]);
      },
      
    );
      
    
  }
}
