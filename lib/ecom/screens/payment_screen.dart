import 'dart:async';
import 'dart:convert';

import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:votevoiceconnect/ecom/models/order.dart';
import 'package:votevoiceconnect/ecom/models/payment.dart';
import 'package:votevoiceconnect/ecom/models/product.dart';
import 'package:votevoiceconnect/ecom/screens/home_screen.dart';
import 'package:votevoiceconnect/ecom/services/cart_service.dart';
import 'package:votevoiceconnect/ecom/services/payment_service.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:http/http.dart' as http;

class PaymentScreen extends StatefulWidget {


  final String paymentType;
  final List<Product> cartItems;
  PaymentScreen({required this.paymentType, required this.cartItems});

  @override
  _PaymentScreenState createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {

  double _total= 0;

  @override
  void initState() {
    super.initState();
    _getTotal();
  }

  _getTotal() {
    _total = 0.0;
    this.widget.cartItems.forEach((item) {
      setState(() {
        _total += (item.price! - item.discount!) * item.quantity;
      });
    });
  }

  // Stripe Pay
  Map<String, dynamic>? paymentIntent;

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  final _cardHolderName = TextEditingController();
  final _cardHolderEmail = TextEditingController();
  final _cardNumber = TextEditingController();
  final _expiryMonth = TextEditingController();
  final _expiryYear = TextEditingController();
  final _cvcNumber = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Make payment'),
        backgroundColor: Color.fromARGB(255, 90, 90, 90),
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
      body: Padding(
        padding: const EdgeInsets.only(top: 0.0),
        child: ListView(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(
                  left: 28.0, top: 28.0, right: 28.0, bottom: 14.0),
              child: Text('Make payment',
                  style:
                  TextStyle(fontSize: 28.0, fontWeight: FontWeight.bold)),
            ),
            Divider(
              height: 5.0,
              color: Colors.black,
            ),
            Padding(
              padding: const EdgeInsets.only(
                  left: 28.0, top: 14.0, right: 28.0, bottom: 14.0),
              child: TextField(
                keyboardType: TextInputType.emailAddress,
                controller: _cardHolderEmail,
                decoration: InputDecoration(hintText: 'Email'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  left: 28.0, top: 14.0, right: 28.0, bottom: 14.0),
              child: TextField(
                controller: _cardHolderName,
                decoration: InputDecoration(hintText: 'Name'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  left: 28.0, top: 14.0, right: 28.0, bottom: 14.0),
              child: TextField(
                controller: _cardNumber,
                decoration: InputDecoration(
                  hintText: 'Card Number',
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  left: 28.0, top: 14.0, right: 28.0, bottom: 14.0),
              child: TextField(
                controller: _expiryMonth,
                decoration: InputDecoration(
                  hintText: 'Expiry Month',
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  left: 28.0, top: 14.0, right: 28.0, bottom: 14.0),
              child: TextField(
                controller: _expiryYear,
                decoration: InputDecoration(
                  hintText: 'Expiry Year',
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  left: 28.0, top: 14.0, right: 28.0, bottom: 14.0),
              child: TextField(
                controller: _cvcNumber,
                obscureText: true,
                decoration: InputDecoration(
                  hintText: 'CVC',
                ),
              ),
            ),
            Column(
              children: <Widget>[
                ButtonTheme(
                  minWidth: 320.0,
                  height: 45.0,
                  child: ElevatedButton(

                    onPressed: () async {
                      SharedPreferences _prefs =
                      await SharedPreferences.getInstance();
                      var payment = Payment();
                      payment.userId = _prefs.getInt('userId')!;
                      payment.name = _cardHolderName.text;
                      payment.email = _cardHolderEmail.text;
                      payment.cardNumber = _cardNumber.text;
                      payment.expiryMonth = _expiryMonth.text;
                      payment.expiryYear = _expiryYear.text;
                      payment.cvcNumber = _cvcNumber.text;
                      payment.cartItems = this.widget.cartItems;
                      payment.order = Order();
                      payment.order!.paymentType = this.widget.paymentType;
                      _makePayment(context, payment);

                      await makePayment();
                    },
                    child: Text('Make Payment',
                        style: TextStyle(color: Colors.white)),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

//   @Mladen, Please do this in PaymentController

// catch (\Exception $exception){
//          return response(['result' => $exception->getMessage()]);
// }

// And do this in PaymentScreen



  void _makePayment(BuildContext context, Payment payment) async {
    PaymentService _paymentService = PaymentService();
    var paymentData = await _paymentService.makePayment(payment);
    var result = json.decode(paymentData.body);
    if (result['result'] == true) {
      CartService _cartService = CartService();
      this.widget.cartItems.forEach((cartItem){
        _cartService.deleteCartItemById(cartItem.id!);
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

  Future<void> makePayment() async {
    try {
      paymentIntent = await createPaymentIntent(_total.toString(), 'INR', );
      //Payment Sheet
      await Stripe.instance.initPaymentSheet(
          paymentSheetParameters: SetupPaymentSheetParameters(
              paymentIntentClientSecret: paymentIntent!['client_secret'],
              // applePay: const PaymentSheetApplePay(merchantCountryCode: '+92',),
              googlePay: const PaymentSheetGooglePay(testEnv: true, currencyCode: "IN", merchantCountryCode: "+91"),
              style: ThemeMode.dark,
              merchantDisplayName: 'roboinfocom')).then((value){
      });


      ///now finally display payment sheeet
      displayPaymentSheet();
    } catch (e, s) {
      print('exception:$e$s');
    }
  }

  displayPaymentSheet() async {

    try {
      await Stripe.instance.presentPaymentSheet(
      ).then((value){
        showDialog(
            context: context,
            builder: (_) => AlertDialog(
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    children: const [
                      Icon(Icons.check_circle, color: Colors.green,),
                      Text("Payment Successfull"),
                    ],
                  ),
                ],
              ),
            ));
        // ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("paid successfully")));

        paymentIntent = null;

      }).onError((error, stackTrace){
        print('Error is:--->$error $stackTrace');
      });


    } on StripeException catch (e) {
      print('Error is:---> $e');
      showDialog(
          context: context,
          builder: (_) => const AlertDialog(
            content: Text("Cancelled "),
          ));
    } catch (e) {
      print('$e');
    }
  }

  //  Future<Map<String, dynamic>>
  createPaymentIntent(String amount, String currency) async {
    try {
      Map<String, dynamic> body = {
        'amount': calculateAmount(amount),
        'currency': currency,
        'payment_method_types[]': 'card'
      };

      var response = await http.post(
        Uri.parse('https://api.stripe.com/v1/payment_intents'),
        headers: {
          'Authorization': 'Bearer sk_test_51NSwBwSE81aNcIO7ItMBRXTbHgwiBkBg3MChMc6L19oZvTiUIBAnvZ27zcGWLlCjYPuK4HajWBD8LUXLBAeYy7G000JEc94THd',
          'Content-Type': 'application/x-www-form-urlencoded'
        },
        body: body,
      );
      // ignore: avoid_print
      print('Payment Intent Body->>> ${response.body.toString()}');
      return jsonDecode(response.body);
    } catch (err) {
      // ignore: avoid_print
      print('err charging user: ${err.toString()}');
    }
  }

  calculateAmount(String amount) {
    final calculatedAmout = (int.parse(amount)) * 100 ;
    return calculatedAmout.toString();
  }

}
