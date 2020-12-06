import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:path/path.dart';
import 'package:uumlofoss/screenlofoss/home/found.dart';
import 'package:uumlofoss/screenlofoss/home/modelf.dart';




class Foundnew extends StatefulWidget {
  @override
  _FoundnewState createState() => _FoundnewState();
}

class _FoundnewState extends State<Foundnew> {

  final _formKey =GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final halfMediaWidth = MediaQuery.of(context).size.width / 2.0;

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_left),
          onPressed: (){
            Navigator.pop(context);
          },
        ),
        title: Text('REPORT FOUND'),
        backgroundColor: Colors.blue[900],
      ),
      backgroundColor: Colors.blueAccent,
      body: Builder(
        builder: (context)=>Container(
          child: Column(
              mainAxisAlignment:MainAxisAlignment.start,
              children:<Widget>[
                SizedBox(height:20.0,),
                 Row(
                   mainAxisAlignment: MainAxisAlignment.center,
                   children:<Widget> [
                    Align(
                      alignment: Alignment.center,
                      child: CircleAvatar(
                        radius: 100,
                        backgroundColor: Colors.pink[400],
                        child: ClipOval(
                         child:SizedBox(
                          width:180.0,
                          height: 180.0,
                          child: Image(
                            image:AssetImage('assets/c1.jpg'),
                            fit: BoxFit.fill,
                          ),
                        ), 
                        ),
                      ),
                    ),
                  Padding(
                    padding: EdgeInsets.only(top:60.0),
                    child: IconButton(
                      icon:Icon(
                        Icons.camera_alt,
                        size: 30.0,
                      ),
                      onPressed: (){
                      },
                    ),
                  ), 
                   ],
                 ),
                SizedBox(
                  height: 20.0,
                  ),
                Row(
                  children:<Widget> [
                    Form(
                      key: _formKey,
                      child:SingleChildScrollView(
                       
                        child:Column(
                          children:<Widget> [
                            Row(
                              crossAxisAlignment:CrossAxisAlignment.start,
                              children:<Widget> [
                                Container(
                                  alignment: Alignment.topCenter,
                                  width:halfMediaWidth,
                                  child:MyTextFormField(
                                    hintText: 'item',
                                  ),
                                ),
                                Container(
                                  alignment: Alignment.topCenter,
                                  width:halfMediaWidth,
                                  child:MyTextFormField(
                                    hintText: 'color',
                                  ),
                                ),
                              ],
                            ),
                          Row(
                              crossAxisAlignment:CrossAxisAlignment.start,
                              children:<Widget> [
                                Container(
                                  alignment: Alignment.topCenter,
                                  width:halfMediaWidth,
                                  child:MyTextFormField(
                                    hintText: 'where found',
                                  ),
                                ),
                                Container(
                                  alignment: Alignment.topCenter,
                                  width:halfMediaWidth,
                                  child:MyTextFormField(
                                    hintText: 'found date',
                                  ),
                                ),  
                              ],
                            ),
                          Row(
                              crossAxisAlignment:CrossAxisAlignment.start,
                                children:<Widget> [
                                  MyTextFormField(
                                    hintText:'Email',
                                      ),
                                  MyTextFormField(
                                    hintText:'Password',
                                      ),
                                  MyTextFormField(
                                    hintText:'Comfirm Password',
                                    ),
                FlatButton(
                    color: Colors.blue[100],
                    child: Text('sign up'),
                     onPressed: (){
                     print('sign up');
                     },
                ),

                                  
                                Container(
                                  alignment: Alignment.topCenter,
                                    width:halfMediaWidth,
                                    child:MyTextFormField(
                                    hintText: 'found by',
                                     ),
                                     ),
                                Container(
                                  alignment: Alignment.topCenter,
                                  width:halfMediaWidth,
                                  child:MyTextFormField(
                                    hintText: 'delivery method',
                                  ),
                                  ),  
                                  
                                  ],
                                  ),
                                    ],
                                    ),
                                 
                    ),
                      ),
                    
                  ],

                ),
   



              ],
            
          )
        ),
      ),
    );
      
    
  }
}

class MyTextFormField extends StatelessWidget {

  final String hintText;
  final String item;
  final String color;
  final String wheref;
  final String datef;
  final String fby;
  final String deliverymethod;
  final Function validator;
  final Function onSaved;
  final bool isPassword;
  final bool isEmail;

  MyTextFormField({
    this.hintText,
    this.item,
    this.color,
    this.datef,
    this.deliverymethod,
    this.fby,
    this.isEmail=false,
    this.isPassword=false,
    this.onSaved,
    this.validator,
    this.wheref,
  });
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8.0),
      child: TextFormField(
        decoration: InputDecoration(
          hintText: hintText,
          contentPadding: EdgeInsets.all(15.0),
          border: InputBorder.none,
          filled:true,
          fillColor: Colors.blue[100],
        ),
        obscureText: isPassword? true:false,
        validator: validator,
        onSaved: onSaved,
        keyboardType: isEmail? TextInputType.emailAddress:TextInputType.text,
      ),
      
    );
  }
}
