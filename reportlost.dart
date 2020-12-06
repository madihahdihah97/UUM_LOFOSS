import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:uumlofoss/screenlofoss/home/Lost.dart';
import 'package:uumlofoss/screenlofoss/home/history.dart';
import 'package:uumlofoss/screenlofoss/home/uploadlost.dart';


class Reportlost extends StatefulWidget {
  final Lost lost;
  const Reportlost({Key key, this.lost}) : super(key: key);

  @override
  _ReportlostState createState() => _ReportlostState();
}
class _ReportlostState extends State<Reportlost> {

  TextEditingController _nameController, _numberController, _itemController, _dlostController, _wlostController, _colorController;
String _typeSelected ='';
DatabaseReference _ref;
  @override
  void initState() { 
    super.initState();
    _nameController = TextEditingController(); 
    _numberController = TextEditingController();
    _itemController = TextEditingController();
    _dlostController = TextEditingController();
    _wlostController =TextEditingController();
    _colorController = TextEditingController();
    _ref = FirebaseDatabase.instance.reference().child('Contacts');
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
        title: Text(' REPORT LOST'),
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
               controller: _nameController,
               decoration: 
               InputDecoration(
                 hintText: 'Enter name',
                 prefixIcon: Icon(Icons.account_circle, size:30,),
                 fillColor: Colors.blue[100],
                 filled: true,
                 contentPadding: EdgeInsets.all(15),
               ),
             ),
             SizedBox(height: 15.0),
            TextFormField(
               controller: _numberController,
               decoration: 
               InputDecoration(
                 hintText: 'Enter phone number',
                 prefixIcon: Icon(Icons.phone, size:30,),
                 fillColor: Colors.blue[100],
                 filled: true,
                 contentPadding: EdgeInsets.all(15),
               ),
             ),
              SizedBox(height: 15.0), 
              TextFormField(
               controller: _itemController,
               decoration: 
               InputDecoration(
                 hintText: 'Enter type of item',
                 prefixIcon: Icon(Icons.wallet_travel, size:30,),
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
                 prefixIcon: Icon(Icons.color_lens, size:30,),
                 fillColor: Colors.blue[100],
                 filled: true,
                 contentPadding: EdgeInsets.all(15),
               ),
             ), 
             SizedBox(height: 15.0),
                TextFormField(
               controller: _dlostController,
               decoration: 
               InputDecoration(
                 hintText: 'Enter date lost',
                 prefixIcon: Icon(Icons.date_range, size:30,),
                 fillColor: Colors.blue[100],
                 filled: true,
                 contentPadding: EdgeInsets.all(15),
               ),
             ),
             SizedBox(height: 15.0),
            TextFormField(
               controller: _wlostController,
               decoration: 
               InputDecoration(
                 hintText: 'Enter where lost',
                 prefixIcon: Icon(Icons.place, size:30,),
                 fillColor: Colors.blue[100],
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
                  child: RaisedButton(child:Text('Save Report Lost',
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
           Navigator.push(context,MaterialPageRoute(builder: (context)=>Uploadlost()),);
         },
       ),
       
       );
  }
  void saveContact(){//this is the method

    String names = _nameController.text;
    String numbers = _numberController.text;
    String items = _itemController.text;
    String datelosts = _dlostController.text;
    String wherelosts = _wlostController.text;
    String colorlosts = _colorController.text;
   

   Lost lost = new Lost(
      name: names,
      number: numbers,
      item: items,
      datelost: datelosts,
      wherelost: wherelosts,
      colorlost: colorlosts,
      
   );
    _ref.push().set(lost);
    Navigator.push(context,MaterialPageRoute(builder: (context)=>History(mylost:lost),
    ));
  }
    
  }
