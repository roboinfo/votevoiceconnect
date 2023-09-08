import 'package:flutter/material.dart';
import 'package:votevoiceconnect/apiServices/api_service.dart';
import 'package:votevoiceconnect/Blog/user_model.dart';
import 'package:votevoiceconnect/article/user_model.dart';
import 'package:votevoiceconnect/article/user_model.dart';
import 'package:votevoiceconnect/article/user_model.dart';
import 'package:votevoiceconnect/article/user_model.dart';

import 'package:votevoiceconnect/page/donationscreen.dart';
import 'package:votevoiceconnect/page/mainslider.dart';

import '../ecom/widgets/carousel_slider.dart';
import 'article1.dart';

// class ArticalScreen extends StatefulWidget {
//   const ArticalScreen({Key? key}) : super(key: key);
//
//   @override
//   State<ArticalScreen> createState() => _ArticalScreenState();
// }
//
// class _ArticalScreenState extends State<ArticalScreen> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       //backgroundColor: Colors.grey,
//       backgroundColor: Color.fromRGBO(0, 0, 0, 0.10),
//       // appBar: AppBar(
//       //   backgroundColor: Colors.white70,
//       //   title: Row(
//       //     children: [
//       //       Icon(Icons.article_outlined,
//       //         color: Colors.deepPurple,
//       //         size: 30.0,
//       //       ),
//       //       const Text(
//       //         '               Articles          ',
//       //         textAlign: TextAlign.center,
//       //         style: TextStyle(color: Colors.black45,
//       //             fontWeight: FontWeight.bold,
//       //             fontSize: 22.0),
//       //       ),
//       //     ],
//       //   ),
//       // ),
//
//       body: ListView(
//         children: [
//           const SizedBox(
//             height: 5,
//           ),
//
//           GestureDetector(
//             onTap: () {
//               Navigator.push(
//                   context, MaterialPageRoute(builder: (context) => article1()));
//             },
//             child: Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 0.0),
//               child: Container(
//                 padding: const EdgeInsets.only(top: 5.0, bottom: 5.0),
//                 decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(0.0),
//                   //color: Color.fromRGBO(0, 0, 0, 0.10),
//                   color: Colors.white,
//                 ),
//                 child: MainSlider(),
//               ),
//             ),
//           ),
//
//           const SizedBox(
//             height: 5,
//           ),
//
//           GestureDetector(
//             onTap: () {
//               Navigator.push(
//                   context, MaterialPageRoute(builder: (context) => article1()));
//             },
//             child: Container(
//               decoration: BoxDecoration(
//                 // borderRadius: BorderRadius.circular(20.0),
//                 //color: Color.fromRGBO(0, 0, 0, 0.10),
//                 color: Colors.white,
//               ),
//               child: Row(
//                 children: [
//                   Container(
//                     alignment: Alignment.centerLeft,
//                     child: Image.asset(
//                       'assets/a1.png',
//                       height: 80,
//                     ),
//                   ),
//                   Padding(
//                     padding: const EdgeInsets.symmetric(vertical: 0.0),
//                     child: Container(
//                       padding: const EdgeInsets.all(4),
//                       decoration: const BoxDecoration(
//                         color: Colors.white,
//                       ),
//                     ),
//                   ),
//
//                   Flexible(
//                     flex: 1,
//                     fit: FlexFit.tight,
//                     child: RichText(
//                       text: TextSpan(
//                         text:
//                             'PM Modi tops approval ratings among list of 13 global leader ..\n',
//                         style: TextStyle(
//                           color: Colors.black54,
//                           fontWeight: FontWeight.bold,
//                           fontSize: 15.0,
//                         ),
//                         children: [
//                           TextSpan(
//                             text:
//                                 'NEW DELHI: Prime Minister Narendra Modi remains the world’s ..........',
//                             style: TextStyle(
//                               color: Colors.black38,
//                               fontWeight: FontWeight.bold,
//                               fontSize: 12.0,
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ),
//                   //Icon(Icons.expand_more_outlined,),
//                 ],
//               ),
//             ),
//           ),
//
//           const SizedBox(
//             height: 5,
//           ),
//
//           GestureDetector(
//             onTap: () {
//               Navigator.push(
//                   context, MaterialPageRoute(builder: (context) => article1()));
//             },
//             child: Container(
//               decoration: BoxDecoration(
//                 // borderRadius: BorderRadius.circular(20.0),
//                 //color: Color.fromRGBO(0, 0, 0, 0.10),
//                 color: Colors.white,
//               ),
//               child: Row(
//                 children: [
//                   Container(
//                     alignment: Alignment.centerLeft,
//                     child: Image.asset(
//                       'assets/a2.png',
//                       height: 80,
//                     ),
//                   ),
//                   Padding(
//                     padding: const EdgeInsets.symmetric(vertical: 0.0),
//                     child: Container(
//                       padding: const EdgeInsets.all(4),
//                       decoration: const BoxDecoration(
//                         color: Colors.white,
//                       ),
//                     ),
//                   ),
//                   Flexible(
//                     flex: 1,
//                     fit: FlexFit.tight,
//                     child: RichText(
//                       text: TextSpan(
//                         text:
//                             'India’s dependence on Russian weapons tethers PM Modi to Pre ..\n',
//                         style: TextStyle(
//                           color: Colors.black54,
//                           fontWeight: FontWeight.bold,
//                           fontSize: 15.0,
//                         ),
//                         children: [
//                           TextSpan(
//                             text:
//                                 'For all the success of the US-led campaign to isolate Russia ..',
//                             style: TextStyle(
//                               color: Colors.black38,
//                               fontWeight: FontWeight.bold,
//                               fontSize: 12.0,
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ),
//                   Icon(
//                     Icons.expand_more_outlined,
//                   ),
//                 ],
//               ),
//             ),
//           ),
//
//           const SizedBox(
//             height: 5,
//           ),
//
//           GestureDetector(
//             onTap: () {
//               Navigator.push(
//                   context, MaterialPageRoute(builder: (context) => article1()));
//             },
//             child: Container(
//               decoration: BoxDecoration(
//                 // borderRadius: BorderRadius.circular(20.0),
//                 //color: Color.fromRGBO(0, 0, 0, 0.10),
//                 color: Colors.white,
//               ),
//               child: Row(
//                 children: [
//                   Container(
//                     alignment: Alignment.centerLeft,
//                     child: Image.asset(
//                       'assets/a3.png',
//                       height: 80,
//                     ),
//                   ),
//                   Padding(
//                     padding: const EdgeInsets.symmetric(vertical: 0.0),
//                     child: Container(
//                       padding: const EdgeInsets.all(4),
//                       decoration: const BoxDecoration(
//                         color: Colors.white,
//                       ),
//                     ),
//                   ),
//                   Flexible(
//                     flex: 1,
//                     fit: FlexFit.tight,
//                     child: RichText(
//                       text: TextSpan(
//                         text: 'PM Modi Pune Visit Live Updates:\n',
//                         style: TextStyle(
//                           color: Colors.black54,
//                           fontWeight: FontWeight.bold,
//                           fontSize: 15.0,
//                         ),
//                         children: [
//                           TextSpan(
//                             text:
//                                 'NPM @narendramodi praying to Sant Tukaram Ji in Pune. The ideals of Sant Tukaram motivate several people. ..........',
//                             style: TextStyle(
//                               color: Colors.black38,
//                               fontWeight: FontWeight.bold,
//                               fontSize: 12.0,
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ),
//                   Icon(
//                     Icons.expand_more_outlined,
//                   ),
//                 ],
//               ),
//             ),
//           ),
//
//           const SizedBox(
//             height: 5,
//           ),
//
//           // Padding(
//           //   padding: const EdgeInsets.symmetric(horizontal: 0.0),
//           //   child: Container(
//           //     padding: const EdgeInsets.all(5),
//           //     decoration: const BoxDecoration(color: Colors.white,
//           //     ),
//           //   ),
//           // ),
//
//           GestureDetector(
//             onTap: () {
//               Navigator.push(
//                   context, MaterialPageRoute(builder: (context) => article1()));
//             },
//             child: Container(
//               decoration: BoxDecoration(
//                 // borderRadius: BorderRadius.circular(20.0),
//                 //color: Color.fromRGBO(0, 0, 0, 0.10),
//                 color: Colors.white,
//               ),
//               child: Row(
//                 children: [
//                   Container(
//                     alignment: Alignment.centerLeft,
//                     child: Image.asset(
//                       'assets/a4.png',
//                       height: 80,
//                     ),
//                   ),
//                   Padding(
//                     padding: const EdgeInsets.symmetric(vertical: 0.0),
//                     child: Container(
//                       padding: const EdgeInsets.all(4),
//                       decoration: const BoxDecoration(
//                         color: Colors.white,
//                       ),
//                     ),
//                   ),
//                   Flexible(
//                     flex: 1,
//                     fit: FlexFit.tight,
//                     child: RichText(
//                       text: TextSpan(
//                         text:
//                             'PM Modi tops approval ratings among list of 13 global leader ..\n',
//                         style: TextStyle(
//                           color: Colors.black54,
//                           fontWeight: FontWeight.bold,
//                           fontSize: 15.0,
//                         ),
//                         children: [
//                           TextSpan(
//                             text:
//                                 'NEW DELHI: Prime Minister Narendra Modi remains the world’s ..........',
//                             style: TextStyle(
//                               color: Colors.black38,
//                               fontWeight: FontWeight.bold,
//                               fontSize: 12.0,
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ),
//                   Icon(
//                     Icons.expand_more_outlined,
//                   ),
//                 ],
//               ),
//             ),
//           ),
//
//           const SizedBox(
//             height: 5,
//           ),
//
//           // Padding(
//           //   padding: const EdgeInsets.symmetric(horizontal: 0.0),
//           //   child: Container(
//           //     padding: const EdgeInsets.all(5),
//           //     decoration: const BoxDecoration(color: Colors.white,
//           //     ),
//           //   ),
//           // ),
//
//           GestureDetector(
//             onTap: () {
//               Navigator.push(
//                   context, MaterialPageRoute(builder: (context) => article1()));
//             },
//             child: Container(
//               decoration: BoxDecoration(
//                 // borderRadius: BorderRadius.circular(20.0),
//                 //color: Color.fromRGBO(0, 0, 0, 0.10),
//                 color: Colors.white,
//               ),
//               child: Row(
//                 children: [
//                   Container(
//                     alignment: Alignment.centerLeft,
//                     child: Image.asset(
//                       'assets/a5.png',
//                       height: 80,
//                     ),
//                   ),
//                   Padding(
//                     padding: const EdgeInsets.symmetric(vertical: 0.0),
//                     child: Container(
//                       padding: const EdgeInsets.all(4),
//                       decoration: const BoxDecoration(
//                         color: Colors.white,
//                       ),
//                     ),
//                   ),
//                   Flexible(
//                     flex: 1,
//                     fit: FlexFit.tight,
//                     child: RichText(
//                       text: TextSpan(
//                         text: 'PM Modi Pune Visit Live Updates:.\n',
//                         style: TextStyle(
//                           color: Colors.black54,
//                           fontWeight: FontWeight.bold,
//                           fontSize: 15.0,
//                         ),
//                         children: [
//                           TextSpan(
//                             text:
//                                 'PM Modi is followed by Mexico president López Obrador with 66% approval rating. US President Joe Biden is not in the list of the top 5 ...',
//                             style: TextStyle(
//                               color: Colors.black38,
//                               fontWeight: FontWeight.bold,
//                               fontSize: 12.0,
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ),
//                   Icon(
//                     Icons.expand_more_outlined,
//                   ),
//                 ],
//               ),
//             ),
//           ),
//
//           const SizedBox(
//             height: 5,
//           ),
//
//           // Padding(
//           //   padding: const EdgeInsets.symmetric(horizontal: 0.0),
//           //   child: Container(
//           //     padding: const EdgeInsets.all(5),
//           //     decoration: const BoxDecoration(color: Colors.white,
//           //     ),
//           //   ),
//           // ),
//
//           GestureDetector(
//             onTap: () {
//               Navigator.push(
//                   context, MaterialPageRoute(builder: (context) => article1()));
//             },
//             child: Container(
//               decoration: BoxDecoration(
//                 // borderRadius: BorderRadius.circular(20.0),
//                 //color: Color.fromRGBO(0, 0, 0, 0.10),
//                 color: Colors.white,
//               ),
//               child: Row(
//                 children: [
//                   Container(
//                     alignment: Alignment.centerLeft,
//                     child: Image.asset(
//                       'assets/artical4.png',
//                       height: 80,
//                     ),
//                   ),
//                   Padding(
//                     padding: const EdgeInsets.symmetric(vertical: 0.0),
//                     child: Container(
//                       padding: const EdgeInsets.all(4),
//                       decoration: const BoxDecoration(
//                         color: Colors.white,
//                       ),
//                     ),
//                   ),
//                   Flexible(
//                     flex: 1,
//                     fit: FlexFit.tight,
//                     child: RichText(
//                       text: TextSpan(
//                         text: 'PM Modi Pune Visit Live Updates:.\n',
//                         style: TextStyle(
//                           color: Colors.black54,
//                           fontWeight: FontWeight.bold,
//                           fontSize: 15.0,
//                         ),
//                         children: [
//                           TextSpan(
//                             text:
//                                 'PM Modi is followed by Mexico president López Obrador with 66% approval rating. US President Joe Biden is not in the list of the top 5 ...',
//                             style: TextStyle(
//                               color: Colors.black38,
//                               fontWeight: FontWeight.bold,
//                               fontSize: 12.0,
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ),
//                   Icon(
//                     Icons.expand_more_outlined,
//                   ),
//                 ],
//               ),
//             ),
//           ),
//
//           const SizedBox(
//             height: 5,
//           ),
//
//           GestureDetector(
//             onTap: () {
//               Navigator.push(
//                   context, MaterialPageRoute(builder: (context) => article1()));
//             },
//             child: Container(
//               decoration: BoxDecoration(
//                 // borderRadius: BorderRadius.circular(20.0),
//                 //color: Color.fromRGBO(0, 0, 0, 0.10),
//                 color: Colors.white,
//               ),
//               child: Row(
//                 children: [
//                   Container(
//                     alignment: Alignment.centerLeft,
//                     child: Image.asset(
//                       'assets/n2.png',
//                       height: 80,
//                     ),
//                   ),
//                   Padding(
//                     padding: const EdgeInsets.symmetric(vertical: 0.0),
//                     child: Container(
//                       padding: const EdgeInsets.all(4),
//                       decoration: const BoxDecoration(
//                         color: Colors.white,
//                       ),
//                     ),
//                   ),
//                   Flexible(
//                     flex: 1,
//                     fit: FlexFit.tight,
//                     child: RichText(
//                       text: TextSpan(
//                         text: 'PM Modi Pune Visit Live Updates:.\n',
//                         style: TextStyle(
//                           color: Colors.black54,
//                           fontWeight: FontWeight.bold,
//                           fontSize: 15.0,
//                         ),
//                         children: [
//                           TextSpan(
//                             text:
//                                 'PM Modi is followed by Mexico president López Obrador with 66% approval rating. US President Joe Biden is not in the list of the top 5 ...',
//                             style: TextStyle(
//                               color: Colors.black38,
//                               fontWeight: FontWeight.bold,
//                               fontSize: 12.0,
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ),
//                   Icon(
//                     Icons.expand_more_outlined,
//                   ),
//                 ],
//               ),
//             ),
//           ),
//
//           const SizedBox(
//             height: 5,
//           ),
//         ],
//       ),
//     );
//   }
// }

class ArticalScreen extends StatefulWidget {
  const ArticalScreen({Key? key}) : super(key: key);

  @override
  _ArticalScreenState createState() => _ArticalScreenState();
}

class _ArticalScreenState extends State<ArticalScreen> {
  late List<Article>? _articleModel = [];

  @override
  void initState() {
    super.initState();
    _getData();
  }

  void _getData() async {
    _articleModel = (await ApiServiceArticle().getArticle())!;
    Future.delayed(const Duration(seconds: 1)).then((value) => setState(() {}));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(0, 0, 0, 0.10),
      body: Column(
        children: <Widget>[

          GestureDetector(
            onTap: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => article1()));
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 0.0),
              child: Container(
                padding: const EdgeInsets.only(top: 5.0, bottom: 5.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(0.0),
                  //color: Color.fromRGBO(0, 0, 0, 0.10),
                  color: Colors.white,
                ),
                child: carouselSlider(),
              ),
            ),
          ),

          const SizedBox(
            height: 4,
          ),

          Expanded(
            child: _articleModel == null || _articleModel!.isEmpty
              ? const Center(
                  child: CircularProgressIndicator()
                )
              : ListView.builder(
                  itemCount: _articleModel!.length,
                  itemBuilder: (context, index) {
                    return Card(
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(4.0),
                            child:
                              // Row(
                              //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              //   children: [
                              //     // Text(_userModel![index].id.toString()),
                              //     Text(_articleModel![index].title.toString()),
                              //   ],
                              // ),

                              GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => article1()));
                                },
                                child: Row(
                                  children: [
                                    Container(
                                      alignment: Alignment.centerLeft,
                                      child: Image.network(_articleModel![index]
                                          .featuredImageUrl
                                          .toString()),

                                      width: 100,
                                    ),
                                    // Padding(
                                    //   padding:
                                    //       const EdgeInsets.symmetric(vertical: 0.0),
                                    //   child: Container(
                                    //     padding: const EdgeInsets.all(4),
                                    //     decoration: const BoxDecoration(
                                    //       color: Colors.white,
                                    //     ),
                                    //   ),
                                    // ),

                                    Flexible(
                                      flex: 1,
                                      fit: FlexFit.tight,
                                      child: Padding(
                                        padding: const EdgeInsets.all(6.0),
                                        child: Text(
                                            _articleModel![index].title.toString(),
                                        textAlign: TextAlign.start,
                                          style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                    ),
                                    //Icon(Icons.expand_more_outlined,),
                                  ],
                                ),
                              ),

                          ),
                        ],
                      ),
                    );
                  },
                ),),
        ],
      ),
    );
  }
}

