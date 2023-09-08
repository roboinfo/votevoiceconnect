import 'package:flutter/material.dart';
import 'package:votevoiceconnect/Gscheme/gscheme.dart';
import 'package:votevoiceconnect/Gscheme/gschemeList.dart';
import 'package:votevoiceconnect/ecom/widgets/carousel_slider.dart';
import 'package:votevoiceconnect/page/home2.dart';
import 'package:votevoiceconnect/page/mainslider.dart';
import 'package:votevoiceconnect/Gscheme/scheme1.dart';

class BSearch extends StatefulWidget {
  const BSearch({Key? key}) : super(key: key);

  @override
  State<BSearch> createState() => _BSearchState();
}

class _BSearchState extends State<BSearch> {
  final TextEditingController _textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(0, 0, 0, 0.10),
      appBar: AppBar(
        title: const Text('Vote Voice Connect'),
        backgroundColor: Color.fromARGB(255, 90, 90, 90),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop();
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => home2()),
            );
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(9.0),
              child: Container(
                width: 600,
                decoration: BoxDecoration(
                    //color: Color.fromRGBO(0, 0, 0, 0.10),
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15)),
                child: TextField(
                  controller: _textEditingController,
                  decoration: const InputDecoration(
                    icon: Icon(
                      Icons.search,
                      color: Colors.black,
                    ),
                    border: InputBorder.none,
                    enabledBorder: InputBorder.none,
                    errorBorder: InputBorder.none,
                    focusedBorder: InputBorder.none,
                    contentPadding: EdgeInsets.all(15),
                    hintText: "Type Here To Search",
                    hintStyle: TextStyle(color: Colors.black),
                  ),
                ),
              ),
            ),
            // Spacer(flex: 50,),

            Padding(
              padding: const EdgeInsets.only(
                  top: 5.0, bottom: 5.0, left: 5.0, right: 5.0),
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 10.0,
                    ),
                    child: Container(
                      alignment: Alignment.bottomLeft,
                      child: const Text(
                        'YOU MIGHT ALSO LIKE ',
                        style: TextStyle(
                          color: Colors.black45,
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 0.0),
              child: Container(
                padding: const EdgeInsets.only(top: 5.0, bottom: 5.0),
                decoration: BoxDecoration(
                  //borderRadius: BorderRadius.circular(0.0),
                  //color: Color.fromRGBO(0, 0, 0, 0.10),
                  color: Colors.white,
                ),
                child: carouselSlider(),
              ),
            ),

            const SizedBox(
              height: 5,
            ),

            Container(
              decoration: BoxDecoration(
                //borderRadius: BorderRadius.circular(20.0),
                //color: Color.fromRGBO(0, 0, 0, 0.10),
                color: Colors.white,
              ),
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Icon(
                          Icons.amp_stories_outlined,
                          color: Colors.deepPurple,
                          size: 30.0,
                        ),
                        Text(
                          '      Government schemes 2021',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Colors.black45,
                              fontWeight: FontWeight.bold,
                              fontSize: 22.0),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(
              height: 5,
            ),

            Container(height: 270,width: 500,
              child: GscemeScreen(),
            ),

            // SingleChildScrollView(
            //   scrollDirection: Axis.horizontal,
            //   child: GestureDetector(
            //     onTap: () {
            //       Navigator.push(
            //           context, MaterialPageRoute(builder: (context) => scheme1()));
            //     },
            //     child: Container(
            //       padding: const EdgeInsets.only(top: 5.0, bottom: 10),
            //       decoration: BoxDecoration(
            //         //borderRadius: BorderRadius.circular(5),
            //         //color: Color.fromRGBO(0, 0, 0, 0.10),
            //         color: Colors.white,
            //       ),
            //       child: Row(
            //         mainAxisAlignment: MainAxisAlignment.spaceAround,
            //         children: <Widget>[
            //           Column(
            //             children: [
            //               Container(
            //                 width: 150,
            //                 height: 150,
            //                 padding: const EdgeInsets.all(6),
            //                 child: Image.asset(
            //                   'assets/scheme1.png',
            //                   fit: BoxFit.cover,
            //                 ),
            //               ),
            //               const Text(
            //                 'Pradhan Mantri Jan Dhan Yojana',
            //                 style: TextStyle(
            //                   color: Colors.black,
            //                   fontSize: 14,
            //                   fontWeight: FontWeight.bold,
            //                 ),
            //               ),
            //             ],
            //           ),
            //           Column(
            //             children: [
            //               Container(
            //                 width: 150,
            //                 height: 150,
            //                 padding: const EdgeInsets.all(6),
            //                 child: Image.asset(
            //                   'assets/scheme2.png',
            //                   fit: BoxFit.cover,
            //                 ),
            //               ),
            //               const Text(
            //                 'Atal Pension Yojana',
            //                 style: TextStyle(
            //                   color: Colors.black,
            //                   fontSize: 14,
            //                   fontWeight: FontWeight.bold,
            //                 ),
            //               ),
            //             ],
            //           ),
            //           Column(
            //             children: [
            //               Container(
            //                 width: 150,
            //                 height: 150,
            //                 padding: const EdgeInsets.all(6),
            //                 child: Image.asset(
            //                   'assets/scheme3.png',
            //                   fit: BoxFit.cover,
            //                 ),
            //               ),
            //               const Text(
            //                 'Suraksha Bima Yojana',
            //                 style: TextStyle(
            //                   color: Colors.black,
            //                   fontSize: 14,
            //                   fontWeight: FontWeight.bold,
            //                 ),
            //               ),
            //             ],
            //           ),
            //           Column(
            //             children: [
            //               Container(
            //                 width: 150,
            //                 height: 150,
            //                 padding: const EdgeInsets.all(6),
            //                 child: Image.asset(
            //                   'assets/scheme4.png',
            //                   fit: BoxFit.cover,
            //                 ),
            //               ),
            //               const Text(
            //                 'Gramin Awas Yojana.',
            //                 style: TextStyle(
            //                   color: Colors.black,
            //                   fontSize: 14,
            //                   fontWeight: FontWeight.bold,
            //                 ),
            //               ),
            //             ],
            //           ),
            //         ],
            //       ),
            //     ),
            //   ),
            // ),

            const SizedBox(
              height: 5,
            ),

            GestureDetector(
              onTap: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => scheme1()));
              },
              child: Container(
                child: Padding(
                  padding: const EdgeInsets.only(
                      top: 10.0, left: 5, right: 5, bottom: 10),
                  child: Image.asset('assets/scheme6.png'),
                ),
                decoration: BoxDecoration(
                  // borderRadius: BorderRadius.circular(0.0),
                  //color: Color.fromRGBO(0, 0, 0, 0.10),
                  color: Colors.white,
                ),
              ),
            ),

            const SizedBox(
              height: 5,
            ),

            Container(
              decoration: BoxDecoration(
                //borderRadius: BorderRadius.circular(20.0),
                //color: Color.fromRGBO(0, 0, 0, 0.10),
                color: Colors.white,
              ),
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Icon(
                          Icons.amp_stories_outlined,
                          color: Colors.deepPurple,
                          size: 30.0,
                        ),
                        Text(
                          'Latest Government Scheme in India',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Colors.black45,
                              fontWeight: FontWeight.bold,
                              fontSize: 20.0),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(
              height: 5,
            ),

            Container(height: 300,width: 500,
              child: GschemeListScreen(),
            ),



            // GestureDetector(
            //   onTap: () {
            //     Navigator.push(
            //         context, MaterialPageRoute(builder: (context) => scheme1()));
            //   },
            //   child: const ListTile(
            //       //tileColor: Color.fromRGBO(0, 0, 0, 0.10),
            //       tileColor: Colors.white,
            //       title: Text(
            //         "Startup India Seed Fund Scheme (SISFS) ",
            //         style: TextStyle(
            //           fontWeight: FontWeight.bold,
            //         ),
            //       ),
            //       subtitle: Text("Date of Launch/Implementation= April 1, 2021"),
            //       isThreeLine: true,
            //       trailing: Icon(
            //         Icons.expand_more_outlined,
            //       )),
            // ),
            //
            // const SizedBox(
            //   height: 5,
            // ),
            // // Padding(
            // //   padding: const EdgeInsets.symmetric(horizontal: 0.0),
            // //   child: Container(
            // //     padding: const EdgeInsets.all(5),
            // //     decoration: const BoxDecoration(color: Colors.white,
            // //     ),
            // //   ),
            // // ),
            //
            // GestureDetector(
            //   onTap: () {
            //     Navigator.push(
            //         context, MaterialPageRoute(builder: (context) => scheme1()));
            //   },
            //   child: const ListTile(
            //       //tileColor: Color.fromRGBO(0, 0, 0, 0.10),
            //       tileColor: Colors.white,
            //
            //       //selected: true,
            //       title: Text(
            //         "Ayushman Sahakar Scheme ",
            //         style: TextStyle(
            //           fontWeight: FontWeight.bold,
            //         ),
            //       ),
            //       subtitle:
            //           Text("Date of Launch/Implementation= October 19, 2020"),
            //       isThreeLine: true,
            //       trailing: Icon(
            //         Icons.expand_more_outlined,
            //       )),
            // ),
            //
            // const SizedBox(
            //   height: 5,
            // ),
            //
            // GestureDetector(
            //   onTap: () {
            //     Navigator.push(
            //         context, MaterialPageRoute(builder: (context) => scheme1()));
            //   },
            //   child: const ListTile(
            //       //tileColor: Color.fromRGBO(0, 0, 0, 0.10),
            //       tileColor: Colors.white,
            //
            //       //selected: true,
            //       title: Text(
            //         "Pradhan Mantri Annadata Aay SanraksHan Abhiyan (PM AASHA)",
            //         style: TextStyle(
            //           fontWeight: FontWeight.bold,
            //         ),
            //       ),
            //       subtitle: Text("Date of Launch/Implementation= September 2018"),
            //       isThreeLine: true,
            //       trailing: Icon(
            //         Icons.expand_more_outlined,
            //       )),
            // ),
            //
            // const SizedBox(
            //   height: 5,
            // ),
            // // Padding(
            // //   padding: const EdgeInsets.symmetric(horizontal: 0.0),
            // //   child: Container(
            // //     padding: const EdgeInsets.all(5),
            // //     decoration: const BoxDecoration(color: Colors.white,
            // //     ),
            // //   ),
            // // ),
            //
            // GestureDetector(
            //   onTap: () {
            //     Navigator.push(
            //         context, MaterialPageRoute(builder: (context) => scheme1()));
            //   },
            //   child: const ListTile(
            //       //tileColor: Color.fromRGBO(0, 0, 0, 0.10),
            //       tileColor: Colors.white,
            //
            //       //selected: true,
            //       title: Text(
            //         "SATAT Scheme (Sustainable Alternative Towards Affordable Transportation) ",
            //         style: TextStyle(
            //           fontWeight: FontWeight.bold,
            //         ),
            //       ),
            //       subtitle: Text("Date of Launch/Implementation= October 2018"),
            //       isThreeLine: true,
            //       trailing: Icon(
            //         Icons.expand_more_outlined,
            //       )),
            // ),
            //
            // const SizedBox(
            //   height: 5,
            // ),
            // // Padding(
            // //   padding: const EdgeInsets.symmetric(horizontal: 0.0),
            // //   child: Container(
            // //     padding: const EdgeInsets.all(5),
            // //     decoration: const BoxDecoration(color: Colors.white,
            // //     ),
            // //   ),
            // // ),
            //
            // GestureDetector(
            //   onTap: () {
            //     Navigator.push(
            //         context, MaterialPageRoute(builder: (context) => scheme1()));
            //   },
            //   child: const ListTile(
            //       //tileColor: Color.fromRGBO(0, 0, 0, 0.10),
            //       tileColor: Colors.white,
            //
            //       //selected: true,
            //       title: Text(
            //         "SVAMITVA Scheme (Survey of Villages and Mapping with Improvised Technology in Village Areas)",
            //         style: TextStyle(
            //           fontWeight: FontWeight.bold,
            //         ),
            //       ),
            //       subtitle: Text("Date of Launch/Implementation= April 24, 2020"),
            //       isThreeLine: true,
            //       trailing: Icon(
            //         Icons.expand_more_outlined,
            //       )),
            // ),

            const SizedBox(
              height: 5,
            ),
          ],
        ),
      ),
    );
  }
}
