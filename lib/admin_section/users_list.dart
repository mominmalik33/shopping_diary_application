import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class UsersList extends StatefulWidget {
  @override
  _UsersListState createState() => _UsersListState();
}

class _UsersListState extends State<UsersList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Users Record'),
        centerTitle: true,
        backgroundColor: Colors.lightGreen,
      ),
      body: FutureBuilder(
        builder:(ctx,futureSnapshot){
      if(futureSnapshot.connectionState == ConnectionState.waiting){
        return Center(
          child: CircularProgressIndicator(),
        );
      }
      return StreamBuilder(
        stream: FirebaseFirestore.instance.collection('users').snapshots(),
        builder: (context,groupSnapshot) {
          if(groupSnapshot.connectionState == ConnectionState.waiting){
            return Center(
                child: CircularProgressIndicator()
            );
          }
          final groupData = groupSnapshot.data.docs;
          return ListView.builder(
              itemCount: groupData.length,
              itemBuilder: (ctx,index) => Padding(
                padding: EdgeInsets.symmetric(horizontal: 0,vertical: 10.0),
                child: ListTile(
                  leading: Image.asset('assets/profile.png'),
                  title: Text(groupData[index]['email']),
                  subtitle: Text(groupData[index]['username']),
                  trailing: RaisedButton(
                    child: Text('Block User'),
                    color: Colors.red,
                    textColor: Colors.white,
                    onPressed: (){
                      FirebaseAuth.instance.currentUser.delete();
                    },
                  ),
                ),
              )
          );
        },
      );
    })
    );
  }
}