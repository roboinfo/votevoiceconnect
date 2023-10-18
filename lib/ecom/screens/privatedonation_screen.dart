import 'dart:convert';

import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:votevoiceconnect/ecom/models/product.dart';
import 'package:votevoiceconnect/ecom/models/upicategory.dart';
import 'package:votevoiceconnect/ecom/screens/choose_payment_method.dart';
import 'package:votevoiceconnect/ecom/services/privatedonation_service.dart';
import 'package:votevoiceconnect/ecom/services/upicategory_service.dart';
import 'package:flutter/material.dart';
import 'package:votevoiceconnect/ecom/models/privatedonation.dart';
import 'package:http/http.dart' as http;

class PrivateDonationScreen extends StatefulWidget {


  const PrivateDonationScreen({super.key,});

  @override
  State<PrivateDonationScreen> createState() => _PrivateDonationScreenState();
}

class _PrivateDonationScreenState extends State<PrivateDonationScreen> {
  Map<String, dynamic>? paymentIntent;

  final amount = TextEditingController();

  final cause = TextEditingController();

  final referral = TextEditingController();

  //*****************************
  clearText() {
    amount.clear();
    cause.clear();
    referral.clear();

  }
  //******************************
  UpiCategory? _selectedCategory;

  UpiCategoryService _upicategoryService = UpiCategoryService();
  final List<UpiCategory> _upicategoryList = [];

  _getAllUpiCategories() async {
    var upiCategories = await _upicategoryService.getUpiCategories();
    var result = json.decode(upiCategories.body);
    result['data'].forEach((data) {
      var model = UpiCategory();
      model.id = data['id'];
      model.name = data['upiName'];
      print(_upicategoryList);
      setState(() {
        _upicategoryList.add(model);
      });
    });
  }

  @override
  void initState() {
    super.initState();
    _getAllUpiCategories();
  }

  _showSnackMessage(message) {
    var snackBar = SnackBar(
      content: message,
    );
    //_scaffoldKey.currentState!.showSnackBar(_snackBar);
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(0, 0, 0, 0.10),
      appBar: AppBar(
        title: const Text('Private Donation',style: TextStyle(color: Colors.black)),
        iconTheme: IconThemeData(color: Colors.black),
        backgroundColor: Colors.white,


      ),
      body: SafeArea(
        child: ListView(
          children: <Widget>[
            const SizedBox(
              height: 5,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 0.0),
              child: Container(
                padding: const EdgeInsets.only(top: 5.0, bottom: 5.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(0.0),
                  //color: Color.fromRGBO(0, 0, 0, 0.10),
                  color: Colors.white,
                ),
                child: Image.asset(
                  "assets/donation.png",
                  // height: 250,
                  width: double.infinity,
                ),
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            Container(
              decoration: BoxDecoration(
                //borderRadius: BorderRadius.circular(20.0),
                //color: Color.fromRGBO(0, 0, 0, 0.10),
                color: Colors.white,
              ),
              child: Padding(
                padding: const EdgeInsets.all(5.0),
                child: Row(
                  children: [
                    Icon(
                      Icons.person_add_alt_1,
                      color: Colors.deepPurple,
                      size: 30.0,
                    ),
                    Text(
                      '               Enter Details',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.black45,
                          fontWeight: FontWeight.bold,
                          fontSize: 22.0),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            Row(
              children: <Widget>[
                Flexible(
                  flex: 1,
                  fit: FlexFit.tight,
                  child: Container(
                      //alignment: Alignment.center,
                      padding: const EdgeInsets.only(top: 10.0, left: 20.0),
                      child: const Text(
                        'Enter An Amount *',
                        style: TextStyle(
                            color: Colors.black38,
                            fontWeight: FontWeight.bold,
                            fontSize: 15.0),
                      )),
                ),
              ],
            ),
            const SizedBox(
              height: 5,
            ),
            Row(
              children: <Widget>[
                Flexible(
                  flex: 1,
                  fit: FlexFit.tight,
                  child: Container(
                    padding: const EdgeInsets.only(
                        top: 0.0, left: 10.0, right: 10.0),
                    child: TextFormField(
                      autofocus: false,
                      decoration: InputDecoration(
                        filled: true,
                        //<-- SEE HERE
                        //fillColor: Color.fromRGBO(0, 0, 0, 0.10),
                        fillColor: Colors.white,

                        hintText: 'Enter Amount Here',
                        labelStyle: TextStyle(fontSize: 20.0),

                        errorStyle:
                            TextStyle(color: Colors.redAccent, fontSize: 15),
                      ),
                      controller: amount,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please Enter Valid Amount';
                        }
                        return null;
                      },
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 5,
            ),
            Row(
              children: <Widget>[
                Flexible(
                  flex: 1,
                  fit: FlexFit.tight,
                  child: Container(
                      //alignment: Alignment.center,
                      padding: const EdgeInsets.only(top: 0.0, left: 20.0),
                      child: const Text(
                        'Cause for Donation',
                        style: TextStyle(
                            color: Colors.black38,
                            fontWeight: FontWeight.bold,
                            fontSize: 15.0),
                      )),
                ),
              ],
            ),
            const SizedBox(
              height: 5,
            ),
            Row(
              children: <Widget>[
                Flexible(
                  flex: 1,
                  fit: FlexFit.tight,
                  child: Container(
                    padding: const EdgeInsets.only(
                        top: 0.0, left: 10.0, right: 10.0),
                    child: TextFormField(
                      autofocus: false,
                      decoration: InputDecoration(
                        filled: true,
                        //<-- SEE HERE
                        //fillColor: Color.fromRGBO(0, 0, 0, 0.10),
                        fillColor: Colors.white,

                        hintText: 'Party Fund ▼',
                        labelStyle: TextStyle(fontSize: 20.0),

                        errorStyle:
                            TextStyle(color: Colors.redAccent, fontSize: 15),
                      ),
                      controller: cause,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please Enter Cause';
                        }
                        return null;
                      },
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 5,
            ),
            Row(
              children: <Widget>[
                Flexible(
                  flex: 1,
                  fit: FlexFit.tight,
                  child: Container(
                      //alignment: Alignment.center,
                      padding: const EdgeInsets.only(top: 0.0, left: 20.0),
                      child: const Text(
                        'Select Platform *',
                        style: TextStyle(
                            color: Colors.black38,
                            fontWeight: FontWeight.bold,
                            fontSize: 15.0),
                      )),
                ),
              ],
            ),
            const SizedBox(
              height: 5,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Flexible(
                  flex: 1,
                  fit: FlexFit.tight,
                  child: Padding(
                    padding: const EdgeInsets.only(
                        top: 0.0, left: 10.0, right: 10.0),
                    child: Container(
                      //color: Color.fromRGBO(0, 0, 0, 0.10),
                      color: Colors.white,

                      child: Container(
                        decoration: BoxDecoration(
                          // borderRadius: BorderRadius.circular(15.0),
                          border: Border.all(
                              color: Colors.black54,
                              style: BorderStyle.solid,
                              width: 0.80),
                        ),
                        child: DropdownButton<UpiCategory>(
                          hint: Text('Select Upi Type'),
                          value: _selectedCategory,
                          // The currently selected category
                          items: _upicategoryList.map((category) {
                            return DropdownMenuItem<UpiCategory>(
                              value: category,
                              child: Text(category.name ?? ''),
                            );
                          }).toList(),
                          onChanged: (value) {
                            setState(() {
                              _selectedCategory =
                                  value; // Set the selected category
                            });
                          },
                          selectedItemBuilder: (BuildContext context) {
                            return _upicategoryList.map<Widget>((category) {
                              return Text(category.name ?? '');
                            }).toList();
                          },
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 5,
            ),
            Row(
              children: <Widget>[
                Flexible(
                  flex: 1,
                  fit: FlexFit.tight,
                  child: Container(
                    //alignment: Alignment.center,
                      padding:
                      const EdgeInsets.only(top: 0.0, left: 20.0),
                      child: const Text(
                        'Referral Code *',
                        style: TextStyle(
                            color: Colors.black38,
                            fontWeight: FontWeight.bold,
                            fontSize: 15.0),
                      )),
                ),
              ],
            ),

            const SizedBox(
              height: 5,
            ),

            Row(
              children: <Widget>[
                Flexible(
                  flex: 1,
                  fit: FlexFit.tight,
                  child: Container(
                    padding: const EdgeInsets.only(
                        top: 0.0, left: 10.0, right: 10.0),
                    child: TextFormField(
                      autofocus: false,
                      decoration: InputDecoration(
                        filled: true,
                        //<-- SEE HERE
                        //fillColor: Color.fromRGBO(0, 0, 0, 0.10),
                        fillColor: Colors.white,

                        hintText: 'Enter Referral Code. ex.ABC123*F',
                        labelStyle: TextStyle(fontSize: 20.0),

                        errorStyle: TextStyle(
                            color: Colors.redAccent, fontSize: 15),
                      ),
                      controller: referral,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please Enter ReferralCode';
                        }
                        return null;
                      },
                    ),
                  ),
                ),
              ],
            ),

            const SizedBox(
              height: 15,
            ),
            Row(
              children: <Widget>[
                Flexible(
                  flex: 1,
                  fit: FlexFit.tight,
                  child: Container(
                      alignment: Alignment.center,
                      padding: const EdgeInsets.only(
                          top: 0.0, left: 20.0, right: 20.0),
                      child: const Text(
                        'I declare that I am an Indian Citizen and I am making this contribution '
                            'to **** Party out of my free will, from income legally earned/owned by me.'
                            'This details that I have provided above are true and nothing has been misrepresented.',
                        style: TextStyle(
                            color: Colors.black38,
                            fontWeight: FontWeight.bold,
                            fontSize: 10.0),
                      )),
                ),
              ],
            ),
            const SizedBox(
              height: 5,
            ),

            Row(
              children: <Widget>[
                Flexible(
                  flex: 1,
                  fit: FlexFit.tight,
                  child: Container(
                    alignment: Alignment.center,
                    padding: const EdgeInsets.only(
                        top: 0.0, left: 50.0, right: 50.0),
                    child: ElevatedButton(
                      onPressed: () async{
                        var privatedonation = PrivateDonation();

                        privatedonation.amount = amount.text;
                        privatedonation.cause = cause.text;
                        privatedonation.upicategory =
                            _selectedCategory?.name ?? '';
                        privatedonation.referral = referral.text;
                        _privatedonation(context, privatedonation);

                        await makePayment();

                        clearText();

                        // showDialog(
                        //   context: context,
                        //   builder: (BuildContext context) {
                        //     return AlertDialog(
                        //       scrollable: true,
                        //       backgroundColor: Colors.blueGrey,
                        //       title: const Text(
                        //         "Payment Done Successfully ",
                        //         textAlign: TextAlign.center,
                        //         style: TextStyle(
                        //             color: Colors.white,
                        //             fontWeight: FontWeight.bold,
                        //             fontSize: 22.0),
                        //       ),
                        //     );
                        //   },
                        // );
                      },
                      style: ElevatedButton.styleFrom(
                        primary: Color.fromRGBO(0, 0, 0, 0.03),
                        onPrimary: Colors.lightBlueAccent,
                        padding: EdgeInsets.symmetric(
                            horizontal: 20, vertical: 10),
                        textStyle: TextStyle(
                            fontSize: 30, fontWeight: FontWeight.bold),
                      ),
                      child: const Text('AGREE & PROCEED',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Colors.black45,
                              fontWeight: FontWeight.bold,
                              fontSize: 19.0)),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 5,
            ),

            Row(
              children: <Widget>[
                Flexible(
                  flex: 1,
                  fit: FlexFit.tight,
                  child: Container(
                      alignment: Alignment.center,
                      padding: const EdgeInsets.only(top: 0.0),
                      child: const Text(
                        'Manage Donation',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.black38,
                            fontWeight: FontWeight.bold,
                            fontSize: 17.0),
                      )),
                ),
              ],
            ),
            const SizedBox(
              height: 5,
            ),
          ],
        ),
      ),
    );
  }

  void _privatedonation(context, PrivateDonation privatedonation) async {
    var privatedonationService = PrivateDonationService();
    var privatedonationData =
        await privatedonationService.addPrivateDonation(privatedonation);
    var result = await json.decode(privatedonationData.body);

    if (result['result'] == true) {

    } else {
      _showSnackMessage(const Text(
        'Failed to add shipping',
        style: TextStyle(color: Colors.red),
      ));
    }
  }

  Future<void> makePayment() async {
    try {
      paymentIntent = await createPaymentIntent(amount.text, 'INR', );
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
