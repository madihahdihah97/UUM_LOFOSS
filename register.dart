import 'package:flutter/material.dart';
import 'package:uumlofoss/screenlofoss/authenticate/sign_in.dart';
import 'package:uumlofoss/screenlofoss/authenticate/register.dart';
import 'package:uumlofoss/services/auth.dart';
import 'package:uumlofoss/shared/loading.dart';

class Register extends StatefulWidget {

  final Function toggleView;
  Register ({this.toggleView});
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {

   final AuthService _auth = AuthService();
   final _formKey = GlobalKey<FormState>();
   bool loading =false;

//text field state
String email ='';
String password ='';
String error = '';

//tbr

String name ='';
String matricno='';

//stbr


  @override
  Widget build(BuildContext context) {
    return loading ? Loading(): Scaffold(
      backgroundColor: Colors.blueAccent,
      appBar: AppBar(
      title: Text('Sign up in to UUMLOFOSS'),
       
      backgroundColor: Colors.blue[900],
      actions:<Widget> [
      FlatButton.icon(
       icon: Icon(Icons.person),
       label: Text('Sign in'),
       onPressed: (){
      widget.toggleView();
      },
      ),
     ],

      ),
      body: Padding(
    padding: EdgeInsets.fromLTRB(30.0, 15.0, 30.0, 0.0),
    
   child:SingleChildScrollView(
   child: Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children:<Widget>[
     Center(
      child: CircleAvatar(
        backgroundImage: AssetImage('assets/l2.jpg'),
        radius: 55.0,
      ),
      ),
      Divider(
      height: 5.0,
       ),
      Form(
      key: _formKey,
      child: Column(
      children: <Widget>[
      SizedBox(height:05.0),
  
    //tr

    TextFormField(
      decoration: InputDecoration(
      hintText: 'Name',
      ),
      validator: (val)=>val.isEmpty ? 'Enter your name': null,
        onChanged: (val){
        setState(( )=>name =val);
         }
        ),
        SizedBox(height:5.0),

    TextFormField(
        decoration: InputDecoration(
        hintText: 'Matric number',
       ),
      validator: (val)=>val.isEmpty ? 'Enter your Matric number': null,
      onChanged: (val){
      setState(( )=> matricno=val);
      }
      ),
      SizedBox(height:5.0),

//str
              
              
    TextFormField(
       decoration: InputDecoration(
       hintText: 'Email',
       ),
       validator: (val)=>val.isEmpty ? 'Enter an email': null,
       onChanged: (val){
       setState(( )=> email=val);
        }
         ),
       SizedBox(height:5.0),
        TextFormField(
          decoration: InputDecoration(
          hintText: 'Password',
        ),
          obscureText:true,
          validator: (val)=>val.length<6 ? 'Enter a password 6+ chars long': null,
          onChanged: (val){
          setState(( )=>password=val);
         }
        ),
        SizedBox(height:05.0),
          RaisedButton(
            color: Colors.blue[900],
           child: Text(
            'Register',
             style: TextStyle(color: Colors.white),

            ),
            onPressed: () async {
           if(_formKey.currentState.validate()){
            setState(()=>loading = true);
        dynamic result =await _auth.registerWithEmailAndPassword(email,password);

          if(result == null){
          setState((){
          error = 'please supply a valid email';
          loading = false;
                       });
                     }
                     
                   }
                 },
               ),
          SizedBox(height:12.0),
           Text(
            error,
            style: TextStyle(color:Colors.red,fontSize: 14.0),
      
               )],
             ), 
          ),
      ],
    ),
   ),
      ),
    );
  
}
  
}
