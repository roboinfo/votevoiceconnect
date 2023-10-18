import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:votevoiceconnect/ComplaintReport/complaintReport.dart';
import 'package:votevoiceconnect/page/PushNotificationPage.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:votevoiceconnect/article/articalscreen.dart';
import 'package:votevoiceconnect/ecom/screens/login_screen.dart';
import 'package:votevoiceconnect/ecom/screens/privatedonation_screen.dart';
import 'package:votevoiceconnect/ecom/screens/vregistration_screen.dart';
import 'package:votevoiceconnect/page/bottomseach.dart';
import 'package:votevoiceconnect/event/eventscreen.dart';
import 'package:votevoiceconnect/notificationservice/notifications.dart';
import 'package:votevoiceconnect/page/splashscreen.dart';
import 'package:votevoiceconnect/youtube/screens/favScreen.dart';
import 'package:votevoiceconnect/page/loginscreen.dart';
import 'package:votevoiceconnect/page/gallery/Profile.dart';
import 'package:votevoiceconnect/page/newsscreen.dart';
import 'package:votevoiceconnect/page/profilePage.dart';

import '../ecom/screens/complaint_screen.dart';
import '../ecom/screens/donation_screen.dart';

class DrawerScreen extends StatefulWidget {
  const DrawerScreen({Key? key}) : super(key: key);

  @override
  State<DrawerScreen> createState() => _DrawerScreenState();
}

class _DrawerScreenState extends State<DrawerScreen> {

  String _userName = '';
  String _userEmail = '';


  @override
  void initState() {
    _getUserName();
    _getUserEmail();

    super.initState();
  }

  _getUserName() async {
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    String userName = _prefs.getString('userName') ?? '';
    setState(() {
      _userName = userName;
    });
  }
  _getUserEmail() async {
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    String userEmail = _prefs.getString('userEmail') ?? '';
    setState(() {
      _userEmail = userEmail;
    });
  }


  int index = 0;
  final storage = new FlutterSecureStorage();
  @override
  Widget build(BuildContext context) {

    return Container(
      child: (SafeArea(

        child: Drawer(

          //backgroundColor: Color.fromRGBO(0, 0, 0, 0.10),
          child: Column(
            children: <Widget>[
              UserAccountsDrawerHeader(
                accountName: Text('Welcome, $_userName!'.tr, style: TextStyle(fontSize: 18, color: Colors.black),),
                accountEmail: Text('contact.rinfo@gmail.com', style: TextStyle(fontSize: 18, color: Colors.black),),
                currentAccountPicture: CircleAvatar(
                  child: ClipOval(child: Image.asset('assets/Roboinfocom.png'),),
                ),
                decoration: BoxDecoration(
                    color: Colors.pinkAccent,
                    image: DecorationImage(image: AssetImage('assets/logo.png'), fit: BoxFit.cover)
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              ListTile(
                leading: const Icon(
                  Icons.person,
                  color: Colors.black,
                  size: 28,
                ),
                title: Text(
                  'Profile'.tr,
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.black,
                  ),
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Profile()),
                  );
                },
              ),
              const SizedBox(
                height: 0,
              ),
              ListTile(
                leading: Icon(
                  Icons.ondemand_video_sharp,
                  color: Colors.black,
                  size: 28,
                ),
                title: Text(
                  'Videos'.tr,
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.black,
                  ),
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => FavScreen()),
                  );
                },
              ),
              const SizedBox(
                height: 0,
              ),
              ListTile(
                leading: Icon(
                  Icons.article_outlined,
                  color: Colors.black,
                  size: 28,
                ),
                title: Text(
                  'Notification'.tr,
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.black,
                  ),
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Notifications()),
                  );
                },
              ),
              const SizedBox(
                height: 0,
              ),
              ListTile(
                leading: Icon(
                  Icons.article_outlined,
                  color: Colors.black,
                  size: 28,
                ),
                title: Text(
                  'Complaint Reports'.tr,
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.black,
                  ),
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => complaintReport()),
                  );
                },
              ),

              ListTile(
                leading: Icon(
                  Icons.article_outlined,
                  color: Colors.black,
                  size: 28,
                ),
                title: Text(
                  'Complaint Reports'.tr,
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.black,
                  ),
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => PushNotificationPage()),
                  );
                },
              ),

              const SizedBox(
                height: 0,
              ),


              ListTile(
                leading: const Icon(
                  Icons.arrow_back,
                  color: Colors.black,
                  size: 28,
                ),
                title: Text(
                  'Logout'.tr,
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.black,
                  ),
                ),
                onTap: () {
                  _showMessageDialog(context);
                },
              ),
            ],
          ),
        ),

      )),
    );
  }
}
final storage = new FlutterSecureStorage();
void _showMessageDialog(BuildContext context) => showDialog(

    context: context,
    builder: (context) => AlertDialog(
          title: const Text('Are you sure?'),
          content: const Text('Do you want to logout'),
          actions: [
            ElevatedButton(
              onPressed: () => Navigator.of(context).pop(false),
              //return false when click on "NO"
              child: Text('No'),
            ),
            ElevatedButton(
              onPressed: () async {
                SharedPreferences _prefs = await SharedPreferences.getInstance();
                _prefs.clear();
                Navigator.pushReplacementNamed(context, '/');
              },
              child: Text('Logout'.tr),
            ),
            // ElevatedButton(
            //   onPressed: () async => {
            //     await FirebaseAuth.instance.signOut(),
            //     await storage.delete(key: "uid"),
            //     Navigator.pushAndRemoveUntil(
            //         context,
            //         MaterialPageRoute(
            //           builder: (context) => LoginScreen1(cartItems: [],),
            //         ),
            //             (route) => false)
            //   },
            //   child: Text('Yes'),
            //
            // )
          ],
        ));
