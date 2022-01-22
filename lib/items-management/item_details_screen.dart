import 'package:flutter/material.dart';

class ItemDetailsScreen extends StatelessWidget {

  ItemDetailsScreen({this.title,this.itemName,this.storeName,this.storeAddress,this.priority,this.quantity});
  final String title;
  final String itemName;
  final String storeName;
  final String storeAddress;
  final String priority;
  final String quantity;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF07db63),
        title: Text(title + ' Details'),
        centerTitle: true,
      ),
      body: ListView(
        children: [
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Card(
              elevation: 2.0,
              child: ListTile(
                title:Padding(padding: EdgeInsets.all(4.0),child:Text('Item Name',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold))),
                subtitle: Padding(padding: EdgeInsets.all(4.0),child:Text(itemName,style: TextStyle(color: Colors.black38,fontSize: 15,fontWeight: FontWeight.w500))),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Card(
              elevation: 2.0,
              child: ListTile(
                title:Padding(padding: EdgeInsets.all(4.0),child:Text('Store Name',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold))),
                subtitle: Padding(padding: EdgeInsets.all(4.0),child:Text(storeName,style: TextStyle(color: Colors.black38,fontSize: 15,fontWeight: FontWeight.w500))),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Card(
              elevation: 2.0,
              child: ListTile(
                title:Padding(padding: EdgeInsets.all(4.0),child:Text('Store Address',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold))),
                subtitle: Padding(padding: EdgeInsets.all(4.0),child:Text(storeAddress,style: TextStyle(color: Colors.black38,fontSize: 15,fontWeight: FontWeight.w500))),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Card(
              elevation: 2.0,
              child: ListTile(
                title:Padding(padding: EdgeInsets.all(4.0),child:Text('Quantity',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold))),
                subtitle: Padding(padding: EdgeInsets.all(4.0),child:Text(quantity,style: TextStyle(color: Colors.black38,fontSize: 15,fontWeight: FontWeight.w500))),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Card(
              elevation: 2.0,
              child: ListTile(
                title:Padding(padding: EdgeInsets.all(4.0),child:Text('Priority',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold))),
                subtitle: Padding(padding: EdgeInsets.all(4.0),child:Text(priority,style: TextStyle(color: Colors.black38,fontSize: 15,fontWeight: FontWeight.w500))),
              ),
            ),
          )
        ],
      ),
    );
  }
}
