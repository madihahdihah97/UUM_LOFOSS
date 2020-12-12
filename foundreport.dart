import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:uumlofoss/screenlofoss/home/founds.dart';



class Foundreport extends StatefulWidget {
  final Founds founds;
  const Foundreport({ Key key, this.founds}): super(key:key);
  @override
  _FoundreportState createState() => _FoundreportState();
}

class _FoundreportState extends State<Foundreport> {

TextEditingController _typeItemController, _colorOrmodelController, _wherefoundController, _datefoundController, _foundbyController, _deliverymethodController;
String _typeSelected ='';
DatabaseReference _ref;
@override
void initState() { 
  super.initState();
    _typeItemController = TextEditingController(); 
    _colorOrmodelController = TextEditingController();
    _wherefoundController = TextEditingController();
    _datefoundController = TextEditingController();
    _foundbyController =TextEditingController();
    _deliverymethodController = TextEditingController();
    
    _ref = FirebaseDatabase.instance.reference().child('Reportfound');
 
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
               controller: _typeItemController,
               decoration: 
               InputDecoration(
                 hintText: 'Enter type item',
                 prefixIcon: Icon(Icons.wallet_travel, size:30,),
                 fillColor: Colors.blue[100],
                 filled: true,
                 contentPadding: EdgeInsets.all(15),
               ),
             ),
             SizedBox(height: 15.0),
              TextFormField(
               controller: _colorOrmodelController,
               decoration: 
               InputDecoration(
                 hintText: 'Enter color and model',
                 prefixIcon: Icon(Icons.palette_outlined, size:30,),
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
                 prefixIcon: Icon(Icons.place, size:30,),
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
                 prefixIcon: Icon(Icons.date_range, size:30,),
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
                 prefixIcon: Icon(Icons.person, size:30,),
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
                 prefixIcon: Icon(Icons.car_rental, size:30,),
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
                  child: RaisedButton(child:Text('Save Report Found',
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
                ),
           ],
         ),
         ),
       ),
      
      
       
       );
  }
 void saveContact(){
  String typeItem = _typeItemController.text;
    String colorOrmodel = _colorOrmodelController.text;
    String wherefound = _wherefoundController.text;
    String datefound = _datefoundController.text;
    String foundby = _foundbyController.text;
    String deliverymethod = _deliverymethodController.text;
    
  

   Map<String,String>contact={
    'typeItem': typeItem,
    'colorOrmodel':  colorOrmodel,
    'wherefound': wherefound,
    'datefound': datefound,
    'foundby': foundby,
    'deliverymethod': deliverymethod,
    'type': _typeSelected,

  };
 _ref.push().set(contact);

 }
 }


 
