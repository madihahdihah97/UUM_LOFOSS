import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:path/path.dart';



class Uploadlost extends StatefulWidget {
  @override
  _UploadlostState createState() => _UploadlostState();
}

class _UploadlostState extends State<Uploadlost> {

  File _image;

  @override
  Widget build(BuildContext context) {

Future getImage() async {
  var image = await ImagePicker.pickImage(source: ImageSource.gallery);

  setState(() {
   _image=image;
  print('Image Path S_image');
  });
}

    return Scaffold(
      appBar: AppBar(
        title: Text('IMAGE LOST'),
        centerTitle: true,
        leading: IconButton(
          icon:Icon(Icons.arrow_left),
          onPressed: (){
            Navigator.pop(context);
          },
        ),
        backgroundColor: Colors.blue[900],
      ),
      backgroundColor: Colors.blueAccent,
      body:Builder(
        builder: (context)=>Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children:<Widget> [
              SizedBox(height:20.0),
              Row(
                mainAxisAlignment:MainAxisAlignment.center,
                children:<Widget>[
                  Align(
                    alignment: Alignment.center,
                    child:CircleAvatar(
                      radius:100,
                      backgroundColor: Colors.pink[300],
                      child: ClipOval(
                        child: SizedBox(
                          width:180.0,
                          height:180.0,
                          child:(_image!=null)?Image.file(_image,fit:BoxFit.fill)
                            :Image( image:AssetImage('assets/c2.jpg'),
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
                            size:30.0,
                          ),
                          onPressed: (){
                            getImage();
                          },
                        ),
                      ),
                ],
              ),
          
              SizedBox(
                height:20.0,
              ),

               Row(
                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                 children:<Widget> [
                   RaisedButton(
                     color:Colors.blue[900],
                     onPressed: (){
                       Navigator.of(context).pop();
                     },
                     elevation: 4.0,
                     splashColor: Colors.blue[200],
                     child: Text('cancel',
                     style: TextStyle(color:Colors.white, fontSize: 16.0)),
                   ),
                   RaisedButton(
                     color:Colors.blue[900],
                     onPressed: (){
                      uploadPic(context);
                                           },
                                           elevation: 4.0,
                                           splashColor: Colors.blue[200],
                                           child: Text('Submit',
                                           style: TextStyle(color:Colors.white, fontSize: 16.0)),
                                         ),
                                         
                                       ],
                                     ),
                                  ],
                                ),
                              ),
                            ),
                        
                             
                            
                          );
                        }
                      
                        void uploadPic(BuildContext context) {}
}
