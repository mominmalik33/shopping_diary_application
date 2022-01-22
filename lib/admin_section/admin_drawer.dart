import 'package:flutter/material.dart';
import 'package:marhabastores/admin_section/admin-management.dart';
import 'package:marhabastores/admin_section/admin_login.dart';
import 'package:marhabastores/admin_section/users_list.dart';

class AdminDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          AppBar(
            title: Text('Admin Dashboard'),
            backgroundColor: Colors.teal,
            automaticallyImplyLeading: false,
          ),
          SizedBox(height: 20),
          ListTile(
            leading: CircleAvatar(radius:20,backgroundColor: Colors.tealAccent,child: Icon(Icons.account_circle_outlined,color:Colors.green,size: 25)),
            title: Text('See Users'),
            onTap: (){
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => UsersList()),
              );
            },
          ),
          Divider(),
          ListTile(
            leading: CircleAvatar(radius:20,backgroundColor: Colors.tealAccent,child: Icon(Icons.account_circle,color:Colors.green,size: 25)),
            title: Text('Block Users'),
            onTap: (){
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => UsersList()),
              );
            },
          ),
          Divider(),
          ListTile(
            leading: CircleAvatar(radius:20,backgroundColor: Colors.tealAccent,child: Icon(Icons.home,color:Colors.green,size: 25)),
            title: Text('Home'),
            onTap: (){
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => AdminManagement()),
              );
            },
          ),
          Divider(),
          ListTile(
            leading: CircleAvatar(radius:20,backgroundColor: Colors.tealAccent,child: Icon(Icons.ev_station_sharp,color:Colors.green,size: 25)),
            title: Text('Statistics'),
            onTap: (){
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => AdminManagement()),
              );
            },
          ),
          Divider(),
          ListTile(
            leading: CircleAvatar(radius:20,backgroundColor: Colors.tealAccent,child: Icon(Icons.exit_to_app,color:Colors.green,size: 25)),
            title: Text('Logout'),
            onTap: (){
              Navigator.of(context).pop();
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => AdminLogin()),
              );
            },
          ),
        ],
      ),
    );
  }
}
