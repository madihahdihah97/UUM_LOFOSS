import 'package:flutter/material.dart';
import 'package:uumlofoss/services/database.dart';
import 'package:uumlofoss/models/user.dart';
import 'package:provider/provider.dart';
import 'package:uumlofoss/shared/loading.dart';




class SettingsForm extends StatefulWidget {
  @override
  _SettingsFormState createState() => _SettingsFormState();
}

class _SettingsFormState extends State<SettingsForm> {

 final _formKey = GlobalKey<FormState>();


 // form values

 String _currentItem;
 String _currentColor;
 String _currentWherefound;
 String _currentDatefound;
 
 

  @override
  Widget build(BuildContext context) {

   final user = Provider.of<User>(context);

    return StreamBuilder<UserData>(
      stream: DatabaseService(uid: user.uid).userData,
      builder: (context, snapshot) {
        if(snapshot.hasData){
         

        UserData userData = snapshot.data;

         return Form(
          key: _formKey,
          child: Column(
           children:<Widget> [
             Text(
               'Update your found here',
               style: TextStyle(fontSize: 12.0),
           ),
           SizedBox(height:2.0),
            TextFormField(
              initialValue: userData.item,
             keyboardType: TextInputType.text,
             decoration:InputDecoration(
               enabledBorder: OutlineInputBorder(
                 borderSide: BorderSide(
                   color: Colors.blueAccent,
                   width: 1.5,
                   style: BorderStyle.solid,
                 ),
                 borderRadius: BorderRadius.all(Radius.circular(15.0,
                 ),
                 ),
               ),
               focusedBorder: OutlineInputBorder(
                 borderSide: BorderSide(
                   color:Colors.pink[400],
                   width: 1.5,
                   style: BorderStyle.solid,

                 ),
                 borderRadius: BorderRadius.all(Radius.circular(15.0,
                 ),
                 ),
               ),
               
               labelText: "Item found",
             ) ,
             validator: (val)=>val.isEmpty?'Item found': null,
             onChanged: (val)=>setState(()=> _currentItem = val),
           ), 
         
            SizedBox(height:2.0),
           
           TextFormField(
             initialValue: userData.color,
             keyboardType: TextInputType.text,
             decoration:InputDecoration(
               enabledBorder: OutlineInputBorder(
                 borderSide: BorderSide(
                   color: Colors.blueAccent,
                   width: 1.5,
                   style: BorderStyle.solid,
                 ),
                 borderRadius: BorderRadius.all(Radius.circular(15.0,
                 ),
                 ),
               ),
               focusedBorder: OutlineInputBorder(
                 borderSide: BorderSide(
                   color:Colors.pink[400],
                   width: 1.5,
                   style: BorderStyle.solid,

                 ),
                 borderRadius: BorderRadius.all(Radius.circular(15.0,
                 ),
                 ),
               ),
               labelText: "Color item",
             ) ,
             validator: (val)=>val.isEmpty?'Color item': null,
             onChanged: (val)=>setState(()=> _currentColor = val),
           ), 

           SizedBox(height:2.0),
           
           TextFormField(
             initialValue: userData.wherefound,
             keyboardType: TextInputType.text,
             decoration:InputDecoration(
               enabledBorder: OutlineInputBorder(
                 borderSide: BorderSide(
                   color: Colors.blueAccent,
                   width: 1.5,
                   style: BorderStyle.solid,
                 ),
                 borderRadius: BorderRadius.all(Radius.circular(15.0,
                 ),
                 ),
               ),
               focusedBorder: OutlineInputBorder(
                 borderSide: BorderSide(
                   color:Colors.pink[400],
                   width: 1.5,
                   style: BorderStyle.solid,

                 ),
                 borderRadius: BorderRadius.all(Radius.circular(15.0,
                 ),
                 ),
               ),
               labelText: "Where found",
             ) ,
             validator: (val)=>val.isEmpty?'Where found': null,
             onChanged: (val)=>setState(()=> _currentWherefound = val),
           ), 
          SizedBox(height:2.0),
           
           TextFormField(
             initialValue: userData.datefound,
             keyboardType: TextInputType.text,
             decoration:InputDecoration(
               enabledBorder: OutlineInputBorder(
                 borderSide: BorderSide(
                   color: Colors.blueAccent,
                   width: 1.5,
                   style: BorderStyle.solid,
                 ),
                 borderRadius: BorderRadius.all(Radius.circular(15.0,
                 ),
                 ),
               ),
               focusedBorder: OutlineInputBorder(
                 borderSide: BorderSide(
                   color:Colors.pink[400],
                   width: 1.5,
                   style: BorderStyle.solid,

                 ),
                 borderRadius: BorderRadius.all(Radius.circular(15.0,
                 ),
                 ),
               ),
               labelText: "Date found",
             ) ,
             validator: (val)=>val.isEmpty?'Date found': null,
             onChanged: (val)=>setState(()=> _currentDatefound = val),
           ),  

           
           
          
           SizedBox(height:2.0),
           //dropdown
         
           //slider
           RaisedButton(
             color:Colors.blue[900],
             child: Text('update',
             style: TextStyle(color: Colors.white),
             
             ),
            onPressed: () async {
             if(_formKey.currentState.validate()){
               await DatabaseService(uid: user.uid).updateUserData(
                 
                 _currentItem ?? userData.item,
                 _currentColor ?? userData.color,
                 _currentWherefound ?? userData.wherefound,
                 _currentDatefound ?? userData.datefound,
               );
               Navigator.pop(context);


             }



            
            },
           ),

 


           ], 
          ),
          
        );





        }else{
          return Loading();
        }


        
      }
    );
  }
}
