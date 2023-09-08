import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:get/get.dart';
import 'package:votevoiceconnect/ecom/delegates/product_search.dart';
import 'package:votevoiceconnect/ecom/helpers/side_drawer_navigation.dart';
import 'package:votevoiceconnect/ecom/models/category.dart';
import 'package:votevoiceconnect/ecom/models/product.dart';
import 'package:votevoiceconnect/ecom/screens/cart_screen.dart';
import 'package:votevoiceconnect/ecom/services/cart_service.dart';
import 'package:votevoiceconnect/ecom/services/category_service.dart';
import 'package:votevoiceconnect/ecom/services/product_service.dart';
import 'package:votevoiceconnect/ecom/services/slider_service.dart';
import 'package:votevoiceconnect/ecom/widgets/carousel_slider.dart';
import 'package:votevoiceconnect/ecom/widgets/home_hot_products.dart';
import 'package:votevoiceconnect/ecom/widgets/home_new_arrival_products.dart';
import 'package:votevoiceconnect/ecom/widgets/home_product_categories.dart';
import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;

import '../../page/home2.dart';

class ecom extends StatefulWidget {
  const ecom({super.key});

  @override
  _ecomState createState() => _ecomState();
}

class _ecomState extends State<ecom> {

  CategoryService _categoryService = CategoryService();
  ProductService _productService = ProductService();

  List<Category> _categoryList = <Category>[];
  List<Product> _productList = <Product>[];
  List<Product> _allProductList = <Product>[];
  List<Product> _newArrivalproductList = <Product>[];

  CartService _cartService = CartService();
  late List<Product> _cartItems;

  @override
  void initState() {
    super.initState();

    _getAllCategories();
    _getAllHotProducts();
    _getAllNewArrivalProducts();
    _getCartItems();
    _getAllProducts();

  }

  _getCartItems() async {
    _cartItems = <Product>[];
    var cartItems = await _cartService.getCartItems();
    cartItems.forEach((data) {
      var product = Product();
      product.id = data['productId'];
      product.name = data['productName'];
      product.photo = data['productPhoto'];
      product.price = data['productPrice'];
      product.discount = data['productDiscount'];
      product.productDetail = data['productDetail'] ?? 'No detail';
      product.quantity = data['productQuantity'];

      setState(() {
        _cartItems.add(product);
      });
    });
  }


  _getAllCategories() async {
    var categories = await _categoryService.getCategories();
    var result = json.decode(categories.body);
    result['data'].forEach((data) {
      var model = Category();
      model.id = data['id'];
      model.name = data['name'];
      model.icon = data['icon'];
      setState(() {
        _categoryList.add(model);
      });
    });
  }

  _getAllProducts() async {
    var products = await _productService.getAllProducts();
    var result = json.decode(products.body);
    result['data'].forEach((data) {
      var model = Product();
      model.id = data['id'];
      model.name = data['name'];
      model.photo = data['photo'];
      model.price = data['price'];
      model.discount = data['discount'];
      model.productDetail = data['detail'];

      setState(() {
        _allProductList.add(model);
      });
    });
  }

  _getAllHotProducts() async {
    var hotProducts = await _productService.getHotProducts();
    var result = json.decode(hotProducts.body);
    result['data'].forEach((data) {
      var model = Product();
      model.id = data['id'];
      model.name = data['name'];
      model.photo = data['photo'];
      model.price = data['price'];
      model.discount = data['discount'];
      model.productDetail = data['detail'];

      setState(() {
        _productList.add(model);
      });
    });
  }

  _getAllNewArrivalProducts() async {
    var newArrivalProducts = await _productService.getNewArrivalProducts();
    var result = json.decode(newArrivalProducts.body);
    result['data'].forEach((data) {
      var model = Product();
      model.id = data['id'];
      model.name = data['name'];
      model.photo = data['photo'];
      model.price = data['price'];
      model.discount = data['discount'];
      model.productDetail = data['detail'];

      setState(() {
        _newArrivalproductList.add(model);
      });
    });
  }





  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(0, 0, 0, 0.10),
      //drawer: SideDrawerNavigation(),
      appBar: AppBar(
        title: Text('Shopping'.tr),
        backgroundColor: Color.fromARGB(255, 90, 90, 90),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop();
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => home2()),
            );
          },
        ),
        actions: <Widget>[
          IconButton(icon: const Icon(Icons.search), onPressed: (){
            showSearch(context: context, delegate: ProductSearch(products: _allProductList));
          }),
          InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => CartScreen(_cartItems),
                ),
              );
            },
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: SizedBox(
                height: 150,
                width: 30,
                child: Stack(
                  children: <Widget>[
                    IconButton(
                      iconSize: 30,
                      icon: const Icon(
                        Icons.shopping_cart,
                        color: Colors.white,
                      ),
                      onPressed: () {},
                    ),
                    Positioned(
                      child: Stack(
                        children: <Widget>[
                          const Icon(Icons.brightness_1,
                              size: 25, color: Colors.black),
                          Positioned(
                            top: 4.0,
                            right: 8.0,
                            child: Center(
                                child: Text(_cartItems.length.toString())),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
      body: Container(
          child: ListView(
            children: <Widget>[
//************************************************************************
              carouselSlider(),
//************************************************************************
              Container(
                decoration: BoxDecoration(
                  //borderRadius: BorderRadius.circular(20.0),
                  //color: Color.fromRGBO(0, 0, 0, 0.10),
                  color: Colors.white,
                ),
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Icon(
                            Icons.amp_stories_outlined,
                            color: Colors.deepPurple,
                            size: 22.0,
                          ),
                          Text(
                            '  Product Categories'.tr,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: Colors.black45,
                                fontWeight: FontWeight.bold,
                                fontSize: 18.0),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 5,
              ),




              HomeProductCategories(
                categoryList: _categoryList,
              ),

              Container(
                decoration: BoxDecoration(
                  //borderRadius: BorderRadius.circular(20.0),
                  //color: Color.fromRGBO(0, 0, 0, 0.10),
                  color: Colors.white,
                ),
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Icon(
                            Icons.amp_stories_outlined,
                            color: Colors.deepPurple,
                            size: 22.0,
                          ),
                          Text(
                            '  Hot Products'.tr,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: Colors.black45,
                                fontWeight: FontWeight.bold,
                                fontSize: 18.0),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 5,
              ),

              HomeHotProducts(
                productList: _productList,
              ),
              Container(
                decoration: BoxDecoration(
                  //borderRadius: BorderRadius.circular(20.0),
                  //color: Color.fromRGBO(0, 0, 0, 0.10),
                  color: Colors.white,
                ),
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Icon(
                            Icons.amp_stories_outlined,
                            color: Colors.deepPurple,
                            size: 22.0,
                          ),
                          Text(
                            '  New Arrival Products'.tr,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: Colors.black45,
                                fontWeight: FontWeight.bold,
                                fontSize: 18.0),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              HomeNewArrivalProducts(
                productList: _newArrivalproductList,
              )
            ],
          )),
    );
  }
}
