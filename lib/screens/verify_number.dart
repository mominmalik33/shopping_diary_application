import 'package:flutter/material.dart';

class VerifyNumber extends StatefulWidget {
  @override
  _VerifyNumberState createState() => _VerifyNumberState();
}

class _VerifyNumberState extends State<VerifyNumber> {
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF07db63),
        leading: GestureDetector(
          onTap: () { },
          child: Icon(
            Icons.arrow_back,
          ),
        ),
        centerTitle: true,
        title: Text('Verify Number'),
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
                  // crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Verify Your Number',style: TextStyle(fontSize: 25,color: Colors.black,fontWeight: FontWeight.bold)),
                    SizedBox(height: 8.0),
                    Text('4 Digit Code Sent To',style: TextStyle(fontSize: 18,color: Colors.black54,fontWeight: FontWeight.w500)),
                    SizedBox(height: 20),
                    TextFormField(
                      key: ValueKey('Number'),
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        labelText: 'Verify Code',
                      ),
                      validator: (value){
                        if(value.isEmpty || value.length<4){
                          return 'Password should at least contain 6 letters';
                        }
                        return null;
                      },
                      onSaved: (value){
                        // _userEmail = value;
                      },
                    ),
                    SizedBox(
                        height: 12
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        FlatButton(
                            child: Text('Resend',
                              style: TextStyle(color: Colors.black87,fontWeight: FontWeight.bold),
                            ),
                            onPressed: (){

                            }
                        ),
                        RaisedButton(
                          color: Color(0xFF07db63),
                          textColor: Colors.white,
                          child: Text('VERIFY',style: TextStyle(fontSize: 18),),
                          onPressed: (){

                          },
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
