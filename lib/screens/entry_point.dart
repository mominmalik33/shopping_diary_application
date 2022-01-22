import 'package:flutter/material.dart';
import 'welcome_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'home_screen.dart';

class EntryPoint extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirebaseAuth.instance.authStateChanges(),builder: (ctx,userSnapshot){
      if(userSnapshot.hasData){
        return Home();
      }
      return WelcomeScreen();
    },
    );
  }
}
