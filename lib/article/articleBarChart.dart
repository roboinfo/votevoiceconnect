import 'dart:math';

import 'package:fl_chart/fl_chart.dart';
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

class ArticleBarChart extends StatefulWidget {
  const ArticleBarChart({Key? key}) : super(key: key);

  @override
  _ArticleBarChartState createState() => _ArticleBarChartState();
}

class _ArticleBarChartState extends State<ArticleBarChart> {
  late List<Article> _articleModel = [];

  @override
  void initState() {
    super.initState();
    _getData();
  }

  void _getData() async {
    _articleModel = (await ApiServiceArticle().getArticle())!;
    Future.delayed(const Duration(seconds: 1)).then((value) => setState(() {}));
  }

  List<BarChartGroupData> _createSampleData() {
    List<BarChartGroupData> barChartData = [];
    for (int i = 0; i < _articleModel.length; i++) {
      final chartModel = _articleModel[i];
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
            //   BarChartGroupData(x: _articleModel!.length, barRods: [
            //     BarChartRodData( toY: _articleModel!.length.toDouble(), width: 15, color: Colors.amber),
            //   ]
            //   ),
            // ]

          )),
        ),

    );
  }
}
