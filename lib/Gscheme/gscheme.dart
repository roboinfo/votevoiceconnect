import 'package:flutter/material.dart';
import 'package:votevoiceconnect/Blog/blog1.dart';
import 'package:votevoiceconnect/Gscheme/scheme1.dart';
import 'package:votevoiceconnect/Gscheme/user_model.dart';
import 'package:votevoiceconnect/apiServices/api_service.dart';
import 'package:votevoiceconnect/Blog/user_model.dart';
import 'package:votevoiceconnect/article/article1.dart';
import 'package:votevoiceconnect/article/user_model.dart';
import 'package:votevoiceconnect/article/user_model.dart';
import 'package:votevoiceconnect/article/user_model.dart';
import 'package:votevoiceconnect/article/user_model.dart';

import 'package:votevoiceconnect/page/donationscreen.dart';
import 'package:votevoiceconnect/page/mainslider.dart';



class GscemeScreen extends StatefulWidget {
  const GscemeScreen({Key? key}) : super(key: key);

  @override
  _GscemeScreenState createState() => _GscemeScreenState();
}

class _GscemeScreenState extends State<GscemeScreen> {
  late List<Scheme>? _schemeModel = [];

  @override
  void initState() {
    super.initState();
    _getData();
  }

  void _getData() async {
    _schemeModel = (await ApiServiceScheme().getScheme())!;
    Future.delayed(const Duration(seconds: 1)).then((value) => setState(() {}));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(0, 0, 0, 0.10),
      body: Column(
        children: <Widget>[



          const SizedBox(
            height: 4,
          ),

          // Expanded(
          //   child: _blogModel == null || _blogModel!.isEmpty
          //       ? const Center(
          //       child: CircularProgressIndicator()
          //   )
          //       : ListView.builder(
          //     itemCount: _blogModel!.length,
          //     itemBuilder: (context, index) {
          //       return Card(
          //         child: Column(
          //           children: [
          //             Padding(
          //               padding: const EdgeInsets.all(4.0),
          //               child:
          //               // Row(
          //               //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          //               //   children: [
          //               //     // Text(_userModel![index].id.toString()),
          //               //     Text(_articleModel![index].title.toString()),
          //               //   ],
          //               // ),
          //
          //               GestureDetector(
          //                 // onTap: () {
          //                 //   Navigator.push(
          //                 //       context,
          //                 //       MaterialPageRoute(
          //                 //           builder: (context) => article1()));
          //                 // },
          //                 child: Row(
          //                   children: [
          //                     Container(
          //                       alignment: Alignment.centerLeft,
          //                       child: Image.network(_blogModel![index]
          //                           .featuredImageUrl
          //                           .toString()),
          //
          //                       width: 100,
          //                     ),
          //                     // Padding(
          //                     //   padding:
          //                     //       const EdgeInsets.symmetric(vertical: 0.0),
          //                     //   child: Container(
          //                     //     padding: const EdgeInsets.all(4),
          //                     //     decoration: const BoxDecoration(
          //                     //       color: Colors.white,
          //                     //     ),
          //                     //   ),
          //                     // ),
          //
          //                     Flexible(
          //                       flex: 1,
          //                       fit: FlexFit.tight,
          //                       child: Padding(
          //                         padding: const EdgeInsets.all(6.0),
          //                         child: Text(
          //                           _blogModel![index].title.toString(),
          //                           textAlign: TextAlign.start,
          //                           style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),
          //                         ),
          //                       ),
          //                     ),
          //                     //Icon(Icons.expand_more_outlined,),
          //                   ],
          //                 ),
          //               ),
          //
          //             ),
          //           ],
          //         ),
          //       );
          //     },
          //   ),),

          Expanded(
            child: _schemeModel == null || _schemeModel!.isEmpty
                ? const Center(
                child: CircularProgressIndicator()
            )
                : ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: _schemeModel!.length,
              itemBuilder: (context, index) {
                return SizedBox(
                  height: 10,

                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => scheme1()));
                    },
                    child: Container(color: Colors.white,
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              alignment: Alignment.centerLeft,
                              child: Image.network(_schemeModel![index]
                                  .featuredImageUrl
                                  .toString()),

                              width: 300,
                            ),
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
                                _schemeModel![index].title.toString(),
                                textAlign: TextAlign.start,
                                style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                          Icon(Icons.expand_more_outlined,),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),),

        ],
      ),
    );
  }
}

