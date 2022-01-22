import 'package:marhabastores/admin_section/admin_login.dart';
import 'package:marhabastores/screens/sign_in.dart';
import 'package:marhabastores/screens/sign_up.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class WelcomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF07db63),
      body: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset('assets/marhabastores.jpg'),
              Text('Welcome To Marhaba Stores',textAlign: TextAlign.center,style: TextStyle(color: Colors.white,fontSize: 30,fontWeight: FontWeight.bold)),
              FlatButton(
                child: Text('SIGN UP',style: TextStyle(fontSize: 25),),
                color: Colors.white,
                height: 40,
                textColor: Color(0xFF07db63),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SignUp()),
                  );
                },
              ),
              Text('Already Registered?',style: TextStyle(color: Colors.white),),
              FlatButton(
                child: Text('SIGN IN',style:TextStyle(fontSize: 25)),
                height: 40,
                color: Colors.white,
                textColor: Color(0xFF07db63),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SignIn()),
                  );
                },
              ),
              // FlatButton(
              //   child: Text('Admin Login',style: TextStyle(fontSize: 20)),
              //   // color: Colors.white,
              //   textColor: Colors.white,
              //   onPressed: () {
              //     Navigator.push(
              //       context,
              //       MaterialPageRoute(builder: (context) => AdminLogin()),
              //     );
              //   },
              // ),
            ],
          ),
        ),
    );
  }
}