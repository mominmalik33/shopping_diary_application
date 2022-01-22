import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AddItemData extends StatefulWidget {
  final String categoryName;
  AddItemData({this.categoryName});
  @override
  _AddItemDataState createState() => _AddItemDataState();
}

class _AddItemDataState extends State<AddItemData> {
  final _formKey = GlobalKey<FormState>();
  String _itemName = '';
  String _storeName = '';
  String _storeAddress = '';
  String _quantity = '';
  String _priority = '';

  Future<void> _addInformation(collectionName) async{
    final isValid = _formKey.currentState.validate();
    FocusScope.of(context).unfocus();
    if(isValid){
      _formKey.currentState.save();
      // final user = FirebaseAuth.instance.currentUser;
      // final userdata = await FirebaseFirestore.instance.collection('users').doc(user.uid).get();
      await FirebaseFirestore.instance.collection(collectionName).add(
          {
            'addedBy':FirebaseAuth.instance.currentUser.email,
            'itemName':_itemName,
            'storeName':_storeName,
            'storeAddress':_storeAddress,
            'quantity':_quantity,
            'priority': _priority,
            'createdAt':Timestamp.now(),
            'userId':FirebaseAuth.instance.currentUser.uid,
          }
      );
    }
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF07db63),
      resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 30,vertical: 30),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                TextFormField(
                  key: ValueKey('Item Name'),
                  autofocus: true,
                  style: TextStyle(color: Colors.white,fontSize: 20),
                  cursorColor: Colors.lightBlue,
                  decoration: InputDecoration(
                    hintText: 'Item Name',
                    hintStyle: TextStyle(color: Colors.lightBlue,fontSize: 20,fontWeight: FontWeight.bold),
                  ),
                  validator: (value){
                    if(value.isEmpty){
                      return 'Item Name can not be empty';
                    }
                    return null;
                  },
                  textAlign: TextAlign.center,
                  onSaved: (value){
                    _itemName = value;
                  },
                ),
                TextFormField(
                  key: ValueKey('Store Name'),
                  autofocus: true,
                  style: TextStyle(color: Colors.white,fontSize: 20),
                  cursorColor: Colors.lightBlue,
                  decoration: InputDecoration(
                    hintText: 'Store Name',
                    hintStyle: TextStyle(color: Colors.lightBlue,fontSize: 20,fontWeight: FontWeight.bold),
                  ),
                  validator: (value){
                    if(value.isEmpty){
                      return 'Store Name can not be empty';
                    }
                    return null;
                  },
                  textAlign: TextAlign.center,
                  onSaved: (value){
                    _storeName = value;
                  },
                ),
                TextFormField(
                  key: ValueKey('Store Address'),
                  autofocus: true,
                  style: TextStyle(color: Colors.white,fontSize: 20),
                  cursorColor: Colors.lightBlue,
                  decoration: InputDecoration(
                    hintText: 'Store Address',
                    hintStyle: TextStyle(color: Colors.lightBlue,fontSize: 20,fontWeight: FontWeight.bold),
                  ),
                  validator: (value){
                    if(value.isEmpty){
                      return 'Store Address can not be empty';
                    }
                    return null;
                  },
                  textAlign: TextAlign.center,
                  onSaved: (value){
                    _storeAddress = value;
                  },
                ),
                TextFormField(
                  key: ValueKey('Quantity'),
                  autofocus: true,
                  keyboardType: TextInputType.number,
                  style: TextStyle(color: Colors.white,fontSize: 20),
                  cursorColor: Colors.lightBlue,
                  decoration: InputDecoration(
                    hintText: 'Quantity',
                    hintStyle: TextStyle(color: Colors.lightBlue,fontSize: 20,fontWeight: FontWeight.bold),
                  ),
                  validator: (value){
                    if(value.isEmpty){
                      return 'Quantity can not be empty';
                    }
                    return null;
                  },
                  textAlign: TextAlign.center,
                  onSaved: (value){
                    _quantity = value;
                  },
                ),
                TextFormField(
                  key: ValueKey('Priority'),
                  autofocus: true,
                  style: TextStyle(color: Colors.white,fontSize: 20),
                  cursorColor: Colors.lightBlue,
                  decoration: InputDecoration(
                    hintText: 'Priority',
                    hintStyle: TextStyle(color: Colors.lightBlue,fontSize: 20,fontWeight: FontWeight.bold),
                  ),
                  validator: (value){
                    if(value.isEmpty){
                      return 'Priority is required';
                    }
                    if(value.trim()!='High' && value.trim()!='high' && value.trim()!='Medium' && value.trim()!='medium' && value.trim()!='Low' && value.trim()!='low'){
                      return 'High/high, Medium/medium or Low/low are acceptable only';
                    }
                    return null;
                  },
                  textAlign: TextAlign.center,
                  onSaved: (value){
                    _priority = value;
                  },
                ),
                SizedBox(height: 50),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    RaisedButton(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text('Add',style: TextStyle(fontSize: 20,color: Colors.white)),
                      ),
                      elevation: 0,
                      color: Colors.teal,
                      onPressed: () async{
                        final isValid = _formKey.currentState.validate();
                        FocusScope.of(context).unfocus();
                        if(isValid){
                          _formKey.currentState.save();
                          // final user = await FirebaseAuth.instance.currentUser;
                          // final userdata = await FirebaseFirestore.instance.collection('users').doc(user.uid).get();
                          await FirebaseFirestore.instance.collection(this.widget.categoryName).add(
                              {
                                'addedBy':FirebaseAuth.instance.currentUser.email,
                                'itemName':_itemName,
                                'storeName':_storeName,
                                'storeAddress':_storeAddress,
                                'quantity':_quantity,
                                'priority': _priority,
                                'createdAt':Timestamp.now(),
                                'userId':FirebaseAuth.instance.currentUser.uid,
                              }
                          );
                        }
                        Navigator.pop(context);
                      }
                    ),
                    RaisedButton(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text('Cancel',style: TextStyle(fontSize: 20,color: Colors.white)),
                      ),
                      color: Colors.red,
                      elevation: 0,
                      onPressed: (){
                        Navigator.pop(context);
                      },
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          Navigator.pop(context);
        },
        child: Icon(Icons.exit_to_app,size: 50,),
        backgroundColor: Colors.blueAccent,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endTop,
    );
  }
}
