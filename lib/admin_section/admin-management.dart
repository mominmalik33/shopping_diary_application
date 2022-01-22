import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:marhabastores/admin_section/admin_drawer.dart';
import 'package:marhabastores/admin_section/users_list.dart';

class AdminManagement extends StatefulWidget {
  @override
  _AdminManagementState createState() => _AdminManagementState();
}

class _AdminManagementState extends State<AdminManagement> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: AdminDrawer(),
      appBar: AppBar(
        title: Text('Admin Control'),
        centerTitle: true,
        backgroundColor: Colors.green,
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
              builder: (context,userSnapshot) {
                if(userSnapshot.connectionState == ConnectionState.waiting){
                  return Center(
                      child: CircularProgressIndicator()
                  );
                }
                final userData = userSnapshot.data.docs;
                return ListView(
                  children: [
                    GestureDetector(
                      child: Container(
                        width: MediaQuery. of(context). size. width,
                        height: 200,
                        margin: EdgeInsets.all(16.0),
                        padding: EdgeInsets.only(left:16.0,right: 16.0),
                        decoration: BoxDecoration(
                          color: Colors.teal,
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              'Total Users',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 27, color: Colors.white),
                            ),
                            Text(
                              userData.length.toString(),
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                                fontSize: 20,
                              ),
                            ),
                          ],
                        ),
                      ),
                      onTap: (){
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => UsersList()),
                        );
                      },
                    ),
                    Container(
                      width: MediaQuery. of(context). size. width,
                      height: 200,
                      margin: EdgeInsets.all(16.0),
                      padding: EdgeInsets.only(left:16.0,right: 16.0),
                      decoration: BoxDecoration(
                        color: Colors.green,
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            'Active Users',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 27, color: Colors.white),
                          ),
                          Text(
                            userData.length.toString(),
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              fontSize: 20,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      width: MediaQuery. of(context). size. width,
                      height: 200,
                      margin: EdgeInsets.all(16.0),
                      padding: EdgeInsets.only(left:16.0,right: 16.0),
                      decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            'Blocked Users',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 27, color: Colors.white),
                          ),
                          Text(
                            '0',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              fontSize: 20,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                );
              },
            );
          }
      )
    );
  }
}