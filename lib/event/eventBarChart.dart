import 'dart:math';

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:votevoiceconnect/apiServices/api_service.dart';
import 'package:votevoiceconnect/Blog/user_model.dart';
import 'package:votevoiceconnect/article/user_model.dart';
import 'package:votevoiceconnect/article/user_model.dart';
import 'package:votevoiceconnect/article/user_model.dart';
import 'package:votevoiceconnect/article/user_model.dart';
import 'package:votevoiceconnect/event/user_model.dart';

import 'package:votevoiceconnect/page/donationscreen.dart';
import 'package:votevoiceconnect/page/mainslider.dart';

import '../ecom/widgets/carousel_slider.dart';


class EventBarChart extends StatefulWidget {
  const EventBarChart({Key? key}) : super(key: key);

  @override
  _EventBarChartState createState() => _EventBarChartState();
}

class _EventBarChartState extends State<EventBarChart> {
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

  List<BarChartGroupData> _createSampleData() {
    List<BarChartGroupData> barChartData = [];
    for (int i = 0; i < _eventModel!.length; i++) {
      final chartModel = _eventModel![i];
      barChartData.add(
        BarChartGroupData(
          x: i,
          barRods: [
            BarChartRodData(
                toY: chartModel.id.toDouble(), width: 1, color: Colors.amber),
          ],

          //showingTooltipIndicators: [0],

        ),
      );
    }
    return barChartData;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(0, 0, 0, 0.10),
      body: Card(
        child: Container(

          child: BarChart(BarChartData(
            borderData: FlBorderData(
                border: const Border(
              top: BorderSide.none,
              right: BorderSide.none,
              left: BorderSide(width: 1),
              bottom: BorderSide(width: 1),
            )),
            groupsSpace: 3,
            barGroups: _createSampleData(),

            // barGroups: [
            //   BarChartGroupData(x: _eventModel!.length, barRods: [
            //     BarChartRodData( toY: _eventModel!.length.toDouble(), width: 15, color: Colors.amber),
            //   ]
            //   ),
            // ]

          )),
        ),
      ),
    );
  }
}
