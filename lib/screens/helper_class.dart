import 'package:flutter/material.dart';

class HelperClass extends StatefulWidget {

  final String title;
  final String details;
  HelperClass({this.title,this.details});

  @override
  _HelperClassState createState() => _HelperClassState();
}

class _HelperClassState extends State<HelperClass> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF07db63),
        title: Text(this.widget.title),
        centerTitle: true,
      ),
      body: Center(
        child: Text(this.widget.details,textAlign: TextAlign.center,style: TextStyle(fontSize: 25,fontWeight: FontWeight.w500)),
      ),
    );
  }
}
