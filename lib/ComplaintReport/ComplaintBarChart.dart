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


class ComplaintBarChart extends StatefulWidget {
  const ComplaintBarChart({Key? key}) : super(key: key);

  @override
  _ComplaintBarChartState createState() => _ComplaintBarChartState();
}

class _ComplaintBarChartState extends State<ComplaintBarChart> {
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
        child: BarChart(BarChartData(
          borderData: FlBorderData(
              border: const Border(
            top: BorderSide.none,
            right: BorderSide.none,
            left: BorderSide(width: 1),
            bottom: BorderSide(width: 1),
          )),
          groupsSpace: 3,
          //barGroups: _createSampleData(),

          barGroups: [
            // BarChartGroupData(x: 1, barRods: [
            //   BarChartRodData( toY: _complaintList!.length.toDouble(), width: 15, color: Colors.amber),
            // ]),
            BarChartGroupData(x: 1, barRods: [
              BarChartRodData( toY: _complaintList.length.toDouble(),width: 10,color: Colors.amber,),
            ],),
            BarChartGroupData(x: 2, barRods: [
                BarChartRodData( toY: _complaintList.first.complaintStatus!.toString().length.toDouble(),width: 10,color: Colors.green,),
              ],),
            BarChartGroupData(x: 3, barRods: [
                BarChartRodData( toY: _complaintList!.first.complaintType!.toString().length.toDouble(),width: 10,color: Colors.red,),
              ],),
            // BarChartGroupData(x: 4, barRods [
            //   BarChartRodData( toY: _complaintList!.first.complaintcategory.toString().length.toDouble(),width: 15,color: Colors.amber,),
            // ],),


          ]

        )
        ),
      ),
    );
  }
}
