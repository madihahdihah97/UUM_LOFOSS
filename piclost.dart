import 'package:flutter/material.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart';
import 'package:uumlofoss/screenlofoss/home/rplost.dart';
import 'package:firebase_storage/firebase_storage.dart';




class Piclost extends StatefulWidget {
  @override
  _PiclostState createState() => _PiclostState();
}

class _PiclostState extends State<Piclost> {

  File _image;

  

  @override
  Widget build(BuildContext context) {

Future getImage() async {
  var image = await ImagePicker.pickImage(source: ImageSource.gallery);

  setState(() {
   _image=image;
  print('Image Path $_image');
  });
}
Future uploadPic(BuildContext context) async{
  String fileName=basename(_image.path);
  StorageReference firebaseStorageRef=FirebaseStorage.instance.ref().child(fileName);
    StorageUploadTask uploadTask=firebaseStorageRef.putFile(_image);
    StorageTaskSnapshot taskSnapshot=await uploadTask.onComplete;
    setState(() {
      print("Profile Picture uploaded");
      Scaffold.of(context).showSnackBar(SnackBar(content:Text('Profile Picture Uploaded')));
      
    });        
         }
                      
                        var Boxfit;
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

                                                  floatingActionButton: FloatingActionButton(onPressed: (){
                                                   Navigator.push(context, MaterialPageRoute(builder: (_){
                                                  return Rplost();
                                                  }));

                                                   },
                                                  child: Icon(Icons.file_copy, color: Colors.pink[400],
                                                    ),
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
                                                                      child:(_image!=null)?Image.file(_image,fit: BoxFit.fill)
                                                :Image(image:AssetImage('assets/c2.jpg'),
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
                                           style: TextStyle(color:Colors.white, fontSize: 16.0),
                                           ),
                                           ),
                                         RaisedButton(
                                           color:Colors.blue[900],
                                           onPressed: (){
                                            var uploadPic2 = uploadPic(context);
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
  
  class FirebaseStorage {
  static var instance;
}
  

            
            class StorageTaskSnapshot {
    }
        
        class StorageUploadTask {
  get onComplete => null;
    }
      
      class StorageReference {
      StorageUploadTask putFile(File image) {}
}











