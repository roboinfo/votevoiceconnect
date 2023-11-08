import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:get/get.dart';
import 'package:votevoiceconnect/language/InitialBinding.dart';
import 'package:votevoiceconnect/language/StorageService.dart';
import 'package:votevoiceconnect/notificationservice/local_notification_service.dart';
import 'package:votevoiceconnect/language/LocalString.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:votevoiceconnect/ecom/screens/login_screen.dart';
import 'package:votevoiceconnect/page/Admin/adminHome.dart';
import 'package:votevoiceconnect/page/home2.dart';

var storage;


Future<void> backgroundHandler(RemoteMessage message) async {
  print(message.data.toString());
  print(message.notification!.title);
}

void main() async {


  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  FirebaseMessaging.onBackgroundMessage(backgroundHandler);
  LocalNotificationService.initialize();
  await initalConfig();
  storage=Get.find<StorageService>();

  runApp(MyApp());
  Stripe.publishableKey =
  "pk_test_51NSwBwSE81aNcIO7T4eTA2xenAX2hRM6BfQJjCFm6p9Lj0YqJIiNGedXWdXN2FnEROIC3RCJRx3FUjgcZz78UlxH00GoVBgpmR";



  // WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp();
  //
  // LocalNotificationService.initialize();
  // FirebaseMessaging.onBackgroundMessage(backgroundHandler);
  //
  // final fcmToken = await FirebaseMessaging.instance.getToken();
  // print(fcmToken);
  //  {
  //
  //    WidgetsFlutterBinding.ensureInitialized();
  //    await Firebase.initializeApp();
  //    // runApp(MyApp());
  // };
}

initalConfig()async {
  await Get.putAsync(() => StorageService().init());
}

class MyApp extends StatefulWidget {

  static const String title = 'MyConstituency';

  MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool _isLoggedIn = false;
  int _userRole = 0;

  @override
  void initState() {
    _checkIfLoggedIn();
    super.initState();
  }

  // void _checkIfLoggedIn() async{
  //   // check if token is there
  //   SharedPreferences localStorage = await SharedPreferences.getInstance();
  //   var token = localStorage.getString('token');
  //   var userRole = localStorage.getInt('userRole');
  //   if(token!= null){
  //     setState(() {
  //       _isLoggedIn = true;
  //       _userRole = userRole ?? 0;
  //     });
  //   }
  // }

  void _checkIfLoggedIn() async {
    // Check if token is there
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    var token = localStorage.getString('token');
    var userRole = localStorage.getInt('userRole');

    if (token != null) {
      setState(() {
        _isLoggedIn = true;
        if (userRole != null) {
          _userRole = userRole;
        }
      });
    }
  }



  @override
  Widget build(BuildContext context) {
    return  GetMaterialApp(
        debugShowCheckedModeBanner: false,
      translations: LocaleString(),
      locale: storage.lanCode!= null
          ?Locale(storage.lanCode,storage.countryCode)
          :Locale("en","US"),
      fallbackLocale:Locale("en","US"),
      initialBinding: InitialBinding(),
        title: "MyConstituency",
        theme: ThemeData(
          primaryColor: Colors.blueAccent,
        ),
      // home: _isLoggedIn ? home2() :  LoginScreen1(cartItems: [],),

      home: _isLoggedIn
          ? _userRole == 1
          ? AdminHome()
          : home2()
          : LoginScreen1(cartItems: []),

    );

  }
}



