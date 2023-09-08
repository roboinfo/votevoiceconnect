import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:votevoiceconnect/ecom/screens/home_screen.dart';
import 'package:votevoiceconnect/notificationservice/demo.dart';
import 'package:votevoiceconnect/page/splashscreen.dart';
import 'package:votevoiceconnect/youtube/screens/favScreen.dart';
import '../notificationservice/local_notification_service.dart';
import 'bottomseach.dart';
import 'Messages/Messages.dart';
import 'home.dart';
import 'gallery/Profile.dart';



class home2 extends StatefulWidget {
  const home2({Key? key}) : super(key: key);

  @override
  _home2State createState() => _home2State();
}

class _home2State extends State<home2> {
  String deviceTokenToSendPushNotification = "";

  //*******************login firebase
  @override
  void initState() {
    super.initState();

    // 1. This method call when app in terminated state and you get a notification
    // when you click on notification app open from terminated state and you can get notification data in this method

    FirebaseMessaging.instance.getInitialMessage().then(
          (message) {
        print("FirebaseMessaging.instance.getInitialMessage");
        if (message != null) {
          print("New Notification");
          if (message.data['_id'] != null) {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => Demo(
                  id: message.data['_id'],
                ),
              ),
            );
          }
        }
      },
    );

    // 2. This method only call when App in forground it mean app must be opened
    FirebaseMessaging.onMessage.listen(
          (message) {
        print("FirebaseMessaging.onMessage.listen");
        if (message.notification != null) {
          print(message.notification!.title);
          print(message.notification!.body);
          print("message.data11 ${message.data}");
          LocalNotificationService.createanddisplaynotification(message);

        }
      },
    );

    // 3. This method only call when App in background and not terminated(not closed)
    FirebaseMessaging.onMessageOpenedApp.listen(
          (message) {
        print("FirebaseMessaging.onMessageOpenedApp.listen");
        if (message.notification != null) {
          print(message.notification!.title);
          print(message.notification!.body);
          print("message.data22 ${message.data['_id']}");
        }
      },
    );
  }

  int index = 0;
  final storage = new FlutterSecureStorage();

  // Future<void> getDeviceTokenToSendNotification() async {
  //   final FirebaseMessaging _fcm = FirebaseMessaging.instance;
  //   final token = await _fcm.getToken();
  //   deviceTokenToSendPushNotification = token.toString();
  //   print("Token Value $deviceTokenToSendPushNotification");
  // }




  @override
  Widget build(BuildContext context) {

    Future<bool> showExitPopup() async {
      return await showDialog(
            //show confirm dialogue
            //the return value will be from "Yes" or "No" options
            context: context,
            builder: (context) => AlertDialog(
              title: Text('Exit App'),
              content: Text('Do you want to exit an App?'),
              actions: [
                ElevatedButton(
                  onPressed: () => Navigator.of(context).pop(false),
                  //return false when click on "NO"
                  child:Text('No'),
                ),

                ElevatedButton(
                  onPressed: () => Navigator.of(context).pop(true),
                  //return true when click on "Yes"
                  child:Text('Yes'),
                ),

              ],
            ),
          ) ??
          false; //if showDialouge had returned null, then return false
    }

    return WillPopScope(
      onWillPop: showExitPopup,
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        bottomNavigationBar: buildBottomBar(),
        body: buildPages(),
      ),
    );
  }

  Widget buildBottomBar() {
    const style = TextStyle(color: Colors.white);
    return BottomNavigationBar(
      selectedItemColor: Colors.blueAccent,
      unselectedItemColor: Colors.black87,
      backgroundColor: Colors.lightBlueAccent,
      currentIndex: index,
      items:  [
        BottomNavigationBarItem(

          icon: Icon(Icons.home),
          label: 'Home'.tr,
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.search,
          ),
          label: 'Search'.tr,
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.video_collection),
          label: 'News Videos'.tr,
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.shopping_cart),
          label: 'Shopping'.tr,
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.more),
          label: 'More'.tr,
        ),
      ],
      onTap: (int index) => setState(() => this.index = index),
    );
  }

  Widget buildPages() {
    switch (index) {
      case 0:
        return const Home();
      case 1:
        return const BSearch();
      case 2:
        return FavScreen();
      case 3:
        return ecom();
      case 4:
        return Profile();
      default:
        return Container();
    }
  }
}
