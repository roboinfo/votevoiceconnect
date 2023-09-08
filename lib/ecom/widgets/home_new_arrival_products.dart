import 'package:votevoiceconnect/ecom/models/product.dart';
import 'package:votevoiceconnect/ecom/widgets/home_new_arrival_product.dart';
import 'package:flutter/material.dart';

class HomeNewArrivalProducts extends StatefulWidget {
  final List<Product> productList;
  HomeNewArrivalProducts({required this.productList});
  @override
  _HomeNewArrivalProductsState createState() => _HomeNewArrivalProductsState();
}

class _HomeNewArrivalProductsState extends State<HomeNewArrivalProducts> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 205,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: this.widget.productList.length,
        itemBuilder: (context, index){
          return 
          HomeNewArrivalProduct(this.widget.productList[index]);
        },
      ),
    );
  }
}