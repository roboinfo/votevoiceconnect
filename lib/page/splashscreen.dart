import 'dart:async';
import 'package:flutter/material.dart';
import 'package:votevoiceconnect/page/loginscreen.dart';

import '../ecom/screens/login_screen.dart';


class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    super.initState();

    Timer(
        const Duration(seconds: 3),
            () =>
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => LoginScreen1(cartItems: [],)),
            ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Center(
        child: Column(
          children: <Widget>[
            const Padding(padding: EdgeInsets.all(100)),
            Center(
              child: SizedBox(
                height: 200,
                child: Image.asset("assets/logo.png", width: 200,
                  height: 150,
                  fit: BoxFit.cover,),
              ),
            ),
            const SizedBox(height: 20,),
            const Text('My Constituency',
              style: TextStyle(
              fontWeight: FontWeight.bold,fontSize: 20
            ),)


          ],
        ),
      ),


    );
  }
}