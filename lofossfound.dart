import 'package:flutter/material.dart';
import 'package:uumlofoss/models/lofossf.dart';
import 'package:uumlofoss/screenlofoss/home/setting_foundform.dart';
import 'package:uumlofoss/services/database.dart';
import 'package:provider/provider.dart';
import 'package:uumlofoss/screenlofoss/home/uumlofoss_list.dart';
import 'package:uumlofoss/models/lofossf.dart';



class Lofossfound extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

   void _showSettingsPanel() {
     showModalBottomSheet(context: context, builder: (context) {
       return Container(
         padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 60.0),
         child: SettingsForm(),
       );
     });
   }

    return StreamProvider<List<Lofossf>>.value(
          value : DatabaseService().uumlofossfound,
          child: Scaffold(
        backgroundColor: Colors.blueAccent,
        appBar: AppBar(
          title: Text('HISTORY FOUND'),
          backgroundColor: Colors.blue[900],
          elevation: 0.0,
          actions:<Widget> [
            FlatButton.icon(
              icon: Icon(Icons.settings),
              label: Text('settings'),
              onPressed: ()=> _showSettingsPanel(),
            )
          ],
        ),
        body: UumLofossList(),
      ),
    );
  }
}
