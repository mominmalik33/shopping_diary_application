import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:marhabastores/stores_management/add_stores.dart';

class Stores extends StatefulWidget {
  @override
  _StoresState createState() => _StoresState();
}

class _StoresState extends State<Stores> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
          builder:(ctx,futureSnapshot){
            if(futureSnapshot.connectionState == ConnectionState.waiting){
              return Center(
                child: CircularProgressIndicator(),
              );
            }
            return StreamBuilder(
              stream: FirebaseFirestore.instance.collection('stores').snapshots(),
              builder: (context,storeSnapshot) {
                if(storeSnapshot.connectionState == ConnectionState.waiting){
                  return Center(
                      child: CircularProgressIndicator()
                  );
                }
                final storeID = storeSnapshot.data.docs;
                return ListView.builder(
                    itemCount: storeID.length,
                    itemBuilder: (ctx,index) {
                      return storeID[index]['userId']==FirebaseAuth.instance.currentUser.uid ? Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Card(
                          elevation: 2.0,
                          child: ListTile(
                            leading: Icon(Icons.local_grocery_store,size: 30,color: Colors.green),
                            title:Padding(padding: EdgeInsets.all(4.0),child:Text(storeID[index]['storeName'] + ' ' + storeID[index]['priority'],style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold))),
                            subtitle: Padding(padding: EdgeInsets.all(4.0),child:Text(storeID[index]['storeAddress'],style: TextStyle(color: Colors.black38,fontSize: 15,fontWeight: FontWeight.w500))),
                            trailing: Icon(Icons.shopping_basket_rounded,size: 30,color: Colors.yellow),
                          ),
                        ),
                      ):Text('');
                    }
                );
              },
            );
          }
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          showModalBottomSheet(context: context, builder: (context) => AddStoresData());
        },
        child: Icon(Icons.add,size: 50),
        backgroundColor: Color(0xFF07db63),
      ),
    );
  }
}
