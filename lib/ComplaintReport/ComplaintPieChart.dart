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


class ComplaintPieChart extends StatefulWidget {
  const ComplaintPieChart({Key? key}) : super(key: key);

  @override
  _ComplaintPieChartState createState() => _ComplaintPieChartState();
}

class _ComplaintPieChartState extends State<ComplaintPieChart> {

  List<ComplaintReport> _complaintList = <ComplaintReport>[];

  @override
  void initState() {
    super.initState();
    _getComplaintsByUserId();
  }

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

  Map<ComplaintStatus, int> _calculateStatusDistribution() {
    Map<ComplaintStatus, int> distribution = {
      ComplaintStatus.PENDING: 0,
      ComplaintStatus.REJECTED: 0,
      ComplaintStatus.RESOLVED: 0,
    };
    for (var complaint in _complaintList) {
      if (complaint.complaintStatus != null) {
        ComplaintStatus? status =
        complaintStatusValues.map[complaint.complaintStatus!];
        if (status != null) {
          distribution[status] = (distribution[status] ?? 0) + 1;
        }
      }
    }
    return distribution;
  }


  @override
  Widget build(BuildContext context) {
    Map<ComplaintStatus, int> statusDistribution = _calculateStatusDistribution();

    // Calculate total complaints for percentage calculation
    int totalComplaints = statusDistribution.values.fold(0, (sum, count) => sum + count);

    return Scaffold(
      backgroundColor: Color.fromRGBO(0, 0, 0, 0.10),
      body: Card(
        child: Row(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildLegendItem("Pending", Colors.amber, statusDistribution[ComplaintStatus.PENDING]!, totalComplaints),
                _buildLegendItem("Resolved", Colors.green, statusDistribution[ComplaintStatus.RESOLVED]!, totalComplaints),
                _buildLegendItem("Rejected", Colors.red, statusDistribution[ComplaintStatus.REJECTED]!, totalComplaints),
              ],
            ),
            Expanded(
              child: PieChart(
                PieChartData(
                  centerSpaceRadius: 5, // Adjust the center space radius as needed
                  borderData: FlBorderData(show: false),
                  sectionsSpace: 2, // Adjust the sections space as needed
                  sections: [
                    PieChartSectionData(
                      title: 'Pending',
                      value: statusDistribution[ComplaintStatus.PENDING]?.toDouble() ?? 0,
                      color: Colors.amber,
                      radius: 70,
                    ),
                    PieChartSectionData(
                      title: 'Resolved',
                      value: statusDistribution[ComplaintStatus.RESOLVED]?.toDouble() ?? 0,
                      color: Colors.green,
                      radius: 70,
                    ),
                    PieChartSectionData(
                      title: 'Rejected',
                      value: statusDistribution[ComplaintStatus.REJECTED]?.toDouble() ?? 0,
                      color: Colors.red,
                      radius: 70,
                    ),
                  ],
                  startDegreeOffset: 180,
                  pieTouchData: PieTouchData(touchCallback: (FlTouchEvent event, pieTouchResponse) {
                    // Handle pie chart touches here if needed
                  }),
                ),
              ),


            ),
          ],
        ),
      ),
    );
  }

  Widget _buildLegendItem(String text, Color color, int count, int total) {
    double percentage = total > 0 ? (count / total) * 100 : 0;

    return Row(
      children: [
        Container(
          width: 16,
          height: 16,
          color: color,
        ),
        SizedBox(width: 4),
        Text("$text (${percentage.toStringAsFixed(2)}%)"),
      ],
    );
  }
}


