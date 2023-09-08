import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:votevoiceconnect/language/ChangeLan.dart';
import 'package:votevoiceconnect/stripe.dart';
import 'package:page_transition/page_transition.dart';
import 'package:votevoiceconnect/ecom/screens/donation_screen.dart';
import 'package:votevoiceconnect/ecom/screens/vregistration_screen.dart';
import 'package:votevoiceconnect/page/adsscreen.dart';
import 'package:votevoiceconnect/article/articalscreen.dart';
import 'package:votevoiceconnect/page/dashboard.dart';
import 'package:votevoiceconnect/page/donationscreen2.dart';
import 'package:votevoiceconnect/page/drawescreen.dart';
import 'package:votevoiceconnect/event/eventscreen.dart';
import 'package:votevoiceconnect/page/loginscreen.dart';
import 'package:votevoiceconnect/page/registration.dart';
import 'package:votevoiceconnect/page/splashscreen.dart';
import '../ecom/screens/privatedonation_screen.dart';
import 'Complaint/complaint.dart';

import 'donationscreen2.dart';
import 'package:flutter/services.dart';
import 'newsscreen.dart';
import '../notificationservice/notifications.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  {
    runApp(Home());
  };
}

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScopeNode currentFocus = FocusScope.of(context);

        if (!currentFocus.hasPrimaryFocus) {
          currentFocus.unfocus();
        }

      },
      child: MaterialApp(
        title: 'Vote Voice Connect',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const MyHomePage(),
      ),
    );
  }
}
class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);
  @override
  _MyHomePageState createState() => _MyHomePageState();
}
class _MyHomePageState extends State<MyHomePage> {

  final storage = new FlutterSecureStorage();


  @override
  Widget build(BuildContext context) {

    return DefaultTabController(
      length: 6,
      child: Scaffold(

          appBar: AppBar(
            title: const Text('Vote Voice Connect'),

            // //AppBar Image
            // flexibleSpace: Image(
            //   image: AssetImage('assets/galaxy.png'),
            //   fit: BoxFit.cover,
            // ),

            //backgroundColor: Colors.deepPurple,

              backgroundColor: Color.fromARGB(255, 64, 64, 64),

            // bottom:TabBar(),
            actions: [
              IconButton(
                icon: const Icon(Icons.notifications_none),
                onPressed: () {
                  Navigator.push(context, PageTransition(
                      type: PageTransitionType.leftToRightWithFade,
                      child: Notifications())
                  );
                },
              ),
              LanguageMenu(),
            ],

          ),

          drawer: DrawerScreen(),

          body: Padding(
            padding: const EdgeInsets.all(0.0),
            child: Column(
              children: [
                Container(
                  height: 35,
                  decoration: BoxDecoration(
                    //color: Colors.deepPurple[300],
                    color: Color.fromARGB(255, 90, 90, 90),
                     // borderRadius: BorderRadius.circular(25.0)
                  ),
                  child: TabBar(
                    indicator: BoxDecoration(
                        color: Colors.white12,
                      //  borderRadius: BorderRadius.circular(25.0)
                    ),

                    isScrollable: true,
                    unselectedLabelColor: Colors.white,
                    labelColor: Colors.white,

                    tabs: [
                      Tab(text: 'Dashboard'.tr),
                      Tab(text: 'Articles'.tr),
                      Tab(text: 'Events'.tr),
                      // Tab(text: 'Complaints'),
                      //Tab(text: 'RoboInfoCom'),

                      Tab(text: 'Donation'.tr),
                      Tab(text: 'Private Donation'.tr),
                      Tab(text: 'Registration'.tr),

                    ],
                  ),
                ),
                Expanded(
                    child: TabBarView(
                      children: [
                        Dashboard(),
                        const ArticalScreen(),
                        const EventScreen(),
                        // Complaints(),
                        //const NewsScreen(),

                        DonationScreen(cartItems: [],),
                        PrivateDonationScreen(cartItems: [],),
                        RegistrationScreen(cartItems: [],),


                        // Center(child: Text('Settings Page'),)
                      ],
                    )
                )
              ],
            ),
          )
      ),
    );
  }
}

