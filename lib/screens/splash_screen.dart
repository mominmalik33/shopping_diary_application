import 'dart:async';
import 'package:flutter/material.dart';
import 'package:marhabastores/screens/entry_point.dart';


class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    Timer(Duration(seconds: 3), (){
      Navigator.of(context).push(MaterialPageRoute(builder: (ctx) => EntryPoint()));
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Image.asset('assets/marhabastores2.jpg',fit: BoxFit.cover),
        ),
      ),
    );
  }
}
