import 'dart:convert';
import 'dart:math';

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:votevoiceconnect/ComplaintReport/user_model.dart';
import 'package:votevoiceconnect/apiServices/api_service.dart';
import 'package:votevoiceconnect/Blog/user_model.dart';
import 'package:votevoiceconnect/article/user_model.dart';
import 'package:votevoiceconnect/article/user_model.dart';
import 'package:votevoiceconnect/article/user_model.dart';
import 'package:votevoiceconnect/article/user_model.dart';
import 'package:votevoiceconnect/ecom/services/complaint_service.dart';

import 'package:votevoiceconnect/page/donationscreen.dart';
import 'package:votevoiceconnect/page/mainslider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../ecom/widgets/carousel_slider.dart';


class ComplaintLineChart extends StatefulWidget {
  const ComplaintLineChart({Key? key}) : super(key: key);

  @override
  _ComplaintLineChartState createState() => _ComplaintLineChartState();
}

class _ComplaintLineChartState extends State<ComplaintLineChart> {
  //late List<Article> _articleModel = [];
  List<ComplaintReport> _complaintList = <ComplaintReport>[];


  @override
  void initState() {
    super.initState();
    //_getData();
    _getComplaintsByUserId();
  }

  // void _getData() async {
  //   _articleModel = (await ApiServiceArticle().getArticle())!;
  //   Future.delayed(const Duration(seconds: 1)).then((value) => setState(() {}));
  // }

  _getComplaintsByUserId() async {
    ComplaintService _complaintService = ComplaintService();
    var result = await _complaintService.getComplaint();
    var report = json.decode(result.body);
    report.forEach((complaint) {
      var model = ComplaintReport();
      model.id = complaint['id'];
      model.userName = complaint['userName'];
      model.blockcategory = complaint['blockcategory'];
      model.complaintcategory = complaint['complaintcategory'];
      model.description = complaint['description'];
      model.adress = complaint['adress'];
      model.adminComment = complaint['adminComment'];
      model.complaintStatus = complaint['complaintStatus'];
      model.complaintType = complaint['complaintType'];
      model.created_at = complaint['created_at'];
      setState(() {
        _complaintList.add(model);
      });
    });
  }

  // List<BarChartGroupData> _createSampleData() {
  //   List<BarChartGroupData> barChartData = [];
  //   for (int i = 0; i < _articleModel.length; i++) {
  //     final chartModel = _articleModel[i];
  //     barChartData.add(
  //       BarChartGroupData(
  //         x: i,
  //         barRods: [
  //           BarChartRodData(
  //               toY: chartModel.id.toDouble(), width: 12, color: Colors.amber),
  //         ],
  //
  //         //showingTooltipIndicators: [0],
  //
  //       ),
  //     );
  //   }
  //   return barChartData;
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(0, 0, 0, 0.10),
      body: Card(
        child:

        LineChart(
          LineChartData(
            borderData: FlBorderData(show: false),
            lineBarsData: [
              // The red line
              LineChartBarData(
                spots: [
                  FlSpot(0, _complaintList.length.toDouble()),
                  FlSpot(1, _complaintList!.first.complaintStatus!.toString().length.toDouble(),),
                  FlSpot(2, _complaintList!.first.complaintType!.isEmpty.toString().length.toDouble(),),
                ],
                dotData: FlDotData(show: true),
                isCurved: true,
                barWidth: 3,
                color: Colors.indigo,
              ),
            ],
          ),
        ),

      ),
    );
  }
}
