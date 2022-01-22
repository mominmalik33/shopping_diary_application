import 'package:flutter/material.dart';

class InviteEarn extends StatefulWidget {
  @override
  _InviteEarnState createState() => _InviteEarnState();
}

class _InviteEarnState extends State<InviteEarn> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.teal,
          title: Text('Invite and Earn'),
          centerTitle: true,
        ),
        body:Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('assets/refer.jpg'),
              RaisedButton(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: Container(
                  margin: EdgeInsets.all(8),
                  child: Text(
                    'Invite and Claim',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                    ),
                  ),
                ),
                color: Colors.blueAccent,
                onPressed: () {
                  _showValidDialog(context,"Invite & Earn","You invited and claimed");
                },
              )
            ],
          ),
        )
    );
  }
}

Future <AlertDialog> _showValidDialog(BuildContext context, String title, String content,) {
  showDialog<AlertDialog>(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        backgroundColor: Colors.tealAccent,
        title: Text(title),
        content: Text(content),
        actions: [
          FlatButton(
              child: Text(
                "Ok",
                style: TextStyle(fontSize: 18),
              ),
              onPressed: () {
                Navigator.of(context).pop();
              }),
        ],
      );
    },
  );
}