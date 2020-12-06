import 'package:flutter/material.dart';


class Applicationlofoss extends StatefulWidget {
  @override
  _ApplicationlofossState createState() => _ApplicationlofossState();
}

class _ApplicationlofossState extends State<Applicationlofoss> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueAccent,
      appBar: AppBar(
        title: Text('about application'),
        centerTitle: true,
        backgroundColor: Colors.blue[900],
      ),
      body: Padding(
        padding: EdgeInsets.fromLTRB(50.0, 40.0, 50.0, 0.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children:<Widget> [
            Center(
              child:CircleAvatar(
                backgroundImage: AssetImage( 'assets/l2.jpg'),
                radius: 70.0,
              ) ,

            ),
            Divider(
              height:90.0,
            ),
            Text(
              'The main objective of'
              '         this project is to develop'
              '         a mobile application that'
              '   can be a medium for   student'
              '  and staff to get best  way'
              '  to find the lost   items'
              ' around UUM',
              style: TextStyle(
                color: Colors.blue[900],
                letterSpacing: 1.0,
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              ),
              ),
          ],
      ),
      ),
    );
  }
}
