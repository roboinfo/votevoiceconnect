import 'dart:convert';

import 'package:votevoiceconnect/ecom/models/blockcategory.dart';
import 'package:votevoiceconnect/ComplaintReport/complaint.dart';
import 'package:votevoiceconnect/ecom/models/complaintcategory.dart';
import 'package:votevoiceconnect/ecom/screens/choose_payment_method.dart';
import 'package:votevoiceconnect/ecom/services/blockcategory_service.dart';
import 'package:votevoiceconnect/ecom/services/complaintcategory_service.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../models/product.dart';
import '../services/complaint_service.dart';

class ComplaintScreen extends StatefulWidget {


  const ComplaintScreen({super.key,});

  @override
  State<ComplaintScreen> createState() => _ComplaintScreenState();
}

class _ComplaintScreenState extends State<ComplaintScreen> {


  String _userName = '';
  final description = TextEditingController();
  final userName = TextEditingController();

  final adress = TextEditingController();

  //*****************************
  TextEditingController date = TextEditingController();

  BlockCategory? _selectedCategory;

  BlockCategoryService _blockcategoryService = BlockCategoryService();
  final List<BlockCategory> _blockcategoryList = [];



  @override
  void initState() {
    _getUserName();
    super.initState();
    _getAllBlockCategories();
    _getAllComplaintCategories();
    date.text = "";
  }

  _getUserName() async {
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    String userName = _prefs.getString('userName') ?? '';
    setState(() {
      _userName = userName;
    });
  }

  _getAllBlockCategories() async {
    var blockCategories = await _blockcategoryService.getBlockCategories();
    var result = json.decode(blockCategories.body);
    result['data'].forEach((data) {
      var model = BlockCategory();
      model.id = data['id'];
      model.name = data['name'];
      print(_blockcategoryList);
      setState(() {
        _blockcategoryList.add(model);
      });
    });
  }

  ComplaintCategory? _selectedCategory1;

  ComplaintCategoryService _complaintcategoryService =
      ComplaintCategoryService();
  final List<ComplaintCategory> _complaintcategoryList = [];

  _getAllComplaintCategories() async {
    var complaintCategories =
        await _complaintcategoryService.getComplaintCategories();
    var result = json.decode(complaintCategories.body);
    result['data'].forEach((data) {
      var model = ComplaintCategory();
      model.id = data['id'];
      model.name = data['name'];
      print(_complaintcategoryList);
      setState(() {
        _complaintcategoryList.add(model);
      });
    });
  }



  _showSnackMessage(message) {
    var snackBar = SnackBar(
      content: message,
    );
    //_scaffoldKey.currentState!.showSnackBar(_snackBar);
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  clearText() {
    description.clear();
    adress.clear();

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(0, 0, 0, 0.10),
      appBar: AppBar(
        title: const Text('Register Complaint',),
        backgroundColor: Color.fromARGB(255, 90, 90, 90),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 0.0),
        child: ListView(
          children: <Widget>[
            const SizedBox(
              height: 5,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 0.0),
              child: Container(
                padding: const EdgeInsets.only(top: 5.0, bottom: 5.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(0.0),
                  //color: Color.fromRGBO(0, 0, 0, 0.10),
                  color: Colors.white,
                ),
                child: Image.asset(
                  "assets/complaint.png",
                  // height: 250,
                  width: double.infinity,
                ),
              ),
            ),

            // UserAccountsDrawerHeader(
            //   accountName: Text('Welcome, $_userName!', style: TextStyle(fontSize: 22, color: Colors.black),),
            //   accountEmail: Text('', style: TextStyle(fontSize: 18, color: Colors.white),),
            //   currentAccountPicture: CircleAvatar(
            //     child: ClipOval(child: Image.asset('assets/Roboinfocom.png'),),
            //   ),
            //   decoration: BoxDecoration(
            //       color: Colors.pinkAccent,
            //       image: DecorationImage(image: AssetImage('assets/complaint.png'), fit: BoxFit.cover)
            //   ),
            // ),
            const SizedBox(
              height: 5,
            ),
            Container(
              decoration: BoxDecoration(
                //borderRadius: BorderRadius.circular(20.0),
                //color: Color.fromRGBO(0, 0, 0, 0.10),
                color: Colors.white,
              ),
              child: Padding(
                padding: const EdgeInsets.all(5.0),
                child: Row(
                  children: [
                    Icon(
                      Icons.person_add_alt_1,
                      color: Colors.deepPurple,
                      size: 30.0,
                    ),
                    Text(
                      '       Enter Complaint Details',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.black45,
                          fontWeight: FontWeight.bold,
                          fontSize: 22.0),
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(
              height: 15,
            ),

            Row(
              children: <Widget>[
                Flexible(
                  flex: 1,
                  fit: FlexFit.tight,
                  child: Container(
                      //alignment: Alignment.center,
                      padding: const EdgeInsets.only(top: 10.0, left: 20.0),
                      child: const Text(
                        'Select City *',
                        style: TextStyle(
                            color: Colors.black38,
                            fontWeight: FontWeight.bold,
                            fontSize: 15.0),
                      )),
                ),
              ],
            ),
            const SizedBox(
              height: 5,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Flexible(
                  flex: 1,
                  fit: FlexFit.tight,
                  child: Padding(
                    padding: const EdgeInsets.only(
                        top: 0.0, left: 10.0, right: 10.0),
                    child: Container(
                      //color: Color.fromRGBO(0, 0, 0, 0.10),
                      color: Colors.white,

                      child: Container(
                        decoration: BoxDecoration(
                          // borderRadius: BorderRadius.circular(15.0),
                          border: Border.all(
                              color: Colors.black54,
                              style: BorderStyle.solid,
                              width: 0.80),
                        ),
                        child: DropdownButton<BlockCategory>(
                          hint: Text('Select City'),
                          value: _selectedCategory,
                          // The currently selected category
                          items: _blockcategoryList.map((category) {
                            return DropdownMenuItem<BlockCategory>(
                              value: category,
                              child: Text(category.name ?? ''),
                            );
                          }).toList(),
                          onChanged: (value) {
                            setState(() {
                              _selectedCategory =
                                  value; // Set the selected category
                            });
                          },
                          selectedItemBuilder: (BuildContext context) {
                            return _blockcategoryList.map<Widget>((category) {
                              return Text(category.name ?? '');
                            }).toList();
                          },
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 5,
            ),
            Row(
              children: <Widget>[
                Flexible(
                  flex: 1,
                  fit: FlexFit.tight,
                  child: Container(
                      //alignment: Alignment.center,
                      padding: const EdgeInsets.only(top: 0.0, left: 20.0),
                      child: const Text(
                        'Select Complaint *',
                        style: TextStyle(
                            color: Colors.black38,
                            fontWeight: FontWeight.bold,
                            fontSize: 15.0),
                      )),
                ),
              ],
            ),
            const SizedBox(
              height: 5,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Flexible(
                  flex: 1,
                  fit: FlexFit.tight,
                  child: Padding(
                    padding: const EdgeInsets.only(
                        top: 0.0, left: 10.0, right: 10.0),
                    child: Container(
                      //color: Color.fromRGBO(0, 0, 0, 0.10),
                      color: Colors.white,

                      child: Container(
                        decoration: BoxDecoration(
                          // borderRadius: BorderRadius.circular(15.0),
                          border: Border.all(
                              color: Colors.black54,
                              style: BorderStyle.solid,
                              width: 0.80),
                        ),
                        child: DropdownButton<ComplaintCategory>(
                          hint: Text('Select Complaint'),
                          value: _selectedCategory1,
                          // The currently selected category
                          items: _complaintcategoryList.map((category) {
                            return DropdownMenuItem<ComplaintCategory>(
                              value: category,
                              child: Text(category.name ?? ''),
                            );
                          }).toList(),
                          onChanged: (value) {
                            setState(() {
                              _selectedCategory1 =
                                  value; // Set the selected category
                            });
                          },
                          selectedItemBuilder: (BuildContext context) {
                            return _complaintcategoryList
                                .map<Widget>((category) {
                              return Text(category.name ?? '');
                            }).toList();
                          },
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),

            const SizedBox(
              height: 5,
            ),

            Row(
              children: <Widget>[
                Flexible(
                  flex: 1,
                  fit: FlexFit.tight,
                  child: Container(
                    //alignment: Alignment.center,
                      padding:
                      const EdgeInsets.only(top: 0.0, left: 20.0),
                      child: const Text(
                        'Description *',
                        style: TextStyle(
                            color: Colors.black38,
                            fontWeight: FontWeight.bold,
                            fontSize: 15.0),
                      )),
                ),
              ],
            ),
            const SizedBox(
              height: 5,
            ),

            Row(
              children: <Widget>[
                Flexible(
                  flex: 1,
                  fit: FlexFit.tight,
                  child: Container(
                    padding: const EdgeInsets.only(
                        top: 0.0, left: 10.0, right: 10.0),
                    child: TextFormField(
                      autofocus: false,
                      decoration: InputDecoration(
                        filled: true,
                        //<-- SEE HERE
                        //fillColor: Color.fromRGBO(0, 0, 0, 0.10),
                        fillColor: Colors.white,

                        hintText: 'Description',
                        labelStyle: TextStyle(fontSize: 20.0),

                        errorStyle: TextStyle(
                            color: Colors.redAccent, fontSize: 15),
                      ),
                      controller: description,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Description';
                        }
                        return null;
                      },
                    ),
                  ),
                ),
              ],
            ),

            const SizedBox(
              height: 5,
            ),

            Row(
              children: <Widget>[
                Flexible(
                  flex: 1,
                  fit: FlexFit.tight,
                  child: Container(
                    //alignment: Alignment.center,
                      padding:
                      const EdgeInsets.only(top: 0.0, left: 20.0),
                      child: const Text(
                        'Address *',
                        style: TextStyle(
                            color: Colors.black38,
                            fontWeight: FontWeight.bold,
                            fontSize: 15.0),
                      )),
                ),
              ],
            ),

            const SizedBox(
              height: 5,
            ),

            Row(
              children: <Widget>[
                Flexible(
                  flex: 1,
                  fit: FlexFit.tight,
                  child: Container(
                    padding: const EdgeInsets.only(
                        top: 0.0, left: 10.0, right: 10.0),
                    child: TextFormField(
                      autofocus: false,
                      decoration: InputDecoration(
                        filled: true,
                        //<-- SEE HERE
                        //fillColor: Color.fromRGBO(0, 0, 0, 0.10),
                        fillColor: Colors.white,

                        hintText: 'Enter Address',
                        labelStyle: TextStyle(fontSize: 20.0),

                        errorStyle: TextStyle(
                            color: Colors.redAccent, fontSize: 15),
                      ),
                      controller: adress,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please Enter Address';
                        }
                        return null;
                      },
                    ),
                  ),
                ),
              ],
            ),

            const SizedBox(
              height: 15,
            ),

            Row(
              children: <Widget>[
                Flexible(
                  flex: 1,
                  fit: FlexFit.tight,
                  child: Container(
                      alignment: Alignment.center,
                      padding: const EdgeInsets.only(
                          top: 0.0, left: 20.0, right: 20.0),
                      child: const Text(
                        'I declare that I am an Indian Citizen and I am making this contribution '
                            'to **** Party out of my free will, from income legally earned/owned by me.'
                            'This details that I have provided above are true and nothing has been misrepresented.',
                        style: TextStyle(
                            color: Colors.black38,
                            fontWeight: FontWeight.bold,
                            fontSize: 10.0),
                      )),
                ),
              ],
            ),
            const SizedBox(
              height: 5,
            ),

            Row(
              children: <Widget>[
                Flexible(
                  flex: 1,
                  fit: FlexFit.tight,
                  child: Container(
                    alignment: Alignment.center,
                    padding: const EdgeInsets.only(
                        top: 0.0, left: 50.0, right: 50.0),
                    child: ElevatedButton(
                      onPressed: () async {
                        SharedPreferences _prefs =
                        await SharedPreferences.getInstance();
                        var complaint = Complaint();
                        complaint.userId = _prefs.getInt('userId')!; //
                        complaint.blockcategory = _selectedCategory?.name ?? '';
                        complaint.complaintcategory =
                            _selectedCategory1?.name ?? '';
                        complaint.description = description.text;
                        complaint.adress = adress.text;
                        complaint.userName = _userName.toString();
                        _complaint(context, complaint);

                        clearText();

                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              scrollable: true,
                              backgroundColor: Colors.blueGrey,
                              title: const Text(
                                "Complaint Added Successfully ",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 22.0),
                              ),
                            );
                          },
                        );

                      },
                      style: ElevatedButton.styleFrom(
                        primary: Color.fromRGBO(0, 0, 0, 0.03),
                        onPrimary: Colors.lightBlueAccent,
                        padding: EdgeInsets.symmetric(
                            horizontal: 20, vertical: 10),
                        textStyle: TextStyle(
                            fontSize: 30, fontWeight: FontWeight.bold),
                      ),
                      child: const Text('AGREE & SUBMIT',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Colors.black45,
                              fontWeight: FontWeight.bold,
                              fontSize: 19.0)),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 5,
            ),
          ],
        ),
      ),
    );
  }

  void _complaint(context, Complaint complaint) async {
    var complaintService = ComplaintService();
    var complaintData = await complaintService.addComplaint(complaint);
    var result = await json.decode(complaintData.body);

    // if (result['result'] == true) {
    //   Navigator.push(
    //       context,
    //       MaterialPageRoute(
    //           builder: (context) => ChoosePaymentOption(
    //             cartItems: widget.cartItems,
    //           )));
    // } else {
    //   _showSnackMessage(const Text('Failed to add shipping', style: TextStyle(color: Colors.red),));
    // }
  }
}
