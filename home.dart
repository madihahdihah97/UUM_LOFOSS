
import 'package:flutter/material.dart';
import 'package:uumlofoss/screenlofoss/home/aboutus.dart';
import 'package:uumlofoss/screenlofoss/home/addprofilenew.dart';
import 'package:uumlofoss/screenlofoss/home/application.dart';
import 'package:uumlofoss/screenlofoss/home/foundreport.dart';
import 'package:uumlofoss/screenlofoss/home/lofossfound.dart';
import 'package:uumlofoss/screenlofoss/home/newfound.dart';
import 'package:uumlofoss/screenlofoss/home/piclost.dart';
import 'package:uumlofoss/services/auth.dart';



class Home extends StatefulWidget {
  

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

final AuthService _auth =AuthService();
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueAccent,
      appBar: AppBar(
        title: Text('Welcome to UUMLOFOSS'),
        centerTitle: true,
        backgroundColor: Colors.blue[900],
        elevation: 0.0,
        actions:<Widget> [
          FlatButton.icon(icon:Icon(Icons.person),
          label: Text('logout'),
          onPressed: () async{
           await _auth.signOut();
          },
          ),
        ],
      ),
      body:Padding(
        padding: EdgeInsets.fromLTRB(30.0, 40.0, 30.0, 0.0),
       child :SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children:<Widget> [
            Center(
              child: CircleAvatar(
                backgroundImage: AssetImage('assets/l2.jpg'),
                radius: 70.0,
              ),
            ),
            Divider(
              height:30.0,
            
            ),
            FlatButton(
              padding: EdgeInsets.symmetric(horizontal:127.0, vertical:5.0),
              onPressed: (){
                Navigator.push(
                  context, MaterialPageRoute(builder: (context)=>Aboutuslofoss()),
                  );
              },
              color:Colors.blue[100],
              child: Text('ABOUT US',
              style:TextStyle(color:Colors.black,letterSpacing: 1.0,fontSize: 18.0,fontWeight: FontWeight.bold),
               ),
            ),

            Divider(
              height:10.0,
            
            ),
            FlatButton(
              padding: EdgeInsets.symmetric(horizontal:77.0, vertical:5.0),
              onPressed: (){
                Navigator.push(
                  context, MaterialPageRoute(builder: (context)=>Applicationlofoss()),
                  );
              },
              color:Colors.blue[100],
              child: Text('ABOUT APPLICATION',
              style:TextStyle(color:Colors.black,letterSpacing: 1.0,fontSize: 18.0,fontWeight: FontWeight.bold),
               ),
            ),
          
            Divider(
              height:10.0,
            
            ),
            FlatButton(
              padding: EdgeInsets.symmetric(horizontal:136.0, vertical:5.0),
              onPressed: (){
                Navigator.push(
                  context, MaterialPageRoute(builder: (context)=>Contacts()),
                  );
              },
              color:Colors.blue[100],
              child: Text('PROFILE',
              style:TextStyle(color:Colors.black,letterSpacing: 1.0,fontSize: 18.0,fontWeight: FontWeight.bold),
               ),
            ),
          

           Divider(
              height:10.0,
            
            ),
            FlatButton(
              padding: EdgeInsets.symmetric(horizontal:111.0, vertical:5.0),
              onPressed: (){
                Navigator.push(
                  context, MaterialPageRoute(builder: (context)=>Piclost()),
                  );
              },
              color:Colors.blue[100],
              child: Text('REPORT LOST',
              style:TextStyle(color:Colors.black,letterSpacing: 1.0,fontSize: 18.0,fontWeight: FontWeight.bold),
               ),
            ),
            Divider(
              height:10.0,
            
            ),


         FlatButton(
              padding: EdgeInsets.symmetric(horizontal:104.0, vertical:5.0),
              onPressed: (){
                Navigator.push(
                  context, MaterialPageRoute(builder: (context)=>Foundreport()),
                  );
              },
              color:Colors.blue[100],
              child: Text('REPORT FOUND',
              style:TextStyle(color:Colors.black,letterSpacing: 1.0,fontSize: 18.0,fontWeight: FontWeight.bold),
               ),
            ),

             Divider(
              height:10.0,
            
            ),
            FlatButton(
              padding: EdgeInsets.symmetric(horizontal:100.0, vertical:8.0),
              onPressed: (){
                Navigator.push(
                  context, MaterialPageRoute(builder: (context)=>Lofossfound()),
                  );
              },
              color:Colors.blue[100],
              child: Text('HISTORY FOUND',
              style:TextStyle(color:Colors.black,letterSpacing: 1.0,fontSize: 18.0,fontWeight: FontWeight.bold),
               ),
            ),
            
               Divider(
              height:10.0,
            
            ),
           




  ],
        ),













       ),






        
      )
    );
  }
}
