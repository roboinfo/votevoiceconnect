
import 'dart:convert';

import 'package:votevoiceconnect/ecom/models/product.dart';
import 'package:votevoiceconnect/ecom/models/user.dart';
import 'package:votevoiceconnect/ecom/screens/login_screen.dart';
import 'package:votevoiceconnect/ecom/services/user_service.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../page/utility/constants.dart';


class RegistrationScreen extends StatefulWidget {
  final List<Product> cartItems;
  RegistrationScreen({required this.cartItems});

  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  final name = TextEditingController();

  final email = TextEditingController();

  final password = TextEditingController();

  _register(BuildContext context, User user) async {
    var _userService = UserService();
    var registeredUser = await _userService.createUser(user);
    // print(registeredUser.body);
    var result = json.decode(registeredUser.body);
    if(result['result'] == true){
      SharedPreferences _prefs = await SharedPreferences.getInstance();
      _prefs.setInt('userId', result['user']['id']);
      _prefs.setString('userName', result['user']['name']);
      _prefs.setString('userEmail', result['user']['email']);
      // Navigator.push(
      //       context, MaterialPageRoute(builder: (context) => CheckoutScreen(cartItems: this.widget.cartItems,)));
    } else {
      _showSnackMessage(Text('Failed to register the user!', style: TextStyle(color: Colors.red),));
    }
  }

  _showSnackMessage(message){
    var snackBar = SnackBar(
      content: message,
    );
   // _scaffoldKey.currentState.showSnackBar(snackBar);
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueAccent,
      key: _scaffoldKey,
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
                          'Sign Up',
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
                          'Hello Let\'s Join with Us',
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
                    padding: const EdgeInsets.only(left: 110),
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
                          'Sign Up',
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
                            'Name',
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
                                Icons.person,
                                color: Colors.blueAccent,
                              ),
                              hintText: 'Enter your Name',
                              hintStyle: kHintTextStyle,
                              errorStyle:
                              TextStyle(color: Colors.redAccent, fontSize: 15),
                            ),

                            controller: name,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Enter your Name';
                              } else if (!value.contains('@')) {
                                return 'Enter your Valid Name';
                              }
                              return null;
                            },
                          ),
                        ),
                      ],
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
                              errorStyle:
                              TextStyle(color: Colors.redAccent, fontSize: 15),
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

                    const SizedBox(height: 10.0),

                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
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
                              errorStyle:
                              TextStyle(color: Colors.redAccent, fontSize: 15),
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

                    const SizedBox(height: 10.0),



                    Container(
                      padding: const EdgeInsets.symmetric(vertical: 20.0),
                      width: double.infinity,
                      child: ElevatedButton(

                        onPressed: () {
                          var user = User();
                          user.name = name.text;
                          user.email = email.text;
                          user.password = password.text;
                          _register(context, user);
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => LoginScreen1(cartItems: [],),),
                          );
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
                          'Sign Up',
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

                    Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Already have an Account? ",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 16.0,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          TextButton(
                              onPressed: () => {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                              builder: (context) => LoginScreen1(cartItems: [],),),
                                ),
                              },
                              child: Text('Sign In',
                                //style: kLabelStyle,
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              )
                          )
                        ],
                      ),
                    ),

                    // Padding(
                    //   padding: const EdgeInsets.all(5),
                    //   child: ElevatedButton(
                    //     onPressed: () {
                    //       Navigator.push(
                    //           context,
                    //           MaterialPageRoute(
                    //               builder: (context) => LoginScreen(cartItems: [],)));
                    //     },
                    //     child: FittedBox(child: Text('Log in to your account')),
                    //   ),
                    // ),

                  ],
                ),
              ),
            ),],
      ),
    );
  }
}
