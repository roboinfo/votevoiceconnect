import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:votevoiceconnect/ecom/widgets/video_slider.dart';
import 'package:votevoiceconnect/page/home2.dart';
import 'package:votevoiceconnect/youtube/screens/favScreen.dart';

import '../../Blog/blogscreen.dart';
import 'galleryscreen.dart';

class Profile extends StatefulWidget {
  Color _iconColor = Colors.white;

  @override
  State<StatefulWidget> createState() {
    return ProfileState();
  }
}

class ProfileState extends State<Profile> {

  String _userName = '';

  @override
  void initState() {
    _getUserName();
    super.initState();
  }

  _getUserName() async {
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    String userName = _prefs.getString('userName') ?? '';
    setState(() {
      _userName = userName;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromRGBO(0, 0, 0, 0.10),

        appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 90, 90, 90),
          title: Row(
            children: [
              Icon(
                Icons.verified_outlined,
                color: Colors.white,
                size: 30.0,
              ),
              // const Text(
              //   'Roboinfocom ',
              //   textAlign: TextAlign.center,
              //   style: TextStyle(
              //       color: Colors.white,
              //       fontWeight: FontWeight.bold,
              //       fontSize: 22.0),
              // ),
              Text(
                'Welcome, $_userName !',
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 22.0),
              ),
            ],
          ),
        ),
        body: ListView(
          children: <Widget>[
            Padding(
                padding: const EdgeInsets.only(top: 40, bottom: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    const Padding(
                      padding: EdgeInsets.only(bottom: 60),

                      // child: ButtonTheme(
                      //   minWidth: 20.0,
                      //   height: 40.0,
                      //    child: RaisedButton(
                      //      color: Colors.white,
                      //      onPressed: () {},
                      //      splashColor: Colors.grey[200],
                      //      child: Icon(
                      //        Icons.add_a_photo,
                      //        size: 20,
                      //      ),
                      //      shape: new CircleBorder(),
                      //    ),
                      // ),

                    ),
                    Column(
                      children: const <Widget>[
                        CircleAvatar(
                          radius: 60.0,
                          backgroundImage: AssetImage("assets/Roboinfocom.png"),
                          backgroundColor: Colors.transparent,
                        ),
                        SizedBox(height: 20),
                        Text(
                          'Roboinfocom Pvt Ltd',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Colors.indigo,
                              fontWeight: FontWeight.bold,
                              fontSize: 25.0),
                        ),
                        SizedBox(
                          height: 10,
                        ),

                        Text(
                          'contactus@roboinfocom.com',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Colors.indigo,
                              fontWeight: FontWeight.bold,
                              fontSize: 19.0),
                        ),

                      ],
                    ),
                    const Padding(
                      padding: EdgeInsets.only(bottom: 60),
                      // child: ButtonTheme(
                      //   minWidth: 20.0,
                      //   height: 40.0,
                      //   child: RaisedButton(
                      //     color: Colors.white,
                      //     onPressed: () {},
                      //     splashColor: Colors.grey[200],
                      //     child: Icon(
                      //       Icons.edit,
                      //       size: 20,
                      //     ),
                      //     shape: new CircleBorder(),
                      //   ),
                      // ),
                    )
                  ],
                )),

            Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children : <Widget>[

                  Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ElevatedButton.icon(
                          style: ElevatedButton.styleFrom(
                            primary: Colors.white,
                            onPrimary: Colors.black,
                            padding: EdgeInsets.symmetric(
                                horizontal: 20, vertical: 10),
                            textStyle: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold),
                          ),
                          onPressed: () {
                            // Navigator.push(
                            //   context,
                            //   MaterialPageRoute(builder: (context) => const article1()),
                            // );
                          },
                          icon: Icon(
                            Icons.newspaper,
                          ),
                          label: Text("Follow"),
                          //.........
                        ),
                      )
                  ),

                  Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ElevatedButton.icon(
                          style: ElevatedButton.styleFrom(
                            primary: Colors.white,
                            onPrimary: Colors.black,
                            padding: EdgeInsets.symmetric(
                                horizontal: 20, vertical: 10),
                            textStyle: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold),
                          ),
                          onPressed: () {
                            // Navigator.push(
                            //   context,
                            //   MaterialPageRoute(builder: (context) => const events1()),
                            // );
                          },
                          icon: Icon(
                            Icons.event,
                          ),
                          label: Text("Message"),
                          //.........
                        ),
                      )
                  ),
                ]),
            Padding(
              padding: const EdgeInsets.only(
                top: 20.0,
                bottom: 10.0,
                left: 20.0,
                right: 20.0,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: const <Widget>[
                      Text(
                        '536',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.black87,
                            fontSize: 17.0),
                      ),
                      SizedBox(height: 6),
                      Text(
                        'Posts',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.grey,
                        ),
                      )
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: const <Widget>[
                      Text(
                        '68M',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.black87,
                            fontSize: 17.0),
                      ),
                      SizedBox(height: 6),
                      Text(
                        'Followers',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: const <Widget>[
                      Text(
                        '0',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.black87,
                            fontSize: 17.0),
                      ),
                      SizedBox(height: 5),
                      Text(
                        'Following',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.grey,
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),

            Container(height: 1000,width: 500,
              child: GalleryScreen(),
            ),

            const SizedBox(height: 10.0),

            Container(height: 250,width: 500,
              child: BlogScreen(),
            ),

            const SizedBox(height: 10.0),

            VideoSlider(),

            const SizedBox(height: 10),



          ],
        ));
  }
}
