import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:marhabastores/items-management/add_item.dart';
import 'package:marhabastores/screens/product_detail.dart';

class Categories extends StatefulWidget {
  @override
  _CategoriesState createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
  List<IconData> iconTypes = [
    Icons.home,
    Icons.local_grocery_store_sharp,
    Icons.liquor,
    Icons.no_food,
    Icons.emoji_food_beverage,
    Icons.local_pharmacy_outlined,
    Icons.icecream,
    Icons.food_bank_outlined,
    Icons.no_meals_outlined,
    Icons.set_meal_outlined,
    Icons.house_siding_sharp,
    Icons.food_bank,
    Icons.local_convenience_store,
    Icons.toys,
    Icons.local_pharmacy,
    Icons.sports,
    Icons.watch
  ];

  List<String> itemType = ['Household','Grocery','Liquor','Chilled','Beverages','Pharmacy','Frozen Food','Vegetables','Meat','Fish','Homeware','Fruits','Clothes','Toys','Health and Beauty','Sports and Outdoor','Fashion'];

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top:30),
      child: GridView.count(
          crossAxisCount: 3,
          crossAxisSpacing: 3,
          mainAxisSpacing: 5,
          children: List.generate(17,(index){
            return GestureDetector(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  CircleAvatar(radius:30,backgroundColor: Colors.green[100],child: Icon(iconTypes[index],color:Colors.green,size: 30)),
                  Text(itemType[index])
                ],
              ),
              onTap: (){
                FirebaseFirestore.instance.collection('items').add(
                    {
                      'category':itemType[index]
                    }
                );
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AddItem(itemData: itemType[index],icondata: iconTypes[index],)),
                );
              },
            );
          })),
    );
  }
}