import 'dart:math';

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:votevoiceconnect/Gscheme/user_model.dart';
import 'package:votevoiceconnect/apiServices/api_service.dart';
import 'package:votevoiceconnect/Blog/user_model.dart';
import 'package:votevoiceconnect/article/user_model.dart';
import 'package:votevoiceconnect/article/user_model.dart';
import 'package:votevoiceconnect/article/user_model.dart';
import 'package:votevoiceconnect/article/user_model.dart';

import 'package:votevoiceconnect/page/donationscreen.dart';
import 'package:votevoiceconnect/page/mainslider.dart';

import '../ecom/widgets/carousel_slider.dart';


class GschemeBarChart extends StatefulWidget {
  const GschemeBarChart({Key? key}) : super(key: key);

  @override
  _GschemeBarChartState createState() => _GschemeBarChartState();
}

class _GschemeBarChartState extends State<GschemeBarChart> {
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

  List<BarChartGroupData> _createSampleData() {
    List<BarChartGroupData> barChartData = [];
    for (int i = 0; i < _schemeModel!.length; i++) {
      final chartModel = _schemeModel![i];
      barChartData.add(
        BarChartGroupData(
          x: i,
          barRods: [
            BarChartRodData(
                toY: chartModel.id.toDouble(), width: 2, color: Colors.amber),
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
        // child:
        // RotatedBox(
        //   quarterTurns: 1,
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
            //   BarChartGroupData(x: _schemeModel!.length, barRods: [
            //     BarChartRodData( toY: _schemeModel!.length.toDouble(), width: 15, color: Colors.amber),
            //   ]
            //   ),
            // ]

          )),
        ),

    );
  }
}
