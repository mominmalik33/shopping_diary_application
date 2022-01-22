import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:marhabastores/screens/home_screen.dart';
import 'package:marhabastores/screens/sign_up.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class SignIn extends StatefulWidget {
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {

  final _formKey = GlobalKey<FormState>();
  final _auth = FirebaseAuth.instance;
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
        authResult = await _auth.signInWithEmailAndPassword(
            email: _email, password: _password
        );

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
        title: Text('Sign In Screen'),
        actions: [
          RaisedButton(
            color: Color(0xFF07db63),
            textColor: Colors.white,
            elevation: 0,
            child: Text('Sign up',style: TextStyle(fontSize: 20)),
            onPressed: (){
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SignUp()),
              );
            },
          ),
        ],
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
                    Text('Sign In To Marhaba Stores',style: TextStyle(fontSize: 25,color: Colors.black,fontWeight: FontWeight.bold)),
                    SizedBox(height: 8.0),
                    Text('Enter email and password to continue',style: TextStyle(fontSize: 18,color: Colors.black54,fontWeight: FontWeight.w500)),
                    SizedBox(height: 20),
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
                        // FlatButton(
                        //     child: _isLoading?CircularProgressIndicator():Text('Forgot Password?',
                        //       style: TextStyle(color: Colors.black87,fontWeight: FontWeight.bold),
                        //     ),
                        //     onPressed: (){
                        //
                        //     }
                        // ),
                        RaisedButton(
                          color: Color(0xFF07db63),
                          textColor: Colors.white,
                          child: Text('LOGIN',style: TextStyle(fontSize: 18),),
                          onPressed: _processData,
                          // onPressed: _trySubmit
                        ),
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
