import 'package:votevoiceconnect/ecom/models/product.dart';
import 'package:votevoiceconnect/ecom/screens/product_detail.dart';
import 'package:flutter/material.dart';

class ProductSearch extends SearchDelegate<String> {

  final List<Product> products;
  ProductSearch({required this.products});

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(icon: Icon(Icons.close), onPressed: (){
        query = "";
      })
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(icon: Icon(Icons.arrow_back), onPressed: (){
      Navigator.pop(context);
    });
  }

  @override
  Widget buildResults(BuildContext context) {
    // TODO: implement buildResults
    throw UnimplementedError();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final productSearchList = query.isEmpty ? products : products.where((product){
      return product.name!.toLowerCase().startsWith(query.toLowerCase());
    }).toList();
    return ListView.builder(
        itemCount: productSearchList.length,
        itemBuilder: (context, index){
          return ListTile(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => ProductDetailScreen(productSearchList[index])));
            },
            leading: Image.network(productSearchList[index].photo!),
            title: Text(productSearchList[index].name!),
          );
        });
  }

}