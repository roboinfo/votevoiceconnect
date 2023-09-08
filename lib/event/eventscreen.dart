import 'package:flutter/material.dart';
import 'package:votevoiceconnect/apiServices/api_service.dart';
import 'package:votevoiceconnect/event/user_model.dart';
import 'package:votevoiceconnect/page/donationscreen.dart';
import 'package:votevoiceconnect/event/events1.dart';
import 'package:votevoiceconnect/page/mainslider.dart';
import 'package:votevoiceconnect/page/storyviewpage.dart';
import 'package:votevoiceconnect/page/utility/story_circle.dart';
import 'package:votevoiceconnect/page/utility/story_circle2.dart';
import 'package:votevoiceconnect/page/utility/story_circle3.dart';
import 'package:votevoiceconnect/page/utility/story_circle4.dart';
import 'package:votevoiceconnect/page/utility/story_circle5.dart';
import 'package:votevoiceconnect/page/utility/story_circle6.dart';

import '../page/adsscreen.dart';

// class EventScreen extends StatefulWidget {
//   const EventScreen({Key? key}) : super(key: key);
//
//   @override
//   State<EventScreen> createState() => _EventScreenState();
// }
//
// class _EventScreenState extends State<EventScreen> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       //backgroundColor: Colors.white,
//       backgroundColor: Color.fromRGBO(0, 0, 0, 0.10),
//
//       // appBar: AppBar(
//       //   backgroundColor: Colors.white70,
//       //   title: Row(
//       //     children: [
//       //       Icon(Icons.event,
//       //         color: Colors.deepPurple,
//       //         size: 30.0,
//       //       ),
//       //       const Text(
//       //         '                     Events',
//       //         textAlign: TextAlign.center,
//       //         style: TextStyle(color: Colors.black45,
//       //             fontWeight: FontWeight.bold,
//       //             fontSize: 22.0),
//       //       ),
//       //     ],
//       //   ),
//       // ),
//
//       extendBody: true,
//
//       body: SingleChildScrollView(
//         child: GestureDetector(
//           // onTap: (){
//           //   Navigator.push(
//           //       context,
//           //       MaterialPageRoute(builder: (context) =>  StoryViewPage()));
//           // },
//           child: Column(
//             children: [
//               const SizedBox(
//                 height: 5,
//               ),
//               // Container(
//               //   padding: EdgeInsets.symmetric(horizontal: 0.0),
//               //   height: 95,
//               //   child: ListView(
//               //     scrollDirection: Axis.horizontal,
//               //     children: [
//               //
//               //       StoryCircle(text: '',),
//               //       StoryCircle2(text: '',),
//               //      // StoryCircle3(text: '',),
//               //       StoryCircle4(text: '',),
//               //       StoryCircle5(text: '',),
//               //       StoryCircle6(text: '',),
//               //     ],
//               //
//               //   ),
//               // ),
//               //
//               // Container(
//               //   decoration: BoxDecoration(
//               //     borderRadius: BorderRadius.circular(20.0),
//               //     color: Color.fromRGBO(0, 0, 0, 0.10),
//               //   ),
//               //   child: Row(
//               //       children: [
//               //     Padding(
//               //       padding: const EdgeInsets.all(8.0),
//               //       child: Row(
//               //         children: [
//               //           Icon(Icons.amp_stories_outlined,
//               //             color: Colors.deepPurple,
//               //             size: 30.0,
//               //           ),
//               //           Text(
//               //             '                   Stories',
//               //             textAlign: TextAlign.center,
//               //             style: TextStyle(color: Colors.black45,
//               //                 fontWeight: FontWeight.bold,
//               //                 fontSize: 22.0),
//               //           ),
//               //         ],
//               //       ),
//               //     ),
//               // ],
//               //   ),
//               // ),
//               //
//               // const SizedBox(height: 5,),
//               //
//               // new GestureDetector(
//               //     onTap: (){
//               //       Navigator.push(context, MaterialPageRoute(builder: (context)=> AdsScreen()));
//               //     },
//               //     child: Padding(
//               //       padding: const EdgeInsets.only(top: 0,right: 20,left: 20),
//               //       child: Row(
//               //         children: [
//               //           new Container(
//               //             constraints: BoxConstraints(maxWidth: MediaQuery.of(context).size.width*0.8),
//               //             decoration: BoxDecoration(
//               //                 color: Colors.black12,
//               //                 boxShadow: [
//               //                   BoxShadow(
//               //                       color: Colors.blue.withOpacity(0.5),
//               //                       spreadRadius: 2,
//               //                       blurRadius: 5
//               //
//               //                   )
//               //                 ]
//               //             ),
//               //             width: 150,
//               //             height: 150,
//               //             padding: EdgeInsets.all(10),
//               //             alignment: AlignmentDirectional.center,
//               //             child: new Column(
//               //                 children: [
//               //                   new Text("Merchandise",textAlign: TextAlign.center,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20,color: Colors.black),
//               //                   ),
//               //                   SizedBox(height: 10,),
//               //                   new Text("Explore the unique collection ",textAlign: TextAlign.center,style: TextStyle(color: Colors.black),),
//               //                   SizedBox(height: 20,),
//               //                   new Text("Explore",textAlign: TextAlign.center,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20,color: Colors.black),),
//               //                 ]
//               //             ),
//               //           ),
//               //           Spacer(flex: 2,),
//               //
//               //           GestureDetector(
//               //             onTap: (){
//               //               Navigator.push(context, MaterialPageRoute(builder: (context)=> DonationScreen()));
//               //             },
//               //
//               //             child: new Container(
//               //               constraints: BoxConstraints(
//               //                 maxWidth: MediaQuery.of(context).size.width * 0.80,
//               //               ),
//               //               margin: EdgeInsets.symmetric(vertical: 1),
//               //               decoration: BoxDecoration(
//               //                 color: Colors.black12,
//               //                 boxShadow: [
//               //                   BoxShadow(
//               //                     color: Colors.blue.withOpacity(0.5),
//               //                     spreadRadius: 2,
//               //                     blurRadius: 5,
//               //                   ),
//               //                 ],
//               //               ),
//               //               width: 150,
//               //               height: 150,
//               //               padding: EdgeInsets.all(10),
//               //               alignment: AlignmentDirectional.center,
//               //               // color: Colors.blueAccent,
//               //               child: new Column(
//               //                   children: [
//               //                     new Text("Donation💰",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20,color: Colors.black),
//               //                     ),
//               //                     SizedBox(height: 10,),
//               //                     new Text("Support to the party throughMicro-donation ",style: TextStyle(color: Colors.black),),
//               //                     SizedBox(height: 10,),
//               //                     new Text("Donation",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20,color: Colors.black),),
//               //                   ]
//               //               ),
//               //             ),
//               //           ),
//               //         ],
//               //       ),
//               //     ),
//               // ),
//               //
//               //
//               //
//               // Container(
//               //   decoration: BoxDecoration(
//               //     //borderRadius: BorderRadius.circular(20.0),
//               //     color: Colors.white,
//               //     //color: Color.fromRGBO(0, 0, 0, 0.10),
//               //
//               //   ),
//               //   child: Row(
//               //     children: [
//               //       Padding(
//               //         padding: const EdgeInsets.all(8.0),
//               //         child: Row(
//               //           children: [
//               //             Icon(
//               //               Icons.article_outlined,
//               //               color: Colors.deepPurple,
//               //               size: 30.0,
//               //             ),
//               //             Text(
//               //               '             Events/Articles          1/2',
//               //               textAlign: TextAlign.center,
//               //               style: TextStyle(
//               //                   color: Colors.black45,
//               //                   fontWeight: FontWeight.bold,
//               //                   fontSize: 22.0),
//               //             ),
//               //           ],
//               //         ),
//               //       ),
//               //     ],
//               //   ),
//               // ),
//
//
//               const SizedBox(
//                 height: 5,
//               ),
//
//
//
//               GestureDetector(
//                 onTap: () {
//                   Navigator.push(
//                       context,
//                       MaterialPageRoute(builder: (context) =>events1()));
//                 },
//                 child: Container(
//                   color: Colors.white,
//                   child: Column(
//                     children: [
//                       Container(
//                         padding: const EdgeInsets.only(top: 5.0),
//                         child: Image.asset(
//                           "assets/artical4.png",
//                           // height: 250,
//                           width: double.infinity,
//                         ),
//                       ),
//                       Row(
//                         children: const <Widget>[
//                           Flexible(
//                             flex: 1,
//                             fit: FlexFit.tight,
//                             child: Text(
//                               '\n PM Modi Live | '
//                               '\n PM Modis Mann Ki Baat Live | '
//                               '\n Narendra Modis Address To The Nation |',
//                               textAlign: TextAlign.center,
//                               style: TextStyle(
//                                   color: Colors.black45,
//                                   fontWeight: FontWeight.bold,
//                                   fontSize: 17.0),
//                             ),
//                           ),
//                         ],
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//
//
//               const SizedBox(
//                 height: 5,
//               ),
//
//               GestureDetector(
//                 onTap: () {
//                   Navigator.push(
//                       context,
//                       MaterialPageRoute(builder: (context) =>events1()));
//                 },
//                 child: Container(
//                   color: Colors.white,
//                   child: Column(
//                     children: [
//                       Container(
//                         padding: const EdgeInsets.only(top: 5.0),
//                         child: Image.asset(
//                           "assets/artical5.png",
//                           // height: 250,
//                           width: double.infinity,
//                         ),
//                       ),
//                       Row(
//                         children: const <Widget>[
//                           Flexible(
//                             flex: 1,
//                             fit: FlexFit.tight,
//                             child: Text(
//                               '\nElections 2022: '
//                                   '\nAssembly Election 2022 Dates, |'
//                                   '\nResults, Opinion polls, | '
//                                   '\nExit polls and News | '
//                                   '\nTimes of India | ',
//                               textAlign: TextAlign.center,
//                               style: TextStyle(
//                                   color: Colors.black45,
//                                   fontWeight: FontWeight.bold,
//                                   fontSize: 17.0),
//                             ),
//                           ),
//                         ],
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//
//
//               const SizedBox(
//                 height: 5,
//               ),
//
//
//
//               GestureDetector(
//                 onTap: () {
//                   Navigator.push(
//                       context,
//                       MaterialPageRoute(builder: (context) =>events1()));
//                 },
//                 child: Container(
//                   color: Colors.white,
//                   child: Column(
//                     children: [
//                       Container(
//                         padding: const EdgeInsets.only(top: 5.0),
//                         child: Image.asset(
//                           "assets/artical3.png",
//                           // height: 250,
//                           width: double.infinity,
//                         ),
//                       ),
//                       Row(
//                         children: const <Widget>[
//                           Flexible(
//                             flex: 1,
//                             fit: FlexFit.tight,
//                             child: Text(
//                               '\nElections 2023: '
//                                   '\nAssembly Election 2022 Dates, |'
//                                   '\nExit polls and News | '
//                                   '\nTimes of India | ',
//                               textAlign: TextAlign.center,
//                               style: TextStyle(
//                                   color: Colors.black45,
//                                   fontWeight: FontWeight.bold,
//                                   fontSize: 17.0),
//                             ),
//                           ),
//                         ],
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//
//
//
//
//
//               const SizedBox(
//                 height: 5,
//               ),
//
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

class EventScreen extends StatefulWidget {
  const EventScreen({Key? key}) : super(key: key);

  @override
  _EventScreenState createState() => _EventScreenState();
}

class _EventScreenState extends State<EventScreen> {
  late List<Event>? _eventModel = [];

  @override
  void initState() {
    super.initState();
    _getData();
  }

  void _getData() async {
    _eventModel = (await ApiServiceEvent().getEvent())!;
    Future.delayed(const Duration(seconds: 1)).then((value) => setState(() {}));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(0, 0, 0, 0.10),
      body: _eventModel == null || _eventModel!.isEmpty
          ? const Center(
        child: CircularProgressIndicator(),
      )
          : ListView.builder(
        itemCount: _eventModel!.length,
        itemBuilder: (context, index) {
          return Card(
            child: Column(
              children: [

                // Row(
                //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                //   children: [
                //     // Text(_userModel![index].id.toString()),
                //     Text(_articleModel![index].title.toString()),
                //   ],
                // ),

                Container(
                  padding: const EdgeInsets.only(top: 5.0),
                  child: Image.network(
                      _eventModel![index].featuredImageUrl.toString()),

                ),

                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    padding: const EdgeInsets.only(top: 5.0),
                    child: Text(
                      _eventModel![index].title.toString(),
                      textAlign: TextAlign.start,
                      style: TextStyle(fontSize: 17,fontWeight: FontWeight.bold),),

                  ),
                ),

                Row(

                  children: [
                    // Text(_userModel![index].id.toString()),


                    Flexible(
                      flex: 1,
                      fit: FlexFit.tight,
                      child: Text(_eventModel![index].details.toString(),
                        textAlign: TextAlign.justify,
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 12.0),
                      ),
                    ),
                  ],
                ),


              ],
            ),
          );
        },
      ),
    );
  }
}
