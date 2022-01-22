import 'package:flutter/material.dart';

class Notifications extends StatefulWidget {
  @override
  _NotificationsState createState() => _NotificationsState();
}

class _NotificationsState extends State<Notifications> {

  final List _items = ['Fresh Food Fiesta','Food Promotion','Fresh Food Fiesta','Food Promotion'];

  final List _messages = ['23rd to 30th November os selected Vegetables,Fruits,Fish and Meats',
    'Kraft Cheese Tin 200G was: Rs.825.00 Food Member Deal: Rs.618.00',
    '23rd to 30th November os selected Vegetables,Fruits,Fish and Meats',
    'Kraft Cheese Tin 200G was: Rs.825.00 Food Member Deal: Rs.618.00'
  ];

  final List _arrival = ['now','10 minutes ago','Sun, 2:20 pm','Fri, 8:00 pm'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF07db63),
        title: Text('Notifications'),
        leading: IconButton(icon: Icon(Icons.close),onPressed: (){
          Navigator.of(context).pop();
        }),
        centerTitle: true,
        elevation: 0,
        actions: [
          Padding(
              padding: EdgeInsets.only(right: 20.0),
              child: GestureDetector(
                onTap: () {},
                child: Icon(
                  Icons.notifications,
                  size: 26.0,
                ),
              )
          ),
        ],
      ),
      backgroundColor: Color(0xFFdff5e9),
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(left: 10.0,top: 10.0),
              child: Text('Today',style: TextStyle(fontSize: 22,fontWeight: FontWeight.w600,color: Colors.black38)),
            ),
            Flexible(
              child: ListView.builder(
                physics: ScrollPhysics(),
                shrinkWrap: true,
                itemCount: _items.length-2,
                itemBuilder: (context,index){
                  return Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8.0),
                    child: Card(
                      child: Column(
                        children: [
                          ListTile(
                            leading: CircleAvatar(radius: 30,backgroundColor: Colors.greenAccent,child: Icon(Icons.notifications_none_outlined,size: 25),),
                            title: Text(_items[index],style: TextStyle(fontWeight:FontWeight.bold)),
                            subtitle: Text(_messages[index],style: TextStyle(fontWeight:FontWeight.w500)),
                            trailing: Text(_arrival[index],style: TextStyle(color: Colors.green)),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
            SizedBox(height: 20),
            Padding(
              padding: EdgeInsets.only(left: 10.0),
              child: Text('Earlier',style: TextStyle(fontSize: 22,fontWeight: FontWeight.w600,color: Colors.black38)),
            ),
            Flexible(
              child: ListView.builder(
                physics: ScrollPhysics(),
                shrinkWrap: true,
                itemCount: _items.length-2,
                itemBuilder: (context,index){
                  return Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8.0),
                    child: Card(
                      child: Column(
                        children: [
                          ListTile(
                            leading: CircleAvatar(radius: 30,backgroundColor: Colors.greenAccent,child: Icon(Icons.notifications_none_outlined,size: 25),),
                            title: Text(_items[index+2],style: TextStyle(fontWeight:FontWeight.bold)),
                            subtitle: Text(_messages[index+2],style: TextStyle(fontWeight:FontWeight.w500)),
                            trailing: Text(_arrival[index+2],style: TextStyle(color: Colors.green)),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
