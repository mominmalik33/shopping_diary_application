import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    final userdata = FirebaseFirestore.instance.collection('users').doc(FirebaseAuth.instance.currentUser.uid).get();
    return Scaffold(
      body: SafeArea(
        child: FutureBuilder(
            builder:(ctx,futureSnapshot){
              if(futureSnapshot.connectionState == ConnectionState.waiting){
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
              return StreamBuilder(
                stream: FirebaseFirestore.instance.collection('users').snapshots(),
                builder: (context,userSnapshot) {
                  if(userSnapshot.connectionState == ConnectionState.waiting){
                    return Center(
                        child: CircularProgressIndicator()
                    );
                  }
                  final userID = userSnapshot.data.docs;
                  return ListView.builder(
                      itemCount: userID.length,
                      itemBuilder: (ctx,index) {
                        return userID[index]['id'] == FirebaseAuth.instance.currentUser.uid ? Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Card(
                                elevation: 2.0,
                                child: Image.asset('assets/profile.png'),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Card(
                                elevation: 2.0,
                                child: ListTile(
                                  title:Padding(padding: EdgeInsets.all(4.0),child:Text('Username',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold))),
                                  subtitle: Padding(padding: EdgeInsets.all(4.0),child:Text(userID[index]['username'],style: TextStyle(color: Colors.black38,fontSize: 15,fontWeight: FontWeight.w500))),
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Card(
                                elevation: 2.0,
                                child: ListTile(
                                  title:Padding(padding: EdgeInsets.all(4.0),child:Text('Email',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold))),
                                  subtitle: Padding(padding: EdgeInsets.all(4.0),child:Text(userID[index]['email'],style: TextStyle(color: Colors.black38,fontSize: 15,fontWeight: FontWeight.w500))),
                                ),
                              ),
                            )
                          ],
                        ):SizedBox(height: 1);
                      }
                  );
                },
              );
            }
        ),
      ),
    );
  }
}
