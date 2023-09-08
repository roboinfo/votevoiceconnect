import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:votevoiceconnect/Gscheme/user_model.dart';
import 'package:votevoiceconnect/apiServices/api_service.dart';
import 'package:votevoiceconnect/Blog/user_model.dart';
import 'package:votevoiceconnect/article/user_model.dart';
import 'package:url_launcher/url_launcher.dart';

// class article1 extends StatefulWidget {
//   const article1({Key? key}) : super(key: key);
//
//   @override
//   State<article1> createState() => _article1State();
// }
//
// class _article1State extends State<article1> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       //backgroundColor: Colors.white,
//       backgroundColor: Color.fromRGBO(0, 0, 0, 0.10),
//
//       appBar: AppBar(
//         backgroundColor: Colors.deepPurple,
//         title: Row(
//           children: [
//             Icon(Icons.event,
//               color: Colors.deepPurple,
//               size: 30.0,
//             ),
//             const Text(
//               '           Articles',
//               textAlign: TextAlign.center,
//               style: TextStyle(color: Colors.white,
//                   fontWeight: FontWeight.bold,
//                   fontSize: 22.0),
//             ),
//           ],
//         ),
//       ),
//
//       extendBody: true,
//
//       body: SingleChildScrollView(
//         child: Column(
//           children: [
//
//             const SizedBox(
//               height: 5,
//             ),
//
//             Container(
//               color: Colors.white,
//               child: Column(
//                 children: [
//                   Container(
//                     padding: const EdgeInsets.only(top: 5.0),
//                     child: Image.asset(
//                       "assets/q2.png",
//                       // height: 250,
//                       width: double.infinity,
//                     ),
//                   ),
//                   Row(
//                     children: const <Widget>[
//                       Flexible(
//                         flex: 1,
//                         fit: FlexFit.tight,
//                         child: Text(
//                           '\n Voting Result Live | '
//                               '\n PM Modis Mann Ki Baat Live | '
//                               '\n Narendra Modis Address To The Nation |',
//                           textAlign: TextAlign.center,
//                           style: TextStyle(
//                               color: Colors.black45,
//                               fontWeight: FontWeight.bold,
//                               fontSize: 17.0),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ],
//               ),
//             ),
//
//
//             const SizedBox(
//               height: 5,
//             ),
//
//             Container(
//               color: Colors.white,
//               child: Column(
//                 children: [
//                   Container(
//                     padding: const EdgeInsets.only(top: 5.0),
//                     child: Image.asset(
//                       "assets/artical5.png",
//                       // height: 250,
//                       width: double.infinity,
//                     ),
//                   ),
//                   Row(
//                     children: const <Widget>[
//                       Flexible(
//                         flex: 1,
//                         fit: FlexFit.tight,
//                         child: Text(
//                           '\nElections 2022: '
//                               '\nAssembly Election 2022 Dates, |'
//                               '\nResults, Opinion polls, | '
//                               '\nExit polls and News | '
//                               '\nTimes of India | ',
//                           textAlign: TextAlign.center,
//                           style: TextStyle(
//                               color: Colors.black45,
//                               fontWeight: FontWeight.bold,
//                               fontSize: 17.0),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ],
//               ),
//             ),
//
//
//             const SizedBox(
//               height: 5,
//             ),
//         ],
//         ),
//       ),
//     );
//   }
// }
//

class scheme1 extends StatefulWidget {
  const scheme1({Key? key}) : super(key: key);

  @override
  _scheme1State createState() => _scheme1State();
}

class _scheme1State extends State<scheme1> {
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

  Future<void> _launchURL(String url) async {
    final Uri uri = Uri(scheme: "https", host: url);
    if(!await launchUrl(
      uri,
      mode: LaunchMode.externalApplication,
    )) {
      throw "Can not launch url";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(0, 0, 0, 0.10),
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 90, 90, 90),
        title: Row(
          children: [
            // Icon(
            //   Icons.event,
            //   color: Colors.deepPurple,
            //   size: 30.0,
            // ),
            const Text(
              '              Schemes',
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 22.0),
            ),
          ],
        ),
      ),
      body: _schemeModel == null || _schemeModel!.isEmpty
          ? const Center(
        child: CircularProgressIndicator(),
      )
          : ListView.builder(
        itemCount: _schemeModel!.length,
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
                    _schemeModel![index].featuredImageUrl.toString(),
                    width: double.infinity ,),

                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    padding: const EdgeInsets.only(top: 5.0),
                    child: Text(
                      _schemeModel![index].title.toString(),
                      textAlign: TextAlign.justify,
                      style: TextStyle(color: Colors.black,fontSize: 17,fontWeight: FontWeight.bold),),

                  ),
                ),
                Container(
                  padding: const EdgeInsets.only(top: 5.0),
                  child: Text(_schemeModel![index].details.toString(),
                    textAlign: TextAlign.justify,
                    style: TextStyle(color: Colors.black,fontSize: 12,fontWeight: FontWeight.bold),),

                ),


                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Flexible(
                        flex: 1,
                        fit: FlexFit.tight,

                        child: GestureDetector(
                          onTap: () {
                            _launchURL(_schemeModel![index].link.toString());
                          },
                          child: Text(_schemeModel![index].link.toString(),style: TextStyle(color: Colors.blue),
                        ),
                      ),
                      ),

                    ],
                  ),
                ),


              ],
            ),
          );
        },
      ),
    );
  }
}
