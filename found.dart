import 'package:flutter/material.dart';

import 'resultf.dart';



class Found extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('REPORT FOUND'),
          backgroundColor: Colors.blue[900],
        ) ,
        backgroundColor: Colors.blueAccent,
        body: ReportfoundForm(),
      ),
      
    );
  }
}
class ReportfoundForm extends StatefulWidget {
  @override
  _ReportfoundFormState createState() => _ReportfoundFormState();
}

class _ReportfoundFormState extends State<ReportfoundForm> {

  final _formKey =GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final halfMediaWidth = MediaQuery.of(context).size.width /2.0;

    return Form(
      key: _formKey,
      child: SingleChildScrollView(
        child:Column(
           children:<Widget>[
              Row(
                crossAxisAlignment:CrossAxisAlignment.start ,
                children:<Widget>[
                  Container(
              alignment:Alignment.topCenter,
              width:halfMediaWidth,
              child: MyTextFormFied(
                hintText: 'item',
                
                     
                     
                  
              
              ),
            ),

             Container(
              alignment:Alignment.topCenter,
              width:halfMediaWidth,
              child: MyTextFormFied(
                hintText: 'color',
              ),
            ),
                ]
               
             ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children:<Widget>[
                  Container(
              alignment:Alignment.topCenter,
              width:halfMediaWidth,
              child: MyTextFormFied(
                hintText: 'where',
              ),
            ),

             Container(
              alignment:Alignment.topCenter,
              width:halfMediaWidth,
              child: MyTextFormFied(
                hintText: 'date',
              ),
            ),
                ]
               
             ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children:<Widget>[
                  Container(
              alignment:Alignment.topCenter,
              width:halfMediaWidth,
              child: MyTextFormFied(
                hintText: 'by',
              ),
            ),

             Container(
              alignment:Alignment.topCenter,
              width:halfMediaWidth,
              child: MyTextFormFied(
                hintText: 'deliverymethod',
              ),
            ),
                ]
               
             ),
  
            MyTextFormFied(
                hintText: 'Email',
                isEmail: true,
              ),
            MyTextFormFied(
                hintText: 'Password',
                isPassword: true,
              ),
            MyTextFormFied(
                hintText: 'comfirm password',
                isPassword: true,
              ),
              FlatButton(
                color: Colors.blue[900],
              child: Text('sign up'),
              onPressed: (){
                print('sign up');
                Navigator.push(context, MaterialPageRoute(builder:(context)=>Resultf()));
              },
              ),
          ],

        ),
      ),
    );
  }
}

class MyTextFormFied extends StatelessWidget {
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

  MyTextFormFied({
  this.hintText,
  this.item,
  this.color,
  this.datef,
  this.deliverymethod,
  this.fby,
  this.isEmail=false,
  this.isPassword =false,
  this.onSaved ,
  this.validator,
  this.wheref
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
         filled: true,
         fillColor: Colors.blue[100],
        ),
        obscureText: isPassword ? true:false,
        validator: validator,
        onSaved: onSaved,
        keyboardType: isEmail ? TextInputType.emailAddress:TextInputType.text,
      ),
      
    );
  }
    
  }


