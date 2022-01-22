import 'package:flutter/material.dart';

class SearchBar extends StatefulWidget {
  @override
  _SearchBarState createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF07db63),
        elevation: 0,
          title: Container(
            width: double.infinity,
            decoration: BoxDecoration(
                color: Color(0xFF07db63), borderRadius: BorderRadius.circular(5)),
            child: Center(
              child: TextField(
                style: TextStyle(color: Colors.white,fontSize: 24),
                decoration: InputDecoration(
                    fillColor: Colors.white,
                    focusColor: Colors.white,
                    hintStyle: TextStyle(color: Colors.white,fontSize: 24,fontWeight: FontWeight.bold),
                    prefixIcon: Icon(Icons.search,color: Colors.white),
                    suffixIcon: IconButton(
                      icon: Icon(Icons.clear,color: Colors.white),
                      onPressed: () {

                      },
                    ),
                    hintText: 'Search',
                    border: InputBorder.none),
              ),
            ),
          ),
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('No Search Result Found!',style: TextStyle(color: Colors.black38,fontSize: 24,fontWeight: FontWeight.w700)),
            SizedBox(height: 20),
            Image.asset('assets/upload_image.png'),
          ],
        ),
      ),
    );
  }
}
