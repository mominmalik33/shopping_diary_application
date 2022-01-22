import 'package:flutter/material.dart';
import 'package:marhabastores/screens/otp.dart';

class AddNumber extends StatefulWidget {
  final String username;
  final String email;
  final String password;
  AddNumber({this.username,this.email,this.password});
  @override
  _AddNumberState createState() => _AddNumberState();
}

class _AddNumberState extends State<AddNumber> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController _controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF07db63),
        centerTitle: true,
        title: Text('Add Number'),
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
                    Text('Provide Your Number',style: TextStyle(fontSize: 25,color: Colors.black,fontWeight: FontWeight.bold)),
                    SizedBox(height: 8.0),
                    Text('Enter mobile number to continue',style: TextStyle(fontSize: 18,color: Colors.black54,fontWeight: FontWeight.w500)),
                    SizedBox(height: 20),
                    TextFormField(
                      key: ValueKey('Phone'),
                      keyboardType: TextInputType.phone,
                      controller: _controller,
                      maxLength: 13,
                      decoration: InputDecoration(
                        labelText: 'Mobile Number',
                      ),
                      validator: (value){
                        if(value.isEmpty || value.length<12){
                          return 'Please enter valid number';
                        }
                        return null;
                      },

                    ),
                    SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        FlatButton(
                            child: Text('Cancel',
                              style: TextStyle(color: Colors.black87,fontWeight: FontWeight.bold),
                            ),
                            onPressed: (){
                              Navigator.of(context).pop();
                            }
                        ),
                        RaisedButton(
                          color: Color(0xFF07db63),
                          textColor: Colors.white,
                          child: Text('SEND',style: TextStyle(fontSize: 18),),
                          onPressed: (){
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => OTPScreen(phone: _controller.text,username: this.widget.username,email: this.widget.email,password: this.widget.password)));
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
