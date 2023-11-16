import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:votevoiceconnect/ComplaintReport/user_model.dart';
import 'package:votevoiceconnect/apiServices/api_service.dart';
import 'package:votevoiceconnect/ComplaintReport/complaint.dart';
import 'package:votevoiceconnect/ecom/screens/complaint_screen.dart';
import 'package:votevoiceconnect/ecom/services/complaint_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

class complaintReport extends StatefulWidget {
  const complaintReport({Key? key}) : super(key: key);

  @override
  State<complaintReport> createState() => _complaintReportState();
}

class _complaintReportState extends State<complaintReport> {
  //late List<ComplaintReport>? _complaintReportModel = [];

  List<ComplaintReport> _complaintList = <ComplaintReport>[];

  @override
  void initState() {
    super.initState();
    _getComplaintsByUserId();
  }

  _getComplaintsByUserId() async {
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    int? _userId = _prefs.getInt('userId');
    ComplaintService _complaintService = ComplaintService();
    var result = await _complaintService.getComplaintsByUserId(_userId!);
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('Complaint History'.tr),
          backgroundColor: Color.fromARGB(255, 90, 90, 90),
        ),

        body: ListView.builder(
          scrollDirection: Axis.vertical,
          itemCount: _complaintList.length,
          itemBuilder: (context, index) {
            return Card(
              child: ListTile(
                //title: Text(''),
                subtitle: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(left: 15.0),
                      child: Row(
                        children: [
                          Text(
                            _complaintList![index].created_at.toString(),
                            textAlign: TextAlign.start,
                            style: TextStyle(
                                fontSize: 17, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),

                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 15.0),
                          child: Row(
                            children: [
                              Text('Status:',
                                  style: TextStyle(
                                      fontSize: 17,
                                      fontWeight: FontWeight.bold)),
                              Text(
                                _complaintList![index]
                                    .complaintStatus
                                    .toString(),
                                textAlign: TextAlign.start,
                                style: TextStyle(
                                    fontSize: 17, fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 15.0),
                          child: Row(
                            children: [
                              Text('Action:',
                                  style: TextStyle(
                                      fontSize: 17,
                                      fontWeight: FontWeight.bold)),
                              Text(
                                _complaintList![index].complaintType.toString(),
                                textAlign: TextAlign.start,
                                style: TextStyle(
                                    fontSize: 17, fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),

                    Padding(
                      padding: const EdgeInsets.only(left: 15.0),
                      child: Row(
                        children: [
                          Text(
                            _complaintList![index].complaintcategory.toString(),
                            textAlign: TextAlign.start,
                            style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.black),
                          ),
                        ],
                      ),
                    ),

                    Padding(
                      padding: const EdgeInsets.only(left: 15.0),
                      child: Row(
                        children: [
                          Text('Block:',
                              style: TextStyle(
                                  fontSize: 17, fontWeight: FontWeight.bold)),
                          Text(
                            _complaintList![index].blockcategory.toString(),
                            textAlign: TextAlign.start,
                            style: TextStyle(
                                fontSize: 17, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),

                    Padding(
                      padding: const EdgeInsets.only(left: 15.0),
                      child: Row(
                        children: [
                          Text('Address:',
                              style: TextStyle(
                                  fontSize: 17, fontWeight: FontWeight.bold)),
                          Text(
                            _complaintList![index].adress.toString(),
                            textAlign: TextAlign.start,
                            style: TextStyle(
                                fontSize: 17, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),

                    Padding(
                      padding: const EdgeInsets.only(left: 15.0),
                      child: Row(
                        children: [
                          Text('Description:',
                              style: TextStyle(
                                  fontSize: 17, fontWeight: FontWeight.bold)),
                          Text(
                            _complaintList![index].description.toString(),
                            textAlign: TextAlign.start,
                            style: TextStyle(
                                fontSize: 17, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),

                    //Text("complaintcategory : ${ _complaintList[index].complaintcategory.toString()}"),

                    Padding(
                      padding: const EdgeInsets.only(left: 15.0),
                      child: Row(
                        children: [
                          Text('Admin Comment:',
                              style: TextStyle(
                                  fontSize: 17, fontWeight: FontWeight.bold)),
                          Text(
                            _complaintList![index].adminComment.toString(),
                            textAlign: TextAlign.start,
                            style: TextStyle(
                                fontSize: 17, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
        bottomNavigationBar: Padding(
          padding: EdgeInsets.all(8.0),
          child: ElevatedButton.icon(
            style: ElevatedButton.styleFrom(
              primary: Colors.deepOrange,
              onPrimary: Colors.white,
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              textStyle: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ComplaintScreen()),
              );
            },

            label: Text("Add New Complaint".tr),
            icon: Icon(
              Icons.add_box,
            ),
            //.........
          ),
        ));
  }
}
