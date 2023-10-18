import 'package:flutter/material.dart';
import 'package:votevoiceconnect/ComplaintReport/ComplaintBarChart.dart';
import 'package:votevoiceconnect/ComplaintReport/ComplaintDonutChart.dart';
import 'package:votevoiceconnect/ComplaintReport/ComplaintLineChart.dart';
import 'package:votevoiceconnect/ComplaintReport/ComplaintPieChart.dart';
import 'package:votevoiceconnect/Gscheme/gschemeBarChart.dart';
import 'package:votevoiceconnect/article/articleBarChart.dart';
import 'package:votevoiceconnect/event/eventBarChart.dart';

class allChart extends StatefulWidget {
  const allChart({Key? key}) : super(key: key);

  @override
  _allChartState createState() => _allChartState();
}

class _allChartState extends State<allChart> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(0, 0, 0, 0.10),
      appBar: AppBar(
        title: const Text('All Charts',style: TextStyle(color: Colors.black)),
        iconTheme: IconThemeData(color: Colors.black),
        backgroundColor: Colors.white,


      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
             Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  height: 100,
                  width: 130,
                  child: ComplaintBarChart(),
                ),
                Container(
                  height: 100,
                  width: 130,
                  child: ComplaintLineChart(),
                ),
                Container(
                  height: 100,
                  width: 130,
                  child: ComplaintDonutChart(),
                ),
              ],
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  height: 100,
                  width: 130,
                  child: ArticleBarChart(),
                ),
                Container(
                  height: 100,
                  width: 130,
                  child: EventBarChart(),
                ),
                Container(
                  height: 100,
                  width: 130,
                  child: GschemeBarChart(),
                ),
              ],
            ),

              Container(
                height: 180,
                width: 400,
                child: ComplaintPieChart(),
              ),

              Container(
                height: 180,
                width: 400,
                child: ComplaintBarChart(),
              ),
              Container(
                height: 180,
                width: 400,
                child: ComplaintLineChart(),
              ),
              Container(
                height: 180,
                width: 400,
                child: ComplaintDonutChart(),
              ),

              Container(
                height: 180,
                width: 400,
                child: ArticleBarChart(),
              ),
              Container(
                height: 180,
                width: 400,
                child: EventBarChart(),
              ),
              Container(
                height: 180,
                width: 400,
                child: GschemeBarChart(),
              ),

            ],
          ),
        ),
      ),
    );
  }
}
