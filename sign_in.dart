import 'package:flutter/material.dart';
import 'package:uumlofoss/services/auth.dart';
import 'package:uumlofoss/shared/loading.dart';


class SignIn extends StatefulWidget {

   final Function toggleView;
  SignIn ({this.toggleView});
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {

final AuthService _auth = AuthService();
final _formKey = GlobalKey<FormState>();
bool loading =false;

//text field state
String email ='';
String password ='';
String error = '';

  @override
  Widget build(BuildContext context) {
    return loading ? Loading() : Scaffold(
       backgroundColor: Colors.blueAccent,
      appBar: AppBar(
        title: Text('Sign in to UUMLOFOSS'),
        
        backgroundColor: Colors.blue[900],
        actions:<Widget> [
          FlatButton.icon(
            icon: Icon(Icons.person),
            label: Text('Register'),
            onPressed: (){
              widget.toggleView();
            },
          )
        ],
      ),
      body: Padding(
    padding: EdgeInsets.fromLTRB(30.0, 15.0, 30.0, 0.0),
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
                   'Sign in',
                   style: TextStyle(color: Colors.white),

                 ),
                 onPressed: () async {
                  if(_formKey.currentState.validate()){
                    setState(()=>loading =true);
  ;
                    dynamic result = await _auth.signInWithEmailAndPassword(email, password);


                     print('valid');

                    if(result == null){
                     setState((){
                       error = 'Could not sign in with those credentials'; 
                       loading =false;
                     });
                     
                    
                     }
                     
                   }

                 },
               ),
              SizedBox(height:12.0),
               Text(
                 error,
                 style: TextStyle(color:Colors.red,fontSize: 14.0),
               ),
              ],
            ),
          ),
      ],
    ),
      ),
    );
  }
}
  
