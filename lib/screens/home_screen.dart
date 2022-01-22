import 'package:flutter/material.dart';
import 'package:marhabastores/screens/Categories.dart';
import 'package:marhabastores/screens/notifications.dart';
import 'package:marhabastores/screens/profile.dart';
import 'package:marhabastores/screens/search_screen.dart';
import 'package:marhabastores/screens/stores.dart';
import 'package:marhabastores/widgets/store_drawer.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin{

  TabController _controller;
  int _selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    _controller = TabController(length: 3, vsync: this);
    _controller.addListener(() {
      setState(() {
        _selectedIndex = _controller.index;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF07db63),
        elevation: 0,
        title: Text('Marhaba Stores'),
        actions: [
          Padding(
              padding: EdgeInsets.only(right: 20.0),
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SearchBar()),
                  );
                },
                child: Icon(
                  Icons.search,
                  size: 26.0,
                ),
              )
          ),
          Padding(
              padding: EdgeInsets.only(right: 20.0),
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Notifications()),
                  );
                },
                child: Icon(
                    Icons.notifications_none_outlined
                ),
              )
          ),
        ],
        bottom: TabBar(
          onTap: (index) {

          },
          controller: _controller,
          tabs: [
            Tab(icon: Icon(Icons.storefront_sharp,color: Colors.white),text: 'Categories'),
            Tab(icon: Icon(Icons.local_grocery_store_rounded,color: Colors.white),text: 'Stores'),
            Tab(icon: Icon(Icons.account_circle_outlined,color: Colors.white),text: 'Profile'),
          ],
        ),
      ),
      drawer: StoreDrawer(),
      body: TabBarView(
        controller: _controller,
        children: [
          Categories(),
          Stores(),
          Profile()
        ],
      ),
    );
  }
}
