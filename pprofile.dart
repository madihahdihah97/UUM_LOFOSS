import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class Pprofile extends StatefulWidget {
  @override
  _PprofileState createState() => _PprofileState();
}

class _PprofileState extends State<Pprofile> {

final GlobalKey <FormState> _formKey =GlobalKey<FormState>();

TextEditingController _nameController; 
TextEditingController _icnoController;
TextEditingController _genderController;
TextEditingController _inasisController;
TextEditingController _phoneController;
TextEditingController _facultyController;
String _typeSelected ='';

DatabaseReference _ref;

@override
  void initState() {
    // TODO: implement initState
    super.initState();
    _nameController = TextEditingController();
    _icnoController = TextEditingController();
    _genderController = TextEditingController();
    _inasisController = TextEditingController();
    _phoneController = TextEditingController();
    _facultyController =TextEditingController();
    _ref = FirebaseDatabase.instance.reference().child('Profile');
  }
 Widget _buildContactType(String title){
   return InkWell(
     child: Container(
       height: 40,
     width: 90,
     decoration: BoxDecoration(
       color: _typeSelected ==title? Colors.pink[300]: Theme.of(context).primaryColor,

       borderRadius: BorderRadius.circular(15),

     ),
     child: Center(child:Text(title,style:TextStyle(fontSize: 18,
     color:Colors.white),
     ),
     ),
     ),
    onTap: (){
      setState(() {
        _typeSelected=title;
      });
    },
   );
 }
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("REGISTER PROFILE...")
        
      ) ,
      body: SafeArea(
        top:false,
        bottom: false,
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors:<Color>[
                Colors.blue[100],
                 Colors.blue[100],
                  Colors.blue[400],
                   Colors.blue[600],
              ], 
            ),
          ),
          child: Form(
            key: _formKey,
            child: SingleChildScrollView(
              padding: EdgeInsets.all(15.0),
              child:Column(
               crossAxisAlignment: CrossAxisAlignment.stretch,
               children:<Widget> [
                
                 const SizedBox(height: 20.0),

                 TextFormField(
                   controller: _nameController,
                   keyboardType: TextInputType.text,
                   decoration: InputDecoration(
                     enabledBorder: OutlineInputBorder(
                       borderSide: BorderSide(
                         color:Colors.blue[900],
                         width:1.5,
                         style:BorderStyle.solid,
                       ),
                       borderRadius: BorderRadius.all(Radius.circular(15.0,
                       ),
                       ),
                     ),
                     focusedBorder: OutlineInputBorder(
                       borderSide: BorderSide(
                         color:Colors.blue[900],
                         width:1.5,
                         style:BorderStyle.solid,
                       ),
                       borderRadius: BorderRadius.all(Radius.circular(15.0,
                       ),
                       ),
                     ),
                     prefixIcon: Icon(Icons.person,
                     color: Colors.black,
                     ),
                      hintText: 'Name',
                      labelText: " Name",
                      helperText: "Your your full name",
                      labelStyle: TextStyle(
                        color: Colors.black,
                      ),
                   ),
                   maxLines: 1,

                 ),
                 
                const SizedBox(height: 20.0),
                 TextFormField(
                   controller: _icnoController,
                   keyboardType: TextInputType.text,
                   decoration: InputDecoration(
                     enabledBorder: OutlineInputBorder(
                       borderSide: BorderSide(
                         color:Colors.blue[900],
                         width:1.5,
                         style:BorderStyle.solid,
                       ),
                       borderRadius: BorderRadius.all(Radius.circular(15.0,
                       ),
                       ),
                     ),
                     focusedBorder: OutlineInputBorder(
                       borderSide: BorderSide(
                         color:Colors.blue[900],
                         width:1.5,
                         style:BorderStyle.solid,
                       ),
                       borderRadius: BorderRadius.all(Radius.circular(15.0,
                       ),
                       ),
                     ),
                     prefixIcon: Icon(Icons.person,
                     color: Colors.black,
                     ),
                     hintText: 'ic number',
                      labelText: "IC Number",
                      helperText: "Your IC number",
                      labelStyle: TextStyle(
                        color: Colors.black,
                      ),
                   ),
                   maxLines: 1,
                    
                 ),

                 const SizedBox(height: 20.0),
                 TextFormField(
                   controller: _genderController,
                   keyboardType: TextInputType.text,
                   decoration: InputDecoration(
                     enabledBorder: OutlineInputBorder(
                       borderSide: BorderSide(
                         color:Colors.blue[900],
                         width:1.5,
                         style:BorderStyle.solid,
                       ),
                       borderRadius: BorderRadius.all(Radius.circular(15.0,
                       ),
                       ),
                     ),
                     focusedBorder: OutlineInputBorder(
                       borderSide: BorderSide(
                         color:Colors.blue[900],
                         width:1.5,
                         style:BorderStyle.solid,
                       ),
                       borderRadius: BorderRadius.all(Radius.circular(15.0,
                       ),
                       ),
                     ),
                     prefixIcon: Icon(Icons.person,
                     color: Colors.black,
                     ),
                       hintText: 'gender',
                      labelText: "Gender",
                      helperText: "Your gender",
                      labelStyle: TextStyle(
                        color: Colors.black,
                      ),
                   ),
                   maxLines: 1,

                 ),

                 const SizedBox(height: 20.0),
                 TextFormField(
                   controller: _inasisController,
                   keyboardType: TextInputType.text,
                   decoration: InputDecoration(
                     enabledBorder: OutlineInputBorder(
                       borderSide: BorderSide(
                         color:Colors.blue[900],
                         width:1.5,
                         style:BorderStyle.solid,
                       ),
                       borderRadius: BorderRadius.all(Radius.circular(15.0,
                       ),
                       ),
                     ),
                     focusedBorder: OutlineInputBorder(
                       borderSide: BorderSide(
                         color:Colors.blue[900],
                         width:1.5,
                         style:BorderStyle.solid,
                       ),
                       borderRadius: BorderRadius.all(Radius.circular(15.0,
                       ),
                       ),
                     ),
                     prefixIcon: Icon(Icons.home,
                     color: Colors.black,
                     ),
                     hintText: 'inasis',
                      labelText: "Inasis",
                      helperText: "Your inasis",
                      labelStyle: TextStyle(
                        color: Colors.black,
                      ),
                   ),
                   maxLines: 1,

                 ),

                 const SizedBox(height: 20.0),
                 TextFormField(
                   controller: _phoneController,
                   keyboardType: TextInputType.text,
                   decoration: InputDecoration(
                     enabledBorder: OutlineInputBorder(
                       borderSide: BorderSide(
                         color:Colors.blue[900],
                         width:1.5,
                         style:BorderStyle.solid,
                       ),
                       borderRadius: BorderRadius.all(Radius.circular(15.0,
                       ),
                       ),
                     ),
                     focusedBorder: OutlineInputBorder(
                       borderSide: BorderSide(
                         color:Colors.blue[900],
                         width:1.5,
                         style:BorderStyle.solid,
                       ),
                       borderRadius: BorderRadius.all(Radius.circular(15.0,
                       ),
                       ),
                     ),
                     prefixIcon: Icon(Icons.call,
                     color: Colors.black,
                     ),
                
                      hintText: 'phone',
                      labelText: "Phone",
                      helperText: "Your telephone number",
                      labelStyle: TextStyle(
                        color: Colors.black,
                      ),
                   ),
                   maxLines: 1,

                 ),

                const SizedBox(height: 20.0),
                 TextFormField(
                   controller: _facultyController,
                   keyboardType: TextInputType.text,
                   decoration: InputDecoration(
                     enabledBorder: OutlineInputBorder(
                       borderSide: BorderSide(
                         color:Colors.blue[900],
                         width:1.5,
                         style:BorderStyle.solid,
                       ),
                       borderRadius: BorderRadius.all(Radius.circular(15.0,
                       ),
                       ),
                     ),
                     focusedBorder: OutlineInputBorder(
                       borderSide: BorderSide(
                         color:Colors.blue[900],
                         width:1.5,
                         style:BorderStyle.solid,
                       ),
                       borderRadius: BorderRadius.all(Radius.circular(15.0,
                       ),
                       ),
                     ),
                     prefixIcon: Icon(Icons.school,
                     color: Colors.black,
                     ),
                      hintText: 'faculty',
                      labelText: "Faculty",
                      helperText: "Your faculty",
                      labelStyle: TextStyle(
                        color: Colors.black,
                      ),
                   ),
                   maxLines: 1,

                 ),

                 const SizedBox(height: 30.0),
                 Container(
                   height:40,
                   child: ListView(
                     scrollDirection: Axis.horizontal,
                  children:<Widget>[
                         _buildContactType('lost'),
                     SizedBox(width:10),

                    _buildContactType('found'),
                     SizedBox(width:10),

                  ],

                   ),
                  
                   ),
                   
                 SizedBox(height:30.0),
                 Container(
                   width: double.infinity,
                   padding: EdgeInsets.symmetric(horizontal:10),
                   child: RaisedButton(child: Text('save', style:TextStyle(
                     fontSize: 20,
                     color: Colors.white,
                     fontWeight: FontWeight.w600,
                   ) ,
                   ),
                   onPressed: (){
                    saveContact(); 
                   },
                   color:Colors.blue[900],
                   ),

                 )
               ],
 
            ), 
            ),
          ),
        ),
      ),
    );
  }
  void saveContact(){
    String name = _nameController.text;
    String icno = _icnoController.text;
    String gender = _genderController.text;
    String inasis = _inasisController.text;
    String phone = _phoneController.text;
    String faculty = _facultyController.text;

    Map<String,String> contact ={
      'name': name,
      'icno': icno,
      'gender': gender,
      'inasis': inasis,
      'phone':  '+60' + phone,
      'faculty': faculty,
      'type': _typeSelected,
    };

    _ref.push().set(contact);
    
    

    
  }
}
