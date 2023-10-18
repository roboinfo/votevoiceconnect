// import 'dart:math';
//
// import 'package:fl_chart/fl_chart.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:syncfusion_flutter_maps/maps.dart';
// import 'package:votevoiceconnect/ComplaintReport/ComplaintBarChart.dart';
// import 'package:votevoiceconnect/ComplaintReport/ComplaintDonutChart.dart';
// import 'package:votevoiceconnect/ComplaintReport/ComplaintLineChart.dart';
// import 'package:votevoiceconnect/ComplaintReport/ComplaintPieChart.dart';
// import 'package:votevoiceconnect/ComplaintReport/complaintReport.dart';
// import 'package:votevoiceconnect/Gscheme/gschemeBarChart.dart';
// import 'package:votevoiceconnect/article/articleBarChart.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'package:votevoiceconnect/Blog/blogscreen.dart';
// import 'package:votevoiceconnect/apiServices/api_service.dart';
// import 'package:votevoiceconnect/article/articalscreen.dart';
// import 'package:votevoiceconnect/article/article1.dart';
// import 'package:votevoiceconnect/article/user_model.dart';
// import 'package:votevoiceconnect/ecom/widgets/carousel_slider.dart';
// import 'package:votevoiceconnect/ecom/widgets/video_slider.dart';
// import 'package:votevoiceconnect/event/eventBarChart.dart';
// import 'package:votevoiceconnect/event/events1.dart';
// import 'package:votevoiceconnect/event/eventscreen.dart';
// import 'package:votevoiceconnect/page/gallery/Profile.dart';
// import 'package:votevoiceconnect/page/adsSlider.dart';
// import 'package:votevoiceconnect/page/bottomseach.dart';
// import 'package:votevoiceconnect/youtube/screens/favScreen.dart';
//
// import '../ecom/screens/complaint_screen.dart';
// import 'Complaint/complaint.dart';
//
// void main() {
//   runApp(Dashboard());
// }
//
// class Dashboard extends StatefulWidget {
//   const Dashboard({key}) : super(key: key);
//
//   @override
//   _DashboardState createState() => _DashboardState();
// }
//
//
// class _DashboardState extends State<Dashboard> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       //backgroundColor: Colors.white,
//       //backgroundColor: Color.fromRGBO(0, 0, 0, 0.10),
//       backgroundColor: Colors.red[100],
//
//       body: SingleChildScrollView(
//         child: SafeArea(
//           child: Center(
//             child: Column(
//               children: [
//
//                 carouselSlider(),
//
//                 //
//                 // Padding(
//                 //   padding: const EdgeInsets.only(
//                 //       top: 1.0, bottom: 1, left: 1.0, right: 1.0),
//                 //   child: Container(
//                 //     decoration: BoxDecoration(
//                 //       //borderRadius: BorderRadius.circular(20.0),
//                 //       //color: Color.fromRGBO(0, 0, 0, 0.10),
//                 //       color: Colors.deepOrange,
//                 //     ),
//                 //     child: Padding(
//                 //       padding: const EdgeInsets.all(10.0),
//                 //       child: Row(
//                 //         children: [
//                 //           Icon(
//                 //             Icons.play_circle_fill_outlined,
//                 //             color: Colors.white,
//                 //             size: 25.0,
//                 //           ),
//                 //           Padding(
//                 //             padding: const EdgeInsets.only(left: 5.0),
//                 //             child: Text(
//                 //               'Latest Video'.tr,
//                 //               textAlign: TextAlign.center,
//                 //               style: TextStyle(
//                 //                   color: Colors.white,
//                 //                   fontWeight: FontWeight.bold,
//                 //                   fontSize: 22.0),
//                 //             ),
//                 //           ),
//                 //         ],
//                 //       ),
//                 //     ),
//                 //   ),
//                 // ),
//                 const SizedBox(
//                   height: 0,
//                 ),
//
//                 //VideoSlider(),
//
//
//                 Padding(
//                   padding: const EdgeInsets.all(4.0),
//                   child: Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                       children: <Widget>[
//                         Expanded(
//                           child: Padding(
//                             padding: const EdgeInsets.only(left: 3.0, right: 3.0),
//                             child: Container(
//                               height: 70,
//                               child: ElevatedButton(
//                                 style: ElevatedButton.styleFrom(
//                                   primary: Colors.white,
//                                   onPrimary: Colors.black,
//                                   padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
//                                   textStyle: TextStyle(fontSize: 10, fontWeight: FontWeight.bold),
//                                 ),
//                                 onPressed: () {
//                                   Navigator.push(
//                                     context,
//                                     MaterialPageRoute(builder: (context) => const article1()),
//                                   );
//                                 },
//                                 child: Column(
//                                   mainAxisAlignment: MainAxisAlignment.center,
//                                   children: [
//                                     Icon(
//                                       Icons.newspaper,
//                                     ),
//                                     Text(
//                                       "Articles".tr,
//                                       // Customize text style as needed
//                                     ),
//                                   ],
//                                 ),
//                               ),
//                             ),
//                           ),
//                         ),
//
//                         Expanded(
//                           child: Padding(
//                             padding: const EdgeInsets.only(left: 3.0, right: 3.0),
//                             child: Container(
//                               height: 70,
//                               child: ElevatedButton(
//                                 style: ElevatedButton.styleFrom(
//                                   primary: Colors.white,
//                                   onPrimary: Colors.black,
//                                   padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
//                                   textStyle: TextStyle(fontSize: 10, fontWeight: FontWeight.bold),
//                                 ),
//                                 onPressed: () {
//                                   Navigator.push(
//                                     context,
//                                     MaterialPageRoute(builder: (context) => const events1()),
//                                   );
//                                 },
//                                 child: Column(
//                                   mainAxisAlignment: MainAxisAlignment.center,
//                                   children: [
//                                     Icon(
//                                       Icons.event,
//                                     ),
//                                     Text(
//                                       "Events".tr,
//                                       // Customize text style as needed
//                                     ),
//                                   ],
//                                 ),
//                               ),
//                             ),
//                           ),
//                         ),
//
//                         Expanded(
//                           child: Padding(
//                             padding: const EdgeInsets.only(left: 3.0, right: 3.0),
//                             child: Container(
//                               height: 70,
//                               child: ElevatedButton(
//                                 style: ElevatedButton.styleFrom(
//                                   primary: Colors.white,
//                                   onPrimary: Colors.black,
//                                   padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
//                                   textStyle: TextStyle(fontSize: 10, fontWeight: FontWeight.bold),
//                                 ),
//                                 onPressed: () {
//                                   Navigator.push(
//                                     context,
//                                     MaterialPageRoute(builder: (context) => const article1()),
//                                   );
//                                 },
//                                 child: Column(
//                                   mainAxisAlignment: MainAxisAlignment.center,
//                                   children: [
//                                     Icon(
//                                       Icons.attach_money,
//                                     ),
//                                     Text(
//                                       "Donation".tr,
//                                       // Customize text style as needed
//                                     ),
//                                   ],
//                                 ),
//                               ),
//                             ),
//                           ),
//                         ),
//
//                         Expanded(
//                           child: Padding(
//                             padding: const EdgeInsets.only(left: 3.0, right: 3.0),
//                             child: Container(
//                               height: 70,
//                               child: ElevatedButton(
//                                 style: ElevatedButton.styleFrom(
//                                   primary: Colors.white,
//                                   onPrimary: Colors.black,
//                                   padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
//                                   textStyle: TextStyle(fontSize: 10, fontWeight: FontWeight.bold),
//                                 ),
//                                 onPressed: () {
//                                   Navigator.push(
//                                     context,
//                                     MaterialPageRoute(builder: (context) => const article1()),
//                                   );
//                                 },
//                                 child: Column(
//                                   mainAxisAlignment: MainAxisAlignment.center,
//                                   children: [
//                                     Icon(
//                                       Icons.monetization_on_outlined,
//                                     ),
//                                     Text(
//                                       "Private Donation".tr,
//                                       // Customize text style as needed
//                                     ),
//                                   ],
//                                 ),
//                               ),
//                             ),
//                           ),
//                         ),
//
//                       ]),
//                 ),
//
//
//                 Padding(
//                   padding: const EdgeInsets.all(4.0),
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                     children: <Widget>[
//                       Expanded(
//                         child: Padding(
//                           padding: const EdgeInsets.only(left: 3.0, right: 3.0),
//                           child: Container(
//                             height: 70,
//                             child: ElevatedButton(
//                               style: ElevatedButton.styleFrom(
//                                 primary: Colors.white,
//                                 onPrimary: Colors.black,
//                                 padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
//                                 textStyle: TextStyle(fontSize: 10, fontWeight: FontWeight.bold),
//                               ),
//                               onPressed: () {
//                                 Navigator.push(
//                                   context,
//                                   MaterialPageRoute(builder: (context) => FavScreen()),
//                                 );
//                               },
//                               child: Column(
//                                 mainAxisAlignment: MainAxisAlignment.center,
//                                 children: [
//                                   Icon(
//                                     Icons.video_collection_outlined,
//                                   ),
//                                   Text(
//                                     "Videos".tr,
//                                     // Customize text style as needed
//                                   ),
//                                 ],
//                               ),
//                             ),
//                           ),
//                         ),
//                       ),
//
//                           Expanded(
//                             child: Padding(
//                               padding: const EdgeInsets.only(left: 3.0, right: 3.0),
//                               child: Container(
//                                 height: 70,
//                                 child: ElevatedButton(
//                                   style: ElevatedButton.styleFrom(
//                                     primary: Colors.white,
//                                     onPrimary: Colors.black,
//                                     padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
//                                     textStyle: TextStyle(fontSize: 10, fontWeight: FontWeight.bold),
//                                   ),
//                                   onPressed: () {
//                                     Navigator.push(
//                                       context,
//                                       MaterialPageRoute(builder: (context) => complaintReport()),
//                                     );
//                                   },
//                                   child: Column(
//                                     mainAxisAlignment: MainAxisAlignment.center,
//                                     children: [
//                                       Icon(
//                                         Icons.report_problem_outlined,
//                                       ),
//                                       Text(
//                                         "Complaint".tr,
//                                         // Customize text style as needed
//                                       ),
//                                     ],
//                                   ),
//                                 ),
//                               ),
//                             ),
//                           ),
//
//                       Expanded(
//                         child: Padding(
//                           padding: const EdgeInsets.only(left: 3.0, right: 3.0),
//                           child: Container(
//                             height: 70,
//                             child: ElevatedButton(
//                               style: ElevatedButton.styleFrom(
//                                 primary: Colors.white,
//                                 onPrimary: Colors.black,
//                                 padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
//                                 textStyle: TextStyle(fontSize: 10, fontWeight: FontWeight.bold),
//                               ),
//                               onPressed: () {
//                                 Navigator.push(
//                                   context,
//                                   MaterialPageRoute(builder: (context) => complaintReport()),
//                                 );
//                               },
//                               child: Column(
//                                 mainAxisAlignment: MainAxisAlignment.center,
//                                 children: [
//                                   Icon(
//                                     Icons.browse_gallery_outlined,
//                                   ),
//                                   Text(
//                                     "Gallery".tr,
//                                     // Customize text style as needed
//                                   ),
//                                 ],
//                               ),
//                             ),
//                           ),
//                         ),
//                       ),
//
//                       Expanded(
//                         child: Padding(
//                           padding: const EdgeInsets.only(left: 3.0, right: 3.0),
//                           child: Container(
//                             height: 70,
//                             child: ElevatedButton(
//                               style: ElevatedButton.styleFrom(
//                                 primary: Colors.white,
//                                 onPrimary: Colors.black,
//                                 padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
//                                 textStyle: TextStyle(fontSize: 10, fontWeight: FontWeight.bold),
//                               ),
//                               onPressed: () {
//                                 Navigator.push(
//                                   context,
//                                   MaterialPageRoute(builder: (context) => complaintReport()),
//                                 );
//                               },
//                               child: Column(
//                                 mainAxisAlignment: MainAxisAlignment.center,
//                                 children: [
//                                   Icon(
//                                     Icons.schema_outlined,
//                                   ),
//                                   Text(
//                                     "Govt. Scheme".tr,
//                                     // Customize text style as needed
//                                   ),
//                                 ],
//                               ),
//                             ),
//                           ),
//                         ),
//                       ),
//
//                     ],
//                   ),
//                 ),
//
//
//
//                 const SizedBox(
//                   height: 5,
//                 ),
//                 Container(
//                   decoration: BoxDecoration(
//                     //borderRadius: BorderRadius.circular(20.0),
//                     //color: Color.fromRGBO(0, 0, 0, 0.10),
//                     color: Colors.green,
//                   ),
//                   child: Padding(
//                     padding: const EdgeInsets.all(10.0),
//                     child: Row(
//                       children: [
//                         Icon(
//                           Icons.play_circle_fill_outlined,
//                           color: Colors.white,
//                           size: 25.0,
//                         ),
//                         Padding(
//                           padding: const EdgeInsets.only(left: 5.0),
//                           child: Text(
//                             'About Vote Voice Connect'.tr,
//                             textAlign: TextAlign.center,
//                             style: TextStyle(
//                                 color: Colors.white,
//                                 fontWeight: FontWeight.bold,
//                                 fontSize: 22.0),
//                           ),
//                         ),
//
//                       ],
//                     ),
//                   ),
//                 ),
//
//                 const SizedBox(
//                   height: 5,
//                 ),
//
//                 Row(
//                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                   children: [
//                     Container(
//                       height: 100,
//                       width: 130,
//                       child: ComplaintBarChart(),
//                     ),
//                     Container(
//                       height: 100,
//                       width: 130,
//                       child: ComplaintLineChart(),
//                     ),
//                     Container(
//                       height: 100,
//                       width: 130,
//                       child: ComplaintDonutChart(),
//                     ),
//                   ],
//                 ),
//
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                   children: [
//                     Container(
//                       height: 100,
//                       width: 130,
//                       child: ArticleBarChart(),
//                     ),
//                     Container(
//                       height: 100,
//                       width: 130,
//                       child: EventBarChart(),
//                     ),
//                     Container(
//                       height: 100,
//                       width: 130,
//                       child: GschemeBarChart(),
//                     ),
//                   ],
//                 ),
//
//                 Container(
//                   height: 180,
//                   width: 400,
//                   child: ComplaintPieChart(),
//                 ),
//
//                 Container(
//                   height: 220,
//                   width: 400,
//                   child: Padding(
//                       padding: const EdgeInsets.all(10.0),
//                       child: SfMaps(
//                         layers: [
//                           MapTileLayer(
//                             urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
//                             initialFocalLatLng: MapLatLng(20, 76),
//
//                             initialZoomLevel: 3,
//                           )
//                         ],
//                       )),
//
//                 ),
//
//
//
//                 Container(
//                   height: 230,
//                   width: 400,
//                   child: BlogScreen(),
//                 ),
//
//                 Row(
//                   children: <Widget>[
//                     Flexible(
//                       flex: 1,
//                       fit: FlexFit.tight,
//                       child: Padding(
//                         padding: const EdgeInsets.all(8.0),
//                         child: ElevatedButton.icon(
//                           style: ElevatedButton.styleFrom(
//                             primary: Colors.deepOrange,
//                             onPrimary: Colors.white,
//                             padding: EdgeInsets.symmetric(
//                                 horizontal: 20, vertical: 10),
//                             textStyle: TextStyle(
//                                 fontSize: 20, fontWeight: FontWeight.bold),
//                           ),
//                           onPressed: () {
//                             Navigator.push(
//                               context,
//                               MaterialPageRoute(
//                                   builder: (context) => Profile()),
//                             );
//                           },
//
//                           label: Text("Vote Voice Connect Fellowship".tr),
//                           icon: Icon(
//                             Icons.add_box,
//                           ),
//                           //.........
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
