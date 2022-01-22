import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:marhabastores/screens/home_screen.dart';
import 'package:pinput/pin_put/pin_put.dart';

class OTPScreen extends StatefulWidget {
  final String phone;
  final String username;
  final String email;
  final String password;
  OTPScreen({this.phone,this.username,this.email,this.password});
  @override
  _OTPScreenState createState() => _OTPScreenState();
}

class _OTPScreenState extends State<OTPScreen> {
  final GlobalKey<ScaffoldState> _scaffoldkey = GlobalKey<ScaffoldState>();
  String _verificationCode;
  final TextEditingController _pinPutController = TextEditingController();
  final FocusNode _pinPutFocusNode = FocusNode();
  final BoxDecoration pinPutDecoration = BoxDecoration(
    color: const Color.fromRGBO(43, 46, 66, 1),
    borderRadius: BorderRadius.circular(10.0),
    border: Border.all(
      color: const Color.fromRGBO(126, 203, 224, 1),
    ),
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldkey,
      appBar: AppBar(
        title: Text('Verify Number'),
        centerTitle: true,
        backgroundColor: Color(0xFF07db63),
      ),
      body: Column(
        children: [
          Container(
            margin: EdgeInsets.only(top: 40),
            child: Center(
              child: Text(
                'Verify +${widget.phone}',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 26),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(30.0),
            child: PinPut(
              fieldsCount: 6,
              textStyle: const TextStyle(fontSize: 25.0, color: Colors.white),
              eachFieldWidth: 40.0,
              eachFieldHeight: 55.0,
              focusNode: _pinPutFocusNode,
              controller: _pinPutController,
              submittedFieldDecoration: pinPutDecoration,
              selectedFieldDecoration: pinPutDecoration,
              followingFieldDecoration: pinPutDecoration,
              pinAnimationType: PinAnimationType.fade,
              onSubmit: (pin) async {
                try {
                  await FirebaseAuth.instance.
                  createUserWithEmailAndPassword(email: this.widget.email,password: this.widget.password)
                      .then((value) async {
                    if (value.user != null){
                      await FirebaseFirestore.instance.collection('users').doc(FirebaseAuth.instance.currentUser.uid).set(
                          {
                            'username':this.widget.username,
                            'email':this.widget.email,
                            'id':FirebaseAuth.instance.currentUser.uid
                          }
                      );
                      Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(builder: (context) => Home()),
                              (route) => false);
                    }
                  });
                } catch (e) {
                  FocusScope.of(context).unfocus();
                  _scaffoldkey.currentState
                      .showSnackBar(SnackBar(content: Text('invalid OTP')));
                }
              },
            ),
          ),
          RaisedButton(
              color: Color(0xFF07db63),
              textColor: Colors.white,
              child: Text('Resend',style: TextStyle(fontSize: 18)),
              onPressed: _verifyPhone
            // onPressed: _trySubmit
          ),
        ],
      ),
    );
  }

  _verifyPhone() async {
    await FirebaseAuth.instance.verifyPhoneNumber(
        phoneNumber: '+${widget.phone}',
        verificationCompleted: (PhoneAuthCredential credential) async {
          await FirebaseAuth.instance
              .createUserWithEmailAndPassword(email: this.widget.email,password: this.widget.password)
              .then((value) async {
            if (value.user != null) {
              await FirebaseFirestore.instance.collection('users').doc(FirebaseAuth.instance.currentUser.uid).set(
                  {
                    'username':this.widget.username,
                    'email':this.widget.email,
                    'id':FirebaseAuth.instance.currentUser.uid
                  }
              );
              Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => Home()),
                      (route) => false);
            }
          });
        },
        verificationFailed: (FirebaseAuthException e) {
          print(e.message);
        },
        codeSent: (String verficationID, int resendToken) {
          setState(() {
            _verificationCode = verficationID;
          });
        },
        codeAutoRetrievalTimeout: (String verificationID) {
          setState(() {
            _verificationCode = verificationID;
          });
        },
        timeout: Duration(seconds: 120)
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _verifyPhone();
  }
}



// try {
// await FirebaseAuth.instance
//     .signInWithCredential(PhoneAuthProvider.credential(
// verificationId: _verificationCode, smsCode: pin))
//     .then((value) async {
// if (value.user != null){
// await FirebaseFirestore.instance.collection('users').doc(FirebaseAuth.instance.currentUser.uid).set(
// {
// 'username':this.widget.username,
// 'email':this.widget.email,
// 'id':FirebaseAuth.instance.currentUser.uid
// }
// );
// Navigator.pushAndRemoveUntil(
// context,
// MaterialPageRoute(builder: (context) => Home()),
// (route) => false);
// }
// });
// } catch (e) {
// FocusScope.of(context).unfocus();
// _scaffoldkey.currentState
//     .showSnackBar(SnackBar(content: Text('invalid OTP')));
// }