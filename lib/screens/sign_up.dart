import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:marhabastores/screens/add_number.dart';
import 'package:marhabastores/screens/home_screen.dart';
import 'package:marhabastores/screens/sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final _formKey = GlobalKey<FormState>();
  final _auth = FirebaseAuth.instance;
  String _username='';
  String _phone='';
  String _email='';
  String _password='';
  bool _isLoading = false;

  void _processData() async{
    final isValid = _formKey.currentState.validate();
    FocusScope.of(context).unfocus();
    if(isValid){
      _formKey.currentState.save();
      UserCredential authResult;
      try{
        setState(() {
          _isLoading = true;
        }
        );
        authResult = await _auth.createUserWithEmailAndPassword(
            email: _email, password: _password
        );

        await FirebaseFirestore.instance.collection('users').doc(authResult.user.uid).set(
            {
              'username':_username,
              'email':_email,
              'id':FirebaseAuth.instance.currentUser.uid
            }
        );
      }
      on PlatformException catch(err){
        _showDialog(context, "Error", err.message);
        setState(() {
          _isLoading = false;
        });
      }
      catch(err){
        _showDialog(context, "Error", err);
        setState(() {
          _isLoading = false;
        });
      }
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => Home()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF07db63),
        title: Text('Sign Up Screen'),
      ),
      backgroundColor: Color(0xFFdff5e9),
      body: SafeArea(
        child: Container(
          child: Card(
            color: Colors.white,
            margin: EdgeInsets.only(bottom: 16.0),
            child: SingleChildScrollView(
              padding: EdgeInsets.all(16),
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Welcome To Marhaba Stores',style: TextStyle(fontSize: 25,color: Colors.black,fontWeight: FontWeight.bold)),
                    SizedBox(height: 8.0),
                    Text('Let''s get started',style: TextStyle(fontSize: 18,color: Colors.black54,fontWeight: FontWeight.w500)),
                    SizedBox(height: 20),
                    TextFormField(
                      key: ValueKey('Name'),
                      decoration: InputDecoration(
                        // enabledBorder: OutlineInputBorder(
                        //   borderRadius: BorderRadius.circular(20),
                        // ),
                        // focusedBorder: OutlineInputBorder(
                        //   borderRadius: BorderRadius.circular(20),
                        // ),
                        labelText: 'User Name',
                      ),
                      validator: (value){
                        if(value.isEmpty || value.length<4){
                          return 'Name should be greater than 3 letters';
                        }
                        return null;
                      },
                      onSaved: (value){
                        _username = value;
                      },
                    ),
                    TextFormField(
                      key: ValueKey('Email'),
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                        labelText: 'Email Address',
                      ),
                      validator: (value){
                        if(value.isEmpty || !value.contains('@')){
                          return 'Please enter valid email';
                        }
                        return null;
                      },
                      onSaved: (value){
                        _email = value;
                      },
                    ),
                    SizedBox(height: 20),
                    TextFormField(
                      key: ValueKey('Password'),
                      decoration: InputDecoration(
                        labelText: 'Password',
                      ),
                      obscureText: true,
                      validator: (value){
                        if(value.isEmpty || value.length<7){
                          return 'Password should at least contain 6 letters';
                        }
                        return null;
                      },
                      onSaved: (value){
                        _password = value;
                      },
                    ),
                    SizedBox(
                        height: 12
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        RaisedButton(
                            color: Color(0xFF07db63),
                            textColor: Colors.white,
                            child: _isLoading?CircularProgressIndicator():Text('Register Account',
                              style: TextStyle(fontSize:14),
                            ),
                            onPressed: (){
                              final isValid = _formKey.currentState.validate();
                              FocusScope.of(context).unfocus();
                              if(isValid){
                                _formKey.currentState.save();
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => AddNumber(email: _email,username: _username,password: _password,)),
                                );
                              }
                            }
                        ),
                        // RaisedButton(
                        //   color: Color(0xFF07db63),
                        //   textColor: Colors.white,
                        //   child: Text('Email SIGN UP',style: TextStyle(fontSize: 14)),
                        //   onPressed: _processData
                        //   // onPressed: _trySubmit
                        // ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
  Future <AlertDialog> _showDialog(BuildContext context, String title, String content,) {
    showDialog<AlertDialog>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Color(0xff1b447b),
          title: Text(title),
          content: Text(content),
          actions: [
            FlatButton(
                child: Text(
                  "Ok",
                  style: TextStyle(fontSize: 18,color: Colors.cyan),
                ),
                onPressed: () {
                  Navigator.of(context).pop();
                }),
          ],
        );
      },
    );
  }
}