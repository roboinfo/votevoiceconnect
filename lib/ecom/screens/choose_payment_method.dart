import 'dart:async';
import 'dart:convert';

import 'package:votevoiceconnect/ecom/models/order.dart';
import 'package:votevoiceconnect/ecom/models/payment.dart';
import 'package:votevoiceconnect/ecom/models/product.dart';
import 'package:votevoiceconnect/ecom/screens/home_screen.dart';
import 'package:votevoiceconnect/ecom/screens/payment_screen.dart';
import 'package:votevoiceconnect/ecom/services/cart_service.dart';
import 'package:votevoiceconnect/ecom/services/payment_service.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
class ChoosePaymentOption extends StatefulWidget {
  final List<Product> cartItems;
  ChoosePaymentOption({required this.cartItems});
  @override
  _ChoosePaymentOptionState createState() => _ChoosePaymentOptionState();
}

class _ChoosePaymentOptionState extends State<ChoosePaymentOption> {
  var _selectedPaymentOption = 'Card';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Checkout'),
        backgroundColor: Colors.redAccent,
        leading: Text(''),
        elevation: 0.0,
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.close,
              color: Colors.white,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ],
      ),

      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.only(
                left: 28.0, top: 28.0, right: 28.0, bottom: 14.0),
            child: Text('Choose a payment option',
                style:
                TextStyle(fontSize: 28.0, fontWeight: FontWeight.bold)),
          ),
          Divider(height: 5, color: Colors.black,),
          Padding(
            padding: const EdgeInsets.only(
                left: 15.0, top: 10.0, right: 15.0, bottom: 10.0),
            child: Card(child: RadioListTile(title: Text('Credit / Debit Card'), value: 'Card',
                groupValue: _selectedPaymentOption,
                onChanged: (param){
                  setState(() {
                    _selectedPaymentOption = param!;
                  });
                }),),
          ),

          Padding(
            padding: const EdgeInsets.only(
                left: 15.0, top: 10.0, right: 15.0, bottom: 10.0),
            child: Card(child: RadioListTile(title: Text('Cash on Delivery'), value: 'Cash on Delivery',
                groupValue: _selectedPaymentOption,
                onChanged: (param){
                  setState(() {
                    _selectedPaymentOption = param!;
                  });
                }),),
          ),

          ButtonTheme(
            minWidth: 320.0,
            height: 45.0,
            child: ElevatedButton(

              onPressed: () async {
                if(_selectedPaymentOption == 'Card'){
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => PaymentScreen(
                        paymentType: _selectedPaymentOption,
                        cartItems: this.widget.cartItems,
                      ),
                    ),
                  );
                } else {
                  SharedPreferences _prefs =
                  await SharedPreferences.getInstance();
                  var payment = Payment();
                  payment.userId = _prefs.getInt('userId')!;
                  payment.cartItems = this.widget.cartItems;
                  payment.order = Order();
                  payment.order!.paymentType = _selectedPaymentOption;
                  _makePayment(context, payment);
                }
              },
              child: Text('Continue', style: TextStyle(color: Colors.white)),
            ),
          ),
        ],
      ),
    );
  }

  void _makePayment(BuildContext context, Payment payment) async {
    PaymentService _paymentService = PaymentService();
    var paymentData = await _paymentService.makePayment(payment);
    var result = json.decode(paymentData.body);
    if (result['result'] == true) {
      CartService _cartService = CartService();
      this.widget.cartItems.forEach((cartItem){
        _cartService.deleteCartItemById(cartItem.id!
        );
      });
      _showPaymentSuccessMessage(context);
      Timer(Duration(seconds: 2), () {
        Navigator.pop(context);
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => ecom()));
      });
    }
  }

  _showPaymentSuccessMessage(BuildContext context) {
    return showDialog(
        context: context,
        barrierDismissible: true,
        builder: (context) {
          return AlertDialog(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(10.0))),
            content: Container(
              height: 360,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Image.asset('assets/success.png'),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'Order & Payment is successfully done!',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 24.0),
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }
}