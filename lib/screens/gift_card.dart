import 'package:flutter/material.dart';

class GiftCard extends StatefulWidget {
  @override
  _GiftCardState createState() => _GiftCardState();
}

class _GiftCardState extends State<GiftCard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.teal,
          title: Text('My Gift Card'),
          centerTitle: true,
        ),
      body:Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset('assets/giftcard.jpg'),
          RaisedButton(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.0),
            ),
            child: Container(
              margin: EdgeInsets.all(8),
              child: Text(
                'Claim Gift Card',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                ),
              ),
            ),
            color: Colors.teal,
            onPressed: () {
              _showValidDialog(context,"Gift","Your gift card has benn successfully claimed");
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
