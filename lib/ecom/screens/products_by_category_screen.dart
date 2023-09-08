import 'dart:convert';

import 'package:votevoiceconnect/ecom/models/product.dart';
import 'package:votevoiceconnect/ecom/services/product_service.dart';
import 'package:votevoiceconnect/ecom/widgets/product_by_category.dart';
import 'package:flutter/material.dart';

class ProductsByCategoryScreen extends StatefulWidget {
  final String categoryName;
  final int categoryId;
  ProductsByCategoryScreen({required this.categoryName, required this.categoryId});
  @override
  _ProductsByCategoryScreenState createState() => _ProductsByCategoryScreenState();
}

class _ProductsByCategoryScreenState extends State<ProductsByCategoryScreen> {

  ProductService _productService = ProductService();

  List<Product> _productListByCategory = <Product>[];

  _getProductsByCategory() async {
    var products = await _productService.getProductsByCategoryId(this.widget.categoryId);
    var _list = json.decode(products.body);
    _list['data'].forEach((data){
      var model = Product();
      model.id = data['id'];
      model.name = data['name'];
      model.photo = data['photo'];
      model.price = data['price'];
      model.discount = data['discount'];
      model.productDetail = data['detail'];

      setState(() {
        _productListByCategory.add(model);
      });
    });
  }

  @override
  void initState() {
    super.initState();
    _getProductsByCategory();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 90, 90, 90),
        title: Text(this.widget.categoryName),
      ),

      body: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 1),
        itemCount: _productListByCategory.length,
        itemBuilder: (context, index){

          return ProductByCategory(this._productListByCategory[index]);

        },
      ),
    );
  }
}