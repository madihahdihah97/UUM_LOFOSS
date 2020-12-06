

import 'package:flutter/material.dart';

class Aboutuslofoss extends StatefulWidget {
  @override
  _AboutuslofossState createState() => _AboutuslofossState();
}

class _AboutuslofossState extends State<Aboutuslofoss> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueAccent,
      appBar: AppBar(
        title: Text('ABOUT US'),
        centerTitle: true,
        backgroundColor: Colors.blue[900],
        ),
        body: Padding(
          padding: EdgeInsets.fromLTRB(80.0, 40.0, 40.0, 0.0),
          child: Column(
            children:<Widget> [
              SizedBox(
                height:80.0,
              ),
              Text(
                'If you have any'
                '   inquiries you may'
                '       call or email us',
              style: TextStyle(
                color: Colors.black87,
                letterSpacing: 1.0,
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              ),
              ),
              SizedBox(height:70.0),
              Row(
                children:<Widget>[
                  Icon(
                    Icons.call,
                    color: Colors.blue[900],
                  ),
                  SizedBox(width:10.0),
                  Text('+60199556024',
                  style: TextStyle(
                    color: Colors.grey[900],
                    fontSize: 18.0,
                    letterSpacing: 1.0,
                    ),
                    ),
                    Divider(
                      height:55.0,
                    ),
                ],
              ),
              Row(
                children:<Widget>[
                  Icon(
                    Icons.email,
                    color: Colors.blue[900],
                  ),
                  SizedBox(width:10.0),
                  Text('uumlofoss20@gmail,com',
                  style: TextStyle(
                    color: Colors.grey[900],
                    fontSize: 18.0,
                    letterSpacing: 1.0,
                    ),
                    ),
                    Divider(
                      height:55.0,
                    ),
                ],
              ),
Row(
                children:<Widget>[
                  Icon(
                    Icons.web,
                    color: Colors.blue[900],
                  ),
                  SizedBox(width:10.0),
                  Text('www.uumlofoss.com',
                  style: TextStyle(
                    color: Colors.grey[900],
                    fontSize: 18.0,
                    letterSpacing: 1.0,
                    ),
                    ),
                    Divider(
                      height:55.0,
                    ),
                ]
              ),

            ],
            
          ),
        ),
    );
    
  }
}
