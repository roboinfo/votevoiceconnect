import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_maps/maps.dart';
import 'package:votevoiceconnect/Blog/blogscreen.dart';
import 'package:votevoiceconnect/ComplaintReport/ComplaintBarChart.dart';
import 'package:votevoiceconnect/ComplaintReport/ComplaintDonutChart.dart';
import 'package:votevoiceconnect/ComplaintReport/ComplaintLineChart.dart';
import 'package:votevoiceconnect/ComplaintReport/ComplaintPieChart.dart';
import 'package:votevoiceconnect/ComplaintReport/allChart.dart';
import 'package:votevoiceconnect/ComplaintReport/complaintReport.dart';
import 'package:votevoiceconnect/Gscheme/gschemeBarChart.dart';
import 'package:votevoiceconnect/Gscheme/scheme1.dart';
import 'package:votevoiceconnect/article/article1.dart';
import 'package:votevoiceconnect/article/articleBarChart.dart';
import 'package:votevoiceconnect/ecom/widgets/carousel_slider.dart';
import 'package:votevoiceconnect/ecom/widgets/video_slider.dart';
import 'package:votevoiceconnect/event/eventBarChart.dart';
import 'package:votevoiceconnect/event/events1.dart';
import 'package:votevoiceconnect/language/ChangeLan.dart';
import 'package:votevoiceconnect/page/gallery/Profile.dart';
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
import 'package:votevoiceconnect/youtube/screens/favScreen.dart';
import '../Gscheme/gscheme.dart';
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

    return Scaffold(
      backgroundColor: Color.fromRGBO(0, 0, 0, 0.10),
        appBar: AppBar(
          title: const Text('Vote Voice Connect',style: TextStyle(color: Colors.black)),
          iconTheme: IconThemeData(color: Colors.black),
          backgroundColor: Colors.white,
          actions: [
            IconButton(
              icon: const Icon(Icons.notifications_none,color: Colors.black,),
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

        body: SingleChildScrollView(
          child: SafeArea(
            child: Center(
              child: Column(
                children: [

                  carouselSlider(),


                  const SizedBox(
                    height: 0,
                  ),

//create a new page for this video slider page.

                  //VideoSlider(),


                  Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.only(left: 3.0, right: 3.0),
                              child: Container(
                                height: 70,
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    primary: Colors.white,
                                    onPrimary: Colors.black,
                                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                                    textStyle: TextStyle(fontSize: 10, fontWeight: FontWeight.bold),
                                  ),
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(builder: (context) => const article1()),
                                    );
                                  },
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Icon(
                                        Icons.newspaper,
                                      ),
                                      Text(
                                        "Articles".tr,
                                        // Customize text style as needed
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),

                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.only(left: 3.0, right: 3.0),
                              child: Container(
                                height: 70,
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    primary: Colors.white,
                                    onPrimary: Colors.black,
                                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                                    textStyle: TextStyle(fontSize: 10, fontWeight: FontWeight.bold),
                                  ),
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(builder: (context) => const events1()),
                                    );
                                  },
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Icon(
                                        Icons.event,
                                      ),
                                      Text(
                                        "Events".tr,
                                        // Customize text style as needed
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),

                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.only(left: 3.0, right: 3.0),
                              child: Container(
                                height: 70,
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    primary: Colors.white,
                                    onPrimary: Colors.black,
                                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                                    textStyle: TextStyle(fontSize: 10, fontWeight: FontWeight.bold),
                                  ),
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(builder: (context) => DonationScreen()),
                                    );
                                  },
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Icon(
                                        Icons.attach_money,
                                      ),
                                      Text(
                                        "Donation".tr,
                                        // Customize text style as needed
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),

                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.only(left: 3.0, right: 3.0),
                              child: Container(
                                height: 70,
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    primary: Colors.white,
                                    onPrimary: Colors.black,
                                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                                    textStyle: TextStyle(fontSize: 10, fontWeight: FontWeight.bold),
                                  ),
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(builder: (context) => const PrivateDonationScreen()),
                                    );
                                  },
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Icon(
                                        Icons.monetization_on_outlined,
                                      ),
                                      Text(
                                        "Private Donation".tr,
                                        // Customize text style as needed
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),

                        ]),
                  ),


                  Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(left: 3.0, right: 3.0),
                            child: Container(
                              height: 70,
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  primary: Colors.white,
                                  onPrimary: Colors.black,
                                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                                  textStyle: TextStyle(fontSize: 10, fontWeight: FontWeight.bold),
                                ),
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (context) => FavScreen()),
                                  );
                                },
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(
                                      Icons.video_collection_outlined,
                                    ),
                                    Text(
                                      "Videos".tr,
                                      // Customize text style as needed
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),

                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(left: 3.0, right: 3.0),
                            child: Container(
                              height: 70,
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  primary: Colors.white,
                                  onPrimary: Colors.black,
                                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                                  textStyle: TextStyle(fontSize: 10, fontWeight: FontWeight.bold),
                                ),
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (context) => complaintReport()),
                                  );
                                },
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(
                                      Icons.report_problem_outlined,
                                    ),
                                    Text(
                                      "Complaint".tr,
                                      // Customize text style as needed
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),

                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(left: 3.0, right: 3.0),
                            child: Container(
                              height: 70,
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  primary: Colors.white,
                                  onPrimary: Colors.black,
                                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                                  textStyle: TextStyle(fontSize: 10, fontWeight: FontWeight.bold),
                                ),
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (context) => Profile()),
                                  );
                                },
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(
                                      Icons.browse_gallery_outlined,
                                    ),
                                    Text(
                                      "Gallery".tr,
                                      // Customize text style as needed
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),

                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(left: 3.0, right: 3.0),
                            child: Container(
                              height: 70,
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  primary: Colors.white,
                                  onPrimary: Colors.black,
                                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                                  textStyle: TextStyle(fontSize: 10, fontWeight: FontWeight.bold),
                                ),
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (context) => scheme1()),
                                  );
                                },
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(
                                      Icons.schema_outlined,
                                    ),
                                    Text(
                                      "Govt. Scheme".tr,
                                      // Customize text style as needed
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),

                      ],
                    ),
                  ),





// this only name with logo

                  // Container(
                  //   decoration: BoxDecoration(
                  //     //borderRadius: BorderRadius.circular(20.0),
                  //     //color: Color.fromRGBO(0, 0, 0, 0.10),
                  //     color: Colors.green,
                  //   ),
                  //   child: Padding(
                  //     padding: const EdgeInsets.all(10.0),
                  //     child: Row(
                  //       children: [
                  //         Icon(
                  //           Icons.play_circle_fill_outlined,
                  //           color: Colors.white,
                  //           size: 25.0,
                  //         ),
                  //         Padding(
                  //           padding: const EdgeInsets.only(left: 5.0),
                  //           child: Text(
                  //             'About Vote Voice Connect'.tr,
                  //             textAlign: TextAlign.center,
                  //             style: TextStyle(
                  //                 color: Colors.white,
                  //                 fontWeight: FontWeight.bold,
                  //                 fontSize: 22.0),
                  //           ),
                  //         ),
                  //
                  //       ],
                  //     ),
                  //   ),
                  // ),

                  const SizedBox(
                    height: 5,
                  ),


                  GestureDetector(
                    onTap: () => Navigator.of(context).push(new MaterialPageRoute(
                        builder: (BuildContext context) => new allChart())),
                    child: Container(
                      height: 180,
                      width: 400,
                      child: ComplaintPieChart(),
                    ),
                  ),

                  // Container(
                  //   height: 220,
                  //   width: 400,
                  //   child: Padding(
                  //       padding: const EdgeInsets.all(10.0),
                  //       child: SfMaps(
                  //         layers: [
                  //           MapTileLayer(
                  //             urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                  //             initialFocalLatLng: MapLatLng(20, 76),
                  //
                  //             initialZoomLevel: 3,
                  //           )
                  //         ],
                  //       )),
                  //
                  // ),



                  Container(
                    height: 230,
                    width: 400,
                    child: BlogScreen(),
                  ),

                  Row(
                    children: <Widget>[
                      Flexible(
                        flex: 1,
                        fit: FlexFit.tight,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ElevatedButton.icon(
                            style: ElevatedButton.styleFrom(
                              primary: Colors.deepOrange,
                              onPrimary: Colors.white,
                              padding: EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 10),
                              textStyle: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Profile()),
                              );
                            },

                            label: Text("Vote Voice Connect Fellowship".tr),
                            icon: Icon(
                              Icons.add_box,
                            ),
                            //.........
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),

        // Padding(
        //   padding: const EdgeInsets.all(0.0),
        //   child: Column(
        //     children: [
        //       Container(
        //         height: 35,
        //         decoration: BoxDecoration(
        //           //color: Colors.deepPurple[300],
        //           color: Color.fromARGB(255, 90, 90, 90),
        //            // borderRadius: BorderRadius.circular(25.0)
        //         ),
        //         child: TabBar(
        //           indicator: BoxDecoration(
        //               color: Colors.white12,
        //             //  borderRadius: BorderRadius.circular(25.0)
        //           ),
        //
        //           isScrollable: true,
        //           unselectedLabelColor: Colors.white,
        //           labelColor: Colors.white,
        //
        //           tabs: [
        //             Tab(text: 'Dashboard'.tr),
        //             Tab(text: 'Articles'.tr),
        //             Tab(text: 'Events'.tr),
        //             // Tab(text: 'Complaints'),
        //             //Tab(text: 'RoboInfoCom'),
        //
        //             Tab(text: 'Donation'.tr),
        //             Tab(text: 'Private Donation'.tr),
        //             Tab(text: 'Registration'.tr),
        //
        //           ],
        //         ),
        //       ),
        //       Expanded(
        //           child: TabBarView(
        //             children: [
        //               Dashboard(),
        //               const ArticalScreen(),
        //               const EventScreen(),
        //               // Complaints(),
        //               //const NewsScreen(),
        //
        //               DonationScreen(cartItems: [],),
        //               PrivateDonationScreen(cartItems: [],),
        //               RegistrationScreen(cartItems: [],),
        //
        //
        //               // Center(child: Text('Settings Page'),)
        //             ],
        //           )
        //       )
        //     ],
        //   ),
        // )
    );
  }
}

