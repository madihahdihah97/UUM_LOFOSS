import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:uumlofoss/screenlofoss/home/Lost.dart';
import 'package:uumlofoss/screenlofoss/home/uploadlost.dart';


class Rplost extends StatefulWidget {
  final Lost lost;
  const Rplost({Key key, this.lost}) : super(key: key);

  @override
  _RplostState createState() => _RplostState();
}
class _RplostState extends State<Rplost> {

  TextEditingController _nameController, _numberController, _itemController, _dlostController, _wlostController, _colorController,_icnoController;
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
    _icnoController = TextEditingController();
    _ref = FirebaseDatabase.instance.reference().child('Reportlost');
  }
  Widget _buildContactType(String title){
    return InkWell(
      child: Container(
        height:40,
        width:90,
        decoration: BoxDecoration(
          color: _typeSelected ==title? Colors.pink[100]:Theme.of(context).accentColor ,
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
               controller: _icnoController,
               decoration: 
               InputDecoration(
                 hintText: 'Enter IC number',
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
                            ],
                          ),
                          ),
                          ),
                  
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
         ),
         ),
       ),
      
      
       
       );
  }
  void saveContact(){
  String name = _nameController.text;
    String number = _numberController.text;
    String item = _itemController.text;
    String datelost = _dlostController.text;
    String wherelost = _wlostController.text;
    String colorlost = _colorController.text;
    String icno = _icnoController.text;
  

   Map<String,String>contact={
    'name': name,
    'number': '+60'+ number,
    'item': item,
    'datelost': datelost,
    'wherelost': wherelost,
    'colorlost': colorlost,
    'icno': icno,
    'type': _typeSelected,

  };

   _ref.push().set(contact);

  
   

  }
    
  }
