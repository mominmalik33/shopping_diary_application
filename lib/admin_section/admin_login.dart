import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:marhabastores/admin_section/admin-management.dart';
import 'package:marhabastores/screens/home_screen.dart';
import 'package:marhabastores/screens/sign_up.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AdminLogin extends StatefulWidget {
  @override
  _AdminLoginState createState() => _AdminLoginState();
}

class _AdminLoginState extends State<AdminLogin> {

  final _formKey = GlobalKey<FormState>();
  String _username='';
  String _password='';

  void _processData() async{
    final isValid = _formKey.currentState.validate();
    FocusScope.of(context).unfocus();
    if(isValid){
      _formKey.currentState.save();
      if(_username=='admin' && _password=='admin123'){
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => AdminManagement()),
        );
      }

    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF07db63),
        title: Text('Admin Panel'),
        centerTitle: true,
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
                    Text('Admin Panel Login',style: TextStyle(fontSize: 25,color: Colors.black,fontWeight: FontWeight.bold)),
                    SizedBox(height: 8.0),
                    TextFormField(
                      key: ValueKey('Username'),
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                        labelText: 'Username',
                      ),
                      validator: (value){
                        if(value.isEmpty || value.length<5){
                          return 'Please enter valid username';
                        }
                        return null;
                      },
                      onSaved: (value){
                        _username = value;
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
                        if(value.isEmpty || value.length<6){
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
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
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
}
