import 'package:flutter/material.dart';

class ProductDetail extends StatefulWidget {
  ProductDetail(this.product);
  @required final String product;
  @override
  _ProductDetailState createState() => _ProductDetailState();
}

class _ProductDetailState extends State<ProductDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF07db63),
        title: Text('Product Details'),
        centerTitle: true,
      ),
      body: Center(
        child: Container(
          child: Text(this.widget.product+' Detail'),
        ),
      ),
    );
  }
}
