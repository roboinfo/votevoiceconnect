import 'package:flutter/material.dart';
import 'package:votevoiceconnect/ComplaintReport/ComplaintBarChart.dart';
import 'package:votevoiceconnect/ComplaintReport/ComplaintDonutChart.dart';
import 'package:votevoiceconnect/ComplaintReport/ComplaintLineChart.dart';
import 'package:votevoiceconnect/ComplaintReport/ComplaintPieChart.dart';
import 'package:votevoiceconnect/Gscheme/gschemeBarChart.dart';
import 'package:votevoiceconnect/article/articleBarChart.dart';
import 'package:votevoiceconnect/ecom/widgets/video_slider.dart';
import 'package:votevoiceconnect/event/eventBarChart.dart';

class allWebVideos extends StatefulWidget {
  const allWebVideos({Key? key}) : super(key: key);

  @override
  _allWebVideosState createState() => _allWebVideosState();
}

class _allWebVideosState extends State<allWebVideos> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(0, 0, 0, 0.10),
      appBar: AppBar(
        title: const Text('All Web Videos',style: TextStyle(color: Colors.black)),
        iconTheme: IconThemeData(color: Colors.black),
        backgroundColor: Colors.white,


      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              const SizedBox(
                height: 0,
              ),
              VideoSlider(),
              const SizedBox(
                height: 0,
              ),
              VideoSlider(),
              const SizedBox(
                height: 0,
              ),
              VideoSlider(),

            ],
          ),
        ),
      ),
    );
  }
}
