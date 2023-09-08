import 'package:votevoiceconnect/ecom/models/product.dart';

class Order {
  int? id;
  String? paymentType;
  int? quantity;
  double? amount;
  int? productId;
  Product product = Product();
}