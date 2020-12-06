import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:uumlofoss/screenlofoss/home/uploadfound.dart';
import 'package:uumlofoss/screenlofoss/home/newf.dart';
import 'package:uumlofoss/screenlofoss/home/newresultfound.dart';

class Newfound extends StatefulWidget {
  final Found found;
  const Newfound({Key key, this.found}) : super(key: key);

  @override
  _NewfoundState createState() => _NewfoundState();
}
class _NewfoundState extends State<Newfound> {

  TextEditingController _itemController, _colorController, _wherefoundController, _datefoundController, _foundbyController, _deliverymethodController;
String _typeSelected ='';
DatabaseReference _ref;
  @override
  void initState() { 
    super.initState();
    _itemController = TextEditingController(); 
    _colorController = TextEditingController();
    _wherefoundController = TextEditingController();
    _datefoundController = TextEditingController();
    _foundbyController =TextEditingController();
    _deliverymethodController = TextEditingController();
    _ref = FirebaseDatabase.instance.reference().child('ReportFound');
  }
  Widget _buildContactType(String title){
    return InkWell(
      child: Container(
        height:40,
        width:90,
        decoration: BoxDecoration(
          color: _typeSelected ==title? Colors.green:Theme.of(context).accentColor ,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Center(child: Text(title,style:TextStyle(fontSize: 18,
        color:Colors.pink[600]),
        ),
        ),
      ),
      onTap: (){
        setState(() {
          _typeSelected = title;
        });
      },
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueAccent,
      appBar: AppBar(
        title: Text(' REPORT FOUND'),
        centerTitle: true,
        backgroundColor: Colors.blue[900],
      ),
       
       body: Container(
         margin:EdgeInsets.all(15),
         child:  SingleChildScrollView(
                 scrollDirection: Axis.vertical, 
         child: Column(
           crossAxisAlignment: CrossAxisAlignment.start,
           children: [



             TextFormField(
               controller: _itemController,
               decoration: 
               InputDecoration(
                 hintText: 'Enter item',
                 prefixIcon: Icon(Icons.account_circle, size:30,),
                 fillColor: Colors.blue[100],
                 filled: true,
                 contentPadding: EdgeInsets.all(15),
               ),
             ),
             SizedBox(height: 15.0),
            TextFormField(
               controller: _colorController,
               decoration: 
               InputDecoration(
                 hintText: 'Enter color',
                 prefixIcon: Icon(Icons.phone, size:30,),
                 fillColor: Colors.blue[100],
                 filled: true,
                 contentPadding: EdgeInsets.all(15),
               ),
             ),
              SizedBox(height: 15.0), 
              TextFormField(
               controller: _wherefoundController,
               decoration: 
               InputDecoration(
                 hintText: 'Enter where found',
                 prefixIcon: Icon(Icons.wallet_travel, size:30,),
                 fillColor: Colors.blue[100],
                 filled: true,
                 contentPadding: EdgeInsets.all(15),
               ),
             ),
             SizedBox(height: 15.0),
            TextFormField(
               controller: _datefoundController,
               decoration: 
               InputDecoration(
                 hintText: 'Enter date found',
                 prefixIcon: Icon(Icons.color_lens, size:30,),
                 fillColor: Colors.blue[100],
                 filled: true,
                 contentPadding: EdgeInsets.all(15),
               ),
             ), 
             SizedBox(height: 15.0),
                TextFormField(
               controller: _foundbyController,
               decoration: 
               InputDecoration(
                 hintText: 'Enter found by',
                 prefixIcon: Icon(Icons.date_range, size:30,),
                 fillColor: Colors.blue[100],
                 filled: true,
                 contentPadding: EdgeInsets.all(15),
               ),
             ),
             SizedBox(height: 15.0),
            TextFormField(
               controller: _deliverymethodController,
               decoration: 
               InputDecoration(
                 hintText: 'Enter delivery method',
                 prefixIcon: Icon(Icons.place, size:30,),
                 fillColor: Colors.blue[300],
                 filled: true,
                 contentPadding: EdgeInsets.all(15),
               ),
             ),
               SizedBox(height:15,),
                Container(
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: <Widget>[
                            _buildContactType('Keys'),
                            SizedBox(width:10),

                            _buildContactType('Wallet'),
                            SizedBox(width:10),

                            _buildContactType('phone'),
                            SizedBox(width:10),

                            _buildContactType('Laptop'),
                             SizedBox(width:10),

                            _buildContactType('Others'),
                            ]
                          )
                          ))
                  ,
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.symmetric(horizontal:10),
                  child: RaisedButton(child:Text('Save Report found',
                  style:TextStyle(fontSize: 20,
                  color:Colors.white,
                  fontWeight: FontWeight.w600,
                  ),
                  ),
                  onPressed: (){
                    saveContact();//call method only
                  },
                  color: Colors.blue[900],
                  ),
                )
           ],
         )),
       ),
      
       floatingActionButton: FloatingActionButton(
         onPressed: (){
           Navigator.push(context,MaterialPageRoute(builder: (context)=>Uploadfound()),);
         },
       ),
       
       );
  }
  void saveContact(){//this is the method

    String items = _itemController.text;
    String colors = _colorController.text;
    String foundbys = _foundbyController.text;
    String datefounds = _datefoundController.text;
    String wherefounds = _wherefoundController.text;
    String deliverymethods = _deliverymethodController.text;
   

   Found found = new Found(
      item: items,
      color: colors,
      wherefound: wherefounds,
      datefound: datefounds,
      foundby: foundbys,
      deliverymethod: deliverymethods,
      
   );
    _ref.push().set(found);
    Navigator.push(context,MaterialPageRoute(builder: (context)=>Newresultfound(myfound:found),
    ));
  }
    
  }





