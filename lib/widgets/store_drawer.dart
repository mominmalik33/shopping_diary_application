import 'package:marhabastores/messaging/chat_screen.dart';
import 'package:marhabastores/screens/gift_card.dart';
import 'package:marhabastores/screens/helper_class.dart';
import 'package:marhabastores/screens/invite_and_earn.dart';
import 'package:marhabastores/screens/payment.dart';
import 'package:marhabastores/screens/stores.dart';
import 'package:marhabastores/screens/welcome_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class StoreDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          AppBar(
            title: Text('Marhaba Stores'),
            backgroundColor: Colors.teal,
            automaticallyImplyLeading: false,
          ),
          SizedBox(height: 20),
          ListTile(
            leading: CircleAvatar(radius:20,backgroundColor: Colors.tealAccent,child: Icon(Icons.location_on,color:Colors.green,size: 25)),
            title: Text('Track Orders'),
            onTap: (){
              // Navigator.of(context).pushNamed('/');
            },
          ),
          Divider(),
          ListTile(
            leading: CircleAvatar(radius:20,backgroundColor: Colors.tealAccent,child: Icon(Icons.attach_money,color:Colors.green,size: 25)),
            title: Text('Payment'),
            onTap: (){
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Payment()),
              );
            },
          ),
          Divider(),
          ListTile(
            leading: CircleAvatar(radius:20,backgroundColor: Colors.tealAccent,child: Icon(Icons.local_convenience_store,color:Colors.green,size: 25)),
            title: Text('Store Locator'),
            onTap: (){
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Stores()),
              );
            },
          ),
          Divider(),
          ListTile(
            leading: CircleAvatar(radius:20,backgroundColor: Colors.tealAccent,child: Icon(Icons.wallet_giftcard_sharp,color:Colors.green,size: 25)),
            title: Text('My Gift Card'),
            onTap: (){
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => GiftCard()),
              );
            },
          ),
          Divider(),
          ListTile(
            leading: CircleAvatar(radius:20,backgroundColor: Colors.tealAccent,child: Icon(Icons.insert_invitation,color:Colors.green,size: 25)),
            title: Text('Invite and Earn'),
            onTap: (){
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => InviteEarn()),
              );
            },
          ),
          Divider(),
          ListTile(
            leading: CircleAvatar(radius:20,backgroundColor: Colors.tealAccent,child: Icon(Icons.chat_bubble_outlined,color:Colors.green,size: 25)),
            title: Text('Chat Window'),
            onTap: (){
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ChatScreen()),
              );
            },
          ),
          Divider(),
          ListTile(
            leading: CircleAvatar(radius:20,backgroundColor: Colors.tealAccent,child: Icon(Icons.battery_alert_rounded,color:Colors.green,size: 25)),
            title: Text('Terms and Conditions'),
            onTap: (){
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => HelperClass(title: 'Terms and Conditions',details: 'Details of terms and conditions appear here')),
              );
            },
          ),
          Divider(),
          ListTile(
            leading: CircleAvatar(radius:20,backgroundColor: Colors.tealAccent,child: Icon(Icons.help_outline,color:Colors.green,size: 25)),
            title: Text('Help and Dispute'),
            onTap: (){
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => HelperClass(title: 'Help and Dispute',details: 'Details of disputed appear here')),
              );
            },
          ),
          Divider(),
          ListTile(
            leading: CircleAvatar(radius:20,backgroundColor: Colors.tealAccent,child: Icon(Icons.help,color:Colors.green,size: 25)),
            title: Text('FAQS'),
            onTap: (){
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => HelperClass(title: 'FAQs and Responses',details: 'Details of FAQs and Responses')),
              );
            },
          ),
          Divider(),
          ListTile(
            leading: CircleAvatar(radius:20,backgroundColor: Colors.tealAccent,child: Icon(Icons.exit_to_app,color:Colors.green,size: 25)),
            title: Text('Logout'),
            onTap: (){
              // Navigator.of(context).pushReplacementNamed('/');
              FirebaseAuth.instance.signOut();
              // Navigator.of(context).pop();
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => WelcomeScreen()),
              );
            },
          ),
        ],
      ),
    );
  }
}
