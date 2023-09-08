// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:flutter_secure_storage/flutter_secure_storage.dart';
// import 'package:get/get.dart';
// import 'package:myconstituency/article/articalscreen.dart';
// import 'package:myconstituency/page/home.dart';
// import 'package:myconstituency/page/home2.dart';
// import 'package:myconstituency/page/signup.dart';
// import 'package:myconstituency/page/utility/constants.dart';
//
// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   await Firebase.initializeApp();
//   runApp(LoginScreen());
// }
//
// class LoginScreen extends StatefulWidget {
//   LoginScreen({Key? key}) : super(key: key);
//
//   @override
//   _LoginScreenState createState() => _LoginScreenState();
// }
//
// class _LoginScreenState extends State<LoginScreen> {
//   final Future<FirebaseApp> _initialization = Firebase.initializeApp();
//   bool _rememberMe = false;
//
//   final _formKey = GlobalKey<FormState>();
//
//   var email = "";
//   var password = "";
//
//   // Create a text controller and use it to retrieve the current value
//   // of the TextField.
//   final emailController = TextEditingController();
//   final passwordController = TextEditingController();
//
//   final storage = new FlutterSecureStorage();
//
//   userLogin() async {
//     try {
//       UserCredential userCredential = await FirebaseAuth.instance
//           .signInWithEmailAndPassword(email: email, password: password);
//       //print(userCredential);
//       //print(userCredential.user?.uid);
//       await storage.write(key: "uid", value: userCredential.user?.uid);
//
//       Navigator.pushReplacement(
//         context,
//         MaterialPageRoute(
//           builder: (context) => home2(),
//         ),
//       );
//     } on FirebaseAuthException catch (e) {
//       if (e.code == 'user-not-found') {
//         print("No User Found for that Email");
//         ScaffoldMessenger.of(context).showSnackBar(
//           SnackBar(
//             backgroundColor: Colors.orangeAccent,
//             content: Text(
//               "No User Found for that Email",
//               style: TextStyle(fontSize: 18.0, color: Colors.black),
//             ),
//           ),
//         );
//       } else if (e.code == 'wrong-password') {
//         print("Wrong Password Provided by User");
//         ScaffoldMessenger.of(context).showSnackBar(
//           SnackBar(
//             backgroundColor: Colors.orangeAccent,
//             content: Text(
//               "Wrong Password Provided by User",
//               style: TextStyle(fontSize: 18.0, color: Colors.black),
//             ),
//           ),
//         );
//       }
//     }
//   }
//
//   @override
//   void dispose() {
//     // Clean up the controller when the widget is disposed.
//     emailController.dispose();
//     passwordController.dispose();
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     Future<bool> showExitPopup() async {
//       return await showDialog( //show confirm dialogue
//         //the return value will be from "Yes" or "No" options
//         context: context,
//         builder: (context) => AlertDialog(
//           title: Text('Exit App'),
//           content: Text('Do you want to exit an App?'),
//           actions:[
//             ElevatedButton(
//               onPressed: () => Navigator.of(context).pop(false),
//               //return false when click on "NO"
//               child:Text('No'),
//             ),
//
//             ElevatedButton(
//               onPressed: () => Navigator.of(context).pop(true),
//               //return true when click on "Yes"
//               child:Text('Yes'),
//             ),
//
//           ],
//         ),
//       )??false; //if showDialouge had returned null, then return false
//     }
//     return WillPopScope(
//       onWillPop: showExitPopup,
//       child: Scaffold(
//         body: AnnotatedRegion<SystemUiOverlayStyle>(
//           value: SystemUiOverlayStyle.light,
//           child: GestureDetector(
//             onTap: () => FocusScope.of(context).unfocus(),
//             child: Container(
//
//
//               // decoration: const BoxDecoration(
//               //     gradient: LinearGradient(
//               //         begin: Alignment.topLeft,
//               //         end: Alignment.bottomRight,
//               //         colors: [Colors.purple, Colors.orange])),
//
//               height: double.infinity,
//               width: double.infinity,
//               decoration: const BoxDecoration(
//
//                 image: DecorationImage(
//                     image: AssetImage('assets/logo.png'), fit: BoxFit.cover),
//
//                 // gradient: LinearGradient(
//                 //   begin: Alignment.topCenter,
//                 //   end: Alignment.bottomCenter,
//                 //   colors: [
//                 //     Color(0xFF73AEF5),
//                 //     Color(0xFF61A4F1),
//                 //     Color(0xFF478DE0),
//                 //     Color(0xFF398AE5),
//                 //   ],
//                 //   stops: [0.1, 0.4, 0.7, 0.9],
//                 // ),
//
//               ),
//
//
//               child: Container(
//
//                 width: double.infinity,
//                 height: double.infinity,
//                 decoration: BoxDecoration(
//                   gradient: LinearGradient(
//                     begin: Alignment.topCenter,
//                     end: Alignment.bottomCenter,
//                     stops: [0.1, 0.3, 0.5, 0.7, 0.9],
//                     colors: [
//                       Colors.black.withOpacity(0.4),
//                       Colors.black.withOpacity(0.55),
//                       Colors.black.withOpacity(0.7),
//                       Colors.black.withOpacity(0.8),
//                       Colors.black.withOpacity(1.0),
//                     ],
//                   ),
//                 ),
//
//                 child: Form(
//                   key: _formKey,
//                   child: Padding(
//                     padding: EdgeInsets.symmetric(vertical: 20, horizontal: 30),
//                     child: ListView(
//                       children: [
//                         const SizedBox(height: 40.0),
//                         Container(
//                           child: Center(
//                             child: const Text(
//                               'Sign In',
//                               style: TextStyle(
//                                 color: Colors.white,
//                                 fontFamily: 'OpenSans',
//                                 fontSize: 30.0,
//                                 fontWeight: FontWeight.bold,
//                               ),
//                             ),
//                           ),
//                         ),
//                         const SizedBox(height: 10.0),
//                         Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             Container(
//                               child: const Text(
//                                 'Email',
//                                 style: kLabelStyle,
//                               ),
//                             ),
//                             const SizedBox(height: 10.0),
//                             Container(
//                               alignment: Alignment.centerLeft,
//                               //decoration: kBoxDecorationStyle,
//                               decoration: BoxDecoration(
//                                 color: Colors.grey[200]!.withOpacity(0.3),
//                                 borderRadius: BorderRadius.all(Radius.circular(10.0)),
//                               ),
//                               height: 60.0,
//                               child: TextFormField(
//                                 keyboardType: TextInputType.emailAddress,
//                                 autofocus: false,
//                                 style: TextStyle(
//                                   color: Colors.white,
//                                   fontFamily: 'OpenSans',
//                                 ),
//                                 decoration: InputDecoration(
//                                   border: InputBorder.none,
//                                   contentPadding: EdgeInsets.only(top: 14.0),
//                                   prefixIcon: Icon(
//                                     Icons.email,
//                                     color: Colors.white,
//                                   ),
//                                   hintText: 'Enter your Email',
//                                   hintStyle: kHintTextStyle,
//                                   errorStyle: TextStyle(
//                                       color: Colors.redAccent, fontSize: 15),
//                                 ),
//                                 controller: emailController,
//                                 validator: (value) {
//                                   if (value == null || value.isEmpty) {
//                                     return 'Please Enter Email';
//                                   } else if (!value.contains('@')) {
//                                     return 'Please Enter Valid Email';
//                                   }
//                                   return null;
//                                 },
//                               ),
//                             ),
//                           ],
//                         ),
//                         Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             const SizedBox(height: 10.0),
//                             Container(
//                               child: const Text(
//                                 'Password',
//                                 style: kLabelStyle,
//                               ),
//                             ),
//                             const SizedBox(height: 10.0),
//                             Container(
//                               alignment: Alignment.centerLeft,
//                               //decoration: kBoxDecorationStyle,
//                               decoration: BoxDecoration(
//                                 color: Colors.grey[200]!.withOpacity(0.3),
//                                 borderRadius: BorderRadius.all(Radius.circular(10.0)),
//                               ),
//                               height: 60.0,
//                               child: TextFormField(
//                                 autofocus: false,
//                                 obscureText: true,
//                                 style: TextStyle(
//                                   color: Colors.white,
//                                   fontFamily: 'OpenSans',
//                                 ),
//                                 decoration: InputDecoration(
//                                   border: InputBorder.none,
//                                   contentPadding: EdgeInsets.only(top: 14.0),
//                                   prefixIcon: Icon(
//                                     Icons.lock,
//                                     color: Colors.white,
//                                   ),
//                                   hintText: 'Enter your Password',
//                                   hintStyle: kHintTextStyle,
//                                   errorStyle: TextStyle(
//                                       color: Colors.redAccent, fontSize: 15),
//                                 ),
//                                 controller: passwordController,
//                                 validator: (value) {
//                                   if (value == null || value.isEmpty) {
//                                     return 'Please Enter Password';
//                                   }
//                                   return null;
//                                 },
//                               ),
//                             ),
//                           ],
//                         ),
//                         Container(
//                           alignment: Alignment.centerRight,
//                           child: TextButton(
//                             onPressed: () =>
//                                 print('Forgot Password Button Pressed'),
//                             //  padding: EdgeInsets.only(right: 0.0),
//                             child: const Text(
//                               'Forgot Password?',
//                               style: kLabelStyle,
//                             ),
//                           ),
//                         ),
//                         Container(
//                           child: SizedBox(
//                             height: 18.0,
//                             child: Row(
//                               children: <Widget>[
//                                 Theme(
//                                   data: ThemeData(
//                                       unselectedWidgetColor: Colors.white),
//                                   child: Checkbox(
//                                     value: _rememberMe,
//                                     checkColor: Colors.green,
//                                     activeColor: Colors.white,
//                                     onChanged: (value) {
//                                       setState(() {
//                                         _rememberMe = value!;
//                                       });
//                                     },
//                                   ),
//                                 ),
//                                 const Text(
//                                   'Remember me',
//                                   style: kLabelStyle,
//                                 ),
//                               ],
//                             ),
//                           ),
//                         ),
//
//                         Container(
//                           padding: const EdgeInsets.symmetric(vertical: 20.0),
//                           width: double.infinity,
//                           child: ElevatedButton(
//                             onPressed: () {
//                               // Validate returns true if the form is valid, otherwise false.
//                               if (_formKey.currentState!.validate()) {
//                                 setState(() {
//                                   email = emailController.text;
//                                   password = passwordController.text;
//                                 });
//                                 userLogin();
//                               }
//                             },
//                             style: ButtonStyle(
//                               backgroundColor:
//                               MaterialStateProperty.all(Colors.white),
//                               padding: MaterialStateProperty.all(EdgeInsets.all(6)),
//                               shape:
//                               MaterialStateProperty.all<RoundedRectangleBorder>(
//                                 RoundedRectangleBorder(
//                                   borderRadius: BorderRadius.circular(10.0),
//                                 ),
//                               ),
//                             ),
//                             child: Text(
//                               'Login'.tr,
//                               style: TextStyle(
//                                 color: Colors.blue,
//                                 letterSpacing: 1.5,
//                                 fontSize: 22.0,
//                                 fontWeight: FontWeight.bold,
//                                 fontFamily: 'OpenSans',
//                               ),
//                             ),
//                           ),
//                         ),
//
//                         Container(
//                           child: Column(
//                             children: const <Widget>[
//                               Text(
//                                 '- OR -',
//                                 style: TextStyle(
//                                   color: Colors.white,
//                                   fontWeight: FontWeight.w400,
//                                 ),
//                               ),
//                               SizedBox(height: 20.0),
//                               Text(
//                                 'Sign in with',
//                                 style: kLabelStyle,
//                               ),
//                             ],
//                           ),
//                         ),
//                         const SizedBox(height: 10.0),
//                         Row(
//                           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                           children: [
//                             GestureDetector(
//                               //onTap: onTap,
//                               child: Container(
//                                 height: 50.0,
//                                 width: 60.0,
//                                 decoration: BoxDecoration(
//                                   shape: BoxShape.circle,
//                                   color: Colors.white,
//                                   boxShadow: const [
//                                     BoxShadow(
//                                       color: Colors.black26,
//                                       offset: Offset(0, 4),
//                                       blurRadius: 6.0,
//                                     ),
//                                   ],
//                                   image: DecorationImage(
//                                     image: AssetImage('assets/google.png'),
//                                   ),
//                                 ),
//                               ),
//                             ),
//                             GestureDetector(
//                               //onTap: onTap,
//                               child: Container(
//                                 height: 50.0,
//                                 width: 60.0,
//                                 decoration: BoxDecoration(
//                                   shape: BoxShape.circle,
//                                   color: Colors.white,
//                                   boxShadow: const [
//                                     BoxShadow(
//                                       color: Colors.black26,
//                                       offset: Offset(0, 4),
//                                       blurRadius: 6.0,
//                                     ),
//                                   ],
//                                   image: DecorationImage(
//                                     image: AssetImage('assets/facebook.png'),
//                                   ),
//                                 ),
//                               ),
//                             ),
//                             GestureDetector(
//                               //onTap: onTap,
//                               child: Container(
//                                 height: 50.0,
//                                 width: 60.0,
//                                 decoration: BoxDecoration(
//                                   shape: BoxShape.circle,
//                                   color: Colors.white,
//                                   boxShadow: const [
//                                     BoxShadow(
//                                       color: Colors.black26,
//                                       offset: Offset(0, 4),
//                                       blurRadius: 6.0,
//                                     ),
//                                   ],
//                                   image: DecorationImage(
//                                     image: AssetImage('assets/Instagram.png'),
//                                   ),
//                                 ),
//                               ),
//                             ),
//                             GestureDetector(
//                               //onTap: onTap,
//                               child: Container(
//                                 height: 50.0,
//                                 width: 60.0,
//                                 decoration: BoxDecoration(
//                                   shape: BoxShape.circle,
//                                   color: Colors.white,
//                                   boxShadow: const [
//                                     BoxShadow(
//                                       color: Colors.black26,
//                                       offset: Offset(0, 4),
//                                       blurRadius: 6.0,
//                                     ),
//                                   ],
//                                   image: DecorationImage(
//                                     image: AssetImage('assets/twitter.png'),
//                                   ),
//                                 ),
//                               ),
//                             ),
//                           ],
//                         ),
//                         Container(
//                           child: Row(
//                             mainAxisAlignment: MainAxisAlignment.center,
//                             children: [
//                               Text(
//                                 "Don't have an Account? ",
//                                 style: TextStyle(
//                                   color: Colors.white,
//                                   fontSize: 16.0,
//                                   fontWeight: FontWeight.w400,
//                                 ),
//                               ),
//                               TextButton(
//                                 onPressed: () => {
//                                   Navigator.pushAndRemoveUntil(
//                                       context,
//                                       PageRouteBuilder(
//                                         pageBuilder: (context, a, b) => Signup(),
//                                         transitionDuration: Duration(seconds: 0),
//                                       ),
//                                           (route) => false)
//                                 },
//                                 child: Text('Signup',style: kLabelStyle,),
//                               ),
//                             ],
//                           ),
//                         )
//                       ],
//                     ),
//                   ),
//                 ),
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
