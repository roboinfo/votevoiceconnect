import 'dart:convert';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:votevoiceconnect/ecom/models/product.dart';
import 'package:votevoiceconnect/ecom/models/user.dart';
import 'package:votevoiceconnect/ecom/screens/forget_password.dart';
import 'package:votevoiceconnect/ecom/screens/home_screen.dart';
import 'package:votevoiceconnect/ecom/screens/registration_screen.dart';
import 'package:votevoiceconnect/ecom/services/user_service.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:votevoiceconnect/page/Admin/adminHome.dart';
import 'package:votevoiceconnect/page/home2.dart';
import 'package:http/http.dart' as http;
import 'package:votevoiceconnect/page/videos.dart';

import '../../page/utility/constants.dart';
import 'package:votevoiceconnect/ecom/screens/checkout_screen.dart';

class LoginScreen1 extends StatefulWidget {
  final List<Product> cartItems;
  LoginScreen1({required this.cartItems});
  @override
  _LoginScreen1State createState() => _LoginScreen1State();
}

class _LoginScreen1State extends State<LoginScreen1> {
  String deviceToken = "";
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();
  bool _rememberMe = false;

  final email = TextEditingController();
  final password = TextEditingController();

  @override
  void initState() {
    super.initState();
    _checkLoggedInStatus();
  }

  // _checkLoggedInStatus() async {
  //   SharedPreferences _prefs = await SharedPreferences.getInstance();
  //
  //   // Check if the user is logged in
  //   int userId = _prefs.getInt('userId') ?? 0;
  //   String userName = _prefs.getString('userName') ?? '';
  //   String userEmail = _prefs.getString('userEmail') ?? '';
  //
  //   if (userId != 0 && userName.isNotEmpty && userEmail.isNotEmpty) {
  //     // If the user is logged in, navigate to the home screen
  //     Navigator.pushReplacement(
  //       context,
  //       MaterialPageRoute(builder: (context) => home2()),
  //     );
  //   }
  // }

  // _checkLoggedInStatus() async {
  //   SharedPreferences _prefs = await SharedPreferences.getInstance();
  //
  //   // Check if the user is logged in
  //   int userId = _prefs.getInt('userId') ?? 0;
  //   String userName = _prefs.getString('userName') ?? '';
  //   String userEmail = _prefs.getString('userEmail') ?? '';
  //
  //   if (userId != 0 && userName.isNotEmpty && userEmail.isNotEmpty) {
  //     // If the user is logged in, navigate to the appropriate screen based on their role
  //     int userRole = _prefs.getInt('userRole') ?? 0;
  //
  //     if (userRole == 1) {
  //       // Admin user
  //       Navigator.pushReplacement(
  //         context,
  //         MaterialPageRoute(builder: (context) => AdminHome()),
  //       );
  //     } else if (userRole == 0) {
  //       // Regular user
  //       Navigator.pushReplacement(
  //         context,
  //         MaterialPageRoute(builder: (context) => home2()),
  //       );
  //     }
  //   }
  // }
  _checkLoggedInStatus() async {
    SharedPreferences _prefs = await SharedPreferences.getInstance();

    // Check if the user is logged in
    int? userId = _prefs.getInt('userId');
    String? userName = _prefs.getString('userName');
    String? userEmail = _prefs.getString('userEmail');
    int? userRole = _prefs.getInt('userRole');

    if (userId != null && userName != null && userEmail != null) {
      // If the user is logged in, navigate to the appropriate screen based on their role
      if (userRole == 1) {
        // Admin user
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => AdminHome()),
        );
      } else if (userRole == 0) {
        // Regular user
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => home2()),
        );
      }
    }
  }



  // _login(BuildContext context, User user) async {
  //   var _userService = UserService();
  //
  //   var registeredUser = await _userService.login(user);
  //   var result = json.decode(registeredUser.body);
  //
  //   if (result['result'] == true) {
  //     SharedPreferences _prefs = await SharedPreferences.getInstance();
  //
  //     _prefs.setInt('userId', result['user']['id']);
  //     _prefs.setString('userName', result['user']['name']);
  //     _prefs.setString('userEmail', result['user']['email']);
  //
  //     if (this.widget.cartItems != null && this.widget.cartItems.length > 0) {
  //       Navigator.push(
  //           context,
  //           MaterialPageRoute(
  //               builder: (context) => CheckoutScreen(
  //                 cartItems: this.widget.cartItems,
  //               )));
  //     } else {
  //       Navigator.pushReplacement(
  //         context,
  //         MaterialPageRoute(builder: (context) => home2()),
  //       );
  //     }
  //   } else {
  //     _showSnackMessage(Text(
  //       'Failed to login!',
  //       style: TextStyle(color: Colors.red),
  //     ));
  //   }
  // }


  _login(BuildContext context, User user) async {
    var _userService = UserService();
    var registeredUser = await _userService.login(user);
    var result = json.decode(registeredUser.body);

    if (result['result'] == true) {
      SharedPreferences _prefs = await SharedPreferences.getInstance();
      _prefs.setInt('userId', result['user']['id']);
      _prefs.setString('userName', result['user']['name']);
      _prefs.setString('userEmail', result['user']['email']);

      int userRole = result['user']['role']; // Assuming 'role' is a field in the user data.

      if (userRole == 1) {
        // Admin user
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => AdminHome()),
        );
      } else if (userRole == 0) {
        // Regular user
        if (this.widget.cartItems != null && this.widget.cartItems.length > 0) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => CheckoutScreen(cartItems: this.widget.cartItems),
            ),
          );
        } else {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => home2()),
          );
        }
      } else {
        // Handle other roles as needed
      }
    } else {
      _showSnackMessage(
        Text(
          'Failed to login!',
          style: TextStyle(color: Colors.red),
        ),
      );
    }
  }



  _showSnackMessage(message) {
    var snackBar = SnackBar(
      content: message,
    );
    //_scaffoldKey.currentState.showSnackBar(snackBar);
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  Future<void> getDeviceTokenToSendNotification() async {
    final FirebaseMessaging _fcm = FirebaseMessaging.instance;
    final token = await _fcm.getToken();
    deviceToken = token.toString();
    print("Token Value $deviceToken");
  }

  // Rest of your code
  // Future<void> getDeviceTokenToSendNotification() async {
  //   final FirebaseMessaging _fcm = FirebaseMessaging.instance;
  //   final token = await _fcm.getToken();
  //   String deviceToken = token.toString();
  //
  //   // Convert string URL to Uri
  //   Uri apiUrl = Uri.parse("https://myconstituency.in/myconstituency/api/save-token");
  //
  //   try {
  //     final response = await http.post(apiUrl, body: {'token': deviceToken});
  //     print("Response Status Code: ${response.statusCode}");
  //     print("Response Body: ${response.body}");
  //     if (response.statusCode == 200) {
  //       print("Device token sent successfully");
  //     } else {
  //       print("Failed to send device token");
  //     }
  //   } catch (error) {
  //     print("Error sending device token: $error");
  //   }
  //
  //
  //   print("Token Value: $deviceToken");
  // }
  @override
  Widget build(BuildContext context) {
    getDeviceTokenToSendNotification();
    return Scaffold(
       backgroundColor: Colors.blueAccent,
      // appBar: AppBar(
      //   backgroundColor: Colors.white,
      //   elevation: 0.0,
      //   actions: <Widget>[
      //     IconButton(
      //       icon: Icon(
      //         Icons.close,
      //         color: Colors.red,
      //       ),
      //       onPressed: () {
      //         Navigator.pop(context);
      //       },
      //     ),
      //   ],
      // ),
      body: ListView(
          children: <Widget>[
            Container(
              height: 150,
              child: Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 40.0,left: 20),
                        child: Text(
                          'Welcome Back',
                          style: TextStyle(
                            color: Colors.white,
                            fontFamily: 'OpenSans',
                            fontSize: 30.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 5.0,left: 20.0),
                        child: Text(
                          'Hey good to see you here',
                          style: TextStyle(
                            color: Colors.white,
                            fontFamily: 'OpenSans',
                            fontSize: 15.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 90),
                    child: Image.asset('assets/v_logo_round.png'),
                  ),
                ],
              ),
            ),
         Container(
           height: 812,
           decoration: ShapeDecoration(
                color: Colors.white,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.only(

                 topLeft: Radius.circular(40),
                 topRight: Radius.circular(40),
               ))),
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 20, horizontal: 30),
            child: ListView(
              children: <Widget>[



                Container(
                  child: Center(
                    child: const Text(
                      'Sign In',
                      style: TextStyle(
                        color: Colors.blueAccent,
                        fontFamily: 'OpenSans',
                        fontSize: 30.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 10.0),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      child: const Text(
                        'Email',
                        style: kLabelStyle,
                      ),
                    ),
                    const SizedBox(height: 10.0),
                    Container(
                      alignment: Alignment.centerLeft,
                      //decoration: kBoxDecorationStyle,
                      decoration: BoxDecoration(
                        color: Colors.grey[200]!.withOpacity(0.3),
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      ),
                      height: 60.0,
                      child: TextFormField(
                        keyboardType: TextInputType.emailAddress,
                        autofocus: false,
                        style: TextStyle(
                          color: Colors.blueAccent,
                          fontFamily: 'OpenSans',
                        ),
                        decoration: InputDecoration(
                          //border: InputBorder.none,
                          contentPadding: EdgeInsets.only(top: 14.0),
                          prefixIcon: Icon(
                            Icons.email,
                            color: Colors.blueAccent,
                          ),
                          hintText: 'Enter your Email',
                          hintStyle: kHintTextStyle,
                          errorStyle: TextStyle(
                              color: Colors.redAccent, fontSize: 15),
                        ),
                        controller: email,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please Enter Email';
                          } else if (!value.contains('@')) {
                            return 'Please Enter Valid Email';
                          }
                          return null;
                        },
                      ),
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 10.0),
                    Container(
                      child: const Text(
                        'Password',
                        style: kLabelStyle,
                      ),
                    ),
                    const SizedBox(height: 10.0),
                    Container(
                      alignment: Alignment.centerLeft,
                      //decoration: kBoxDecorationStyle,
                      decoration: BoxDecoration(
                        color: Colors.grey[200]!.withOpacity(0.3),
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      ),
                      height: 60.0,
                      child: TextFormField(
                        autofocus: false,
                        obscureText: true,
                        style: TextStyle(
                          color: Colors.blueAccent,
                          fontFamily: 'OpenSans',
                        ),
                        decoration: InputDecoration(
                          //border: InputBorder.none,
                          contentPadding: EdgeInsets.only(top: 14.0),
                          prefixIcon: Icon(
                            Icons.lock,
                            color: Colors.blueAccent,
                          ),
                          hintText: 'Enter your Password',
                          hintStyle: kHintTextStyle,
                          errorStyle: TextStyle(
                              color: Colors.redAccent, fontSize: 15),
                        ),
                        controller: password,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please Enter Password';
                          }
                          return null;
                        },
                      ),
                    ),
                  ],
                ),
                Container(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    onPressed: () => {
                      Navigator.push(
                          context,
                          MaterialPageRoute(builder:(context ) => ForgotPasswordPage(),),),



                    },
                    //  padding: EdgeInsets.only(right: 0.0),
                    child: const Text(
                      'Forgot Password?',
                      //style: kLabelStyle,
                      style: TextStyle(
                        color: Colors.black,
                        fontFamily: 'OpenSans',
                        fontSize: 14.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                Container(
                  child: SizedBox(
                    height: 18.0,
                    child: Row(
                      children: <Widget>[
                        Theme(
                          data: ThemeData(
                              unselectedWidgetColor: Colors.black),
                          child: Checkbox(
                            value: _rememberMe,
                            checkColor: Colors.green,
                            activeColor: Colors.blueAccent,
                            onChanged: (value) {
                              setState(() {
                                _rememberMe = value!;
                              });
                            },
                          ),
                        ),
                        const Text(
                          'Remember me',
                          //style: kLabelStyle,
                          style: TextStyle(
                            color: Colors.black,
                            fontFamily: 'OpenSans',
                            fontSize: 14.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 30.0),
                Container(
                  padding: const EdgeInsets.only(left: 20.0,right: 20),
                  width: double.infinity,
                  child: ElevatedButton(

                    onPressed: () {
                      var user = User();
                      user.email = email.text;
                      user.password = password.text;
                      user.device_token = deviceToken.toString();

                      _login(context, user);
                    },
                    style: ButtonStyle(
                      backgroundColor:
                      MaterialStateProperty.all(Colors.blueAccent),
                      padding: MaterialStateProperty.all(EdgeInsets.all(6)),
                      shape:
                      MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ),
                    ),
                    child: const Text(
                      'Sign In',
                      style: TextStyle(
                        color: Colors.black,
                        letterSpacing: 1.5,
                        fontSize: 22.0,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'OpenSans',
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 10.0),



                // ElevatedButton(
                //   onPressed: () {
                //     Navigator.push(
                //         context,
                //         MaterialPageRoute(
                //             builder: (context) => RegistrationScreen(
                //                   cartItems: this.widget.cartItems,
                //                 )));
                //   },
                //   child: FittedBox(child: Text('Register your account')),
                // ),

                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Don't have an Account? ",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 14.0,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      TextButton(
                        onPressed: () => {
                          Navigator.pushAndRemoveUntil(
                              context,
                              PageRouteBuilder(
                                pageBuilder: (context, a, b) => RegistrationScreen(cartItems: this.widget.cartItems,),
                                transitionDuration: Duration(seconds: 0),
                              ),
                                  (route) => false)
                        },
                        child: Text('Signup',
                          style: TextStyle(
                            color: Colors.black,
                            fontFamily: 'OpenSans',
                            fontSize: 14.0,
                            fontWeight: FontWeight.bold,
                          ),
                          //style: kLabelStyle,
                          ),
                      ),
                    ],
                  ),
                ),

              ],
            ),
          ),
        ),],
      ),
    );
  }
}
