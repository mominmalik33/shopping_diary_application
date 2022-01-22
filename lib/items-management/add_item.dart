import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:marhabastores/items-management/add_item_data.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:marhabastores/items-management/item_details_screen.dart';

class AddItem extends StatefulWidget {

  final String itemData;
  final IconData icondata;
  AddItem({this.itemData,this.icondata});
  @override
  _AddItemState createState() => _AddItemState();

}

class _AddItemState extends State<AddItem> {
  @override
  Widget build(BuildContext context) {

    final String itemRecord = this.widget.itemData;

    return Scaffold(
      appBar: AppBar(
        title: Text(this.widget.itemData+' Buy List'),
        centerTitle: true,
        backgroundColor: Color(0xFF07db63),
      ),
      body: FutureBuilder(
          builder:(ctx,futureSnapshot){
            if(futureSnapshot.connectionState == ConnectionState.waiting){
              return Center(
                child: CircularProgressIndicator(),
              );
            }
            return StreamBuilder(
              stream: FirebaseFirestore.instance.collection(itemRecord).snapshots(),
              builder: (context,itemSnapshot) {
                if(itemSnapshot.connectionState == ConnectionState.waiting){
                  return Center(
                      child: CircularProgressIndicator()
                  );
                }
                final itemID = itemSnapshot.data.docs;
                return ListView.builder(
                  itemCount: itemID.length,
                  itemBuilder: (ctx,index) {


                    return itemID[index]['userId']==FirebaseAuth.instance.currentUser.uid ? Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Card(
                        elevation: 2.0,
                        child: ListTile(
                          leading: Icon(this.widget.icondata,size: 30,color: Colors.teal),
                          title:Padding(padding: EdgeInsets.all(4.0),child:Text(itemID[index]['itemName'],style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold))),
                          subtitle: Padding(padding: EdgeInsets.all(4.0),child:Text(itemID[index]['storeName'] + ' ' + itemID[index]['storeAddress'],style: TextStyle(color: Colors.black38,fontSize: 15,fontWeight: FontWeight.w500))),
                          trailing: Column(
                            children: [
                              Text(itemID[index]['quantity'],style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15,color: Colors.green)),
                              Text(itemID[index]['priority']+' priority',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15,color: Colors.green)),
                            ],
                          ),
                          onTap: (){
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => ItemDetailsScreen(
                                title: itemID[index]['itemName'],
                                itemName: itemID[index]['itemName'],
                                storeName: itemID[index]['storeName'],
                                storeAddress: itemID[index]['storeAddress'],
                                quantity: itemID[index]['quantity'],
                                priority:itemID[index]['priority'],
                              )),
                            );
                          },
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
          final String coll = this.widget.itemData;
          showModalBottomSheet(context: context, builder: (context) => AddItemData(categoryName: coll));
        },
        child: Icon(Icons.add,size: 50),
        backgroundColor: Color(0xFF07db63),
      ),
    );
  }
}