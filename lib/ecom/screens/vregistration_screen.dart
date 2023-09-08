import 'dart:convert';

import 'package:votevoiceconnect/ecom/models/product.dart';
import 'package:votevoiceconnect/ecom/models/skillcategory.dart';
import 'package:votevoiceconnect/ecom/models/statecategory.dart';
import 'package:votevoiceconnect/ecom/models/vregistration.dart';
import 'package:votevoiceconnect/ecom/screens/choose_payment_method.dart';
import 'package:votevoiceconnect/ecom/services/skillcategory_service.dart';
import 'package:votevoiceconnect/ecom/services/statecategory_service.dart';
import 'package:votevoiceconnect/ecom/services/vregistration_service.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:votevoiceconnect/page/dashboard.dart';

class RegistrationScreen extends StatefulWidget {
  final List<Product> cartItems;

  const RegistrationScreen({super.key, required this.cartItems});

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  final name = TextEditingController();
  final mobile = TextEditingController();
  final email = TextEditingController();
  final adress = TextEditingController();
  final pin = TextEditingController();

  //*****************************
  clearText() {
    name.clear();
    mobile.clear();
    email.clear();
    adress.clear();
    pin.clear();
  }

  //*****************************
  TextEditingController date = TextEditingController();

  StateCategory? _selectedCategory;

  StateCategoryService _statecategoryService = StateCategoryService();
  final List<StateCategory> _statecategoryList = [];

  _getAllStateCategories() async {
    var stateCategories = await _statecategoryService.getStateCategories();
    var result = json.decode(stateCategories.body);
    result['data'].forEach((data) {
      var model = StateCategory();
      model.id = data['id'];
      model.name = data['name'];
      print(_statecategoryList);
      setState(() {
        _statecategoryList.add(model);
      });
    });
  }

  SkillCategory? _selectedCategory1;

  SkillCategoryService _skillcategoryService = SkillCategoryService();
  final List<SkillCategory> _skillcategoryList = [];

  _getAllSkillCategories() async {
    var skillCategories = await _skillcategoryService.getSkillCategories();
    var result = json.decode(skillCategories.body);
    result['data'].forEach((data) {
      var model = SkillCategory();
      model.id = data['id'];
      model.name = data['name'];
      print(_skillcategoryList);
      setState(() {
        _skillcategoryList.add(model);
      });
    });
  }


  @override
  void initState() {
    super.initState();
    _getAllStateCategories();
    _getAllSkillCategories();
    date.text = "";
  }

  _showSnackMessage(message) {
    var snackBar = SnackBar(
      content: message,
    );
    //_scaffoldKey.currentState!.showSnackBar(_snackBar);
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(0, 0, 0, 0.10),
      body: Padding(
        padding: const EdgeInsets.only(top: 0.0),
        child: ListView(
          children: <Widget>[
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
                      '               Volunteer Details',
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
            const Divider(
              height: 5.0,
              color: Colors.black,
            ),
            Row(
              children: <Widget>[
                Flexible(
                  flex: 1,
                  fit: FlexFit.tight,
                  child: Container(
                      //alignment: Alignment.center,
                      padding: const EdgeInsets.only(top: 10.0, left: 10.0),
                      child: const Text(
                        'Enter Name *',
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

                        hintText: 'Enter Your Full Name',
                        labelStyle: TextStyle(fontSize: 20.0),

                        errorStyle:
                            TextStyle(color: Colors.redAccent, fontSize: 15),
                      ),
                      controller: name,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please Enter Name';
                        }
                        return null;
                      },
                    ),
                  ),
                )
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
                      padding: const EdgeInsets.only(top: 0.0, left: 10.0),
                      child: const Text(
                        'Mobile No. *',
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

                        hintText: 'Enter Your Mobile No',
                        labelStyle: TextStyle(fontSize: 20.0),

                        errorStyle:
                            TextStyle(color: Colors.redAccent, fontSize: 15),
                      ),
                      controller: mobile,
                      validator: (value) {
                        if (value?.length != 10) {
                          return 'Please Enter Correct Mobile No';
                        }
                        return null;
                      },
                    ),
                  ),
                )
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
                      padding: const EdgeInsets.only(top: 0.0, left: 10.0),
                      child: const Text(
                        'Email ID *',
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

                        hintText: 'Enter Your Email ID',
                        labelStyle: TextStyle(fontSize: 20.0),

                        errorStyle:
                            TextStyle(color: Colors.redAccent, fontSize: 15),
                      ),
                      controller: email,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please Enter Email';
                        } else if (!value.contains('@')) {
                          return 'Please Enter Valid Email';
                        }
                        return null;
                      },
                    ),
                  ),
                )
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
                      padding: const EdgeInsets.only(top: 0.0, left: 10.0),
                      child: const Text(
                        'Birth Date *',
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
              children: [
                Flexible(
                  flex: 1,
                  fit: FlexFit.tight,
                  child: Padding(
                    padding: const EdgeInsets.only(
                        top: 0.0, left: 10.0, right: 10.0),
                    child: Container(
                      //color: Color.fromRGBO(0, 0, 0, 0.10),
                      color: Colors.white,

                      child: TextField(
                        controller: date,
                        //editing controller of this TextField
                        decoration: InputDecoration(
                            icon: Icon(Icons.calendar_today),
                            //icon of text field
                            labelText: "Birth Date" //label text of field
                            ),
                        readOnly: true,
                        //set it true, so that user will not able to edit text
                        onTap: () async {
                          DateTime? pickedDate = await showDatePicker(
                              context: context,
                              initialDate: DateTime.now(),
                              firstDate: DateTime(1950),
                              //DateTime.now() - not to allow to choose before today.
                              lastDate: DateTime(2100));

                          if (pickedDate != null) {
                            print(
                                pickedDate); //pickedDate output format => 2021-03-10 00:00:00.000
                            String formattedDate =
                                new DateFormat('yyyy-MM-dd').format(pickedDate);
                            print(
                                formattedDate); //formatted date output using intl package =>  2021-03-16
                            setState(() {
                              date.text =
                                  formattedDate; //set output date to TextField value.
                            });
                          } else {}
                        },
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
                      padding: const EdgeInsets.only(top: 0.0, left: 10.0),
                      child: const Text(
                        'State *',
                        style: TextStyle(
                            color: Colors.black38,
                            fontWeight: FontWeight.bold,
                            fontSize: 15.0),
                      )),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Flexible(
                  flex: 1,
                  fit: FlexFit.tight,
                  child: Padding(
                    padding: const EdgeInsets.only(
                        top: 14.0, right: 10.0, left: 10.0),
                    child: Container(
                      color: Colors.white,
                      child: Container(
                        decoration: BoxDecoration(
                          // borderRadius: BorderRadius.circular(15.0),
                          border: Border.all(
                              color: Colors.black54,
                              style: BorderStyle.solid,
                              width: 0.80),
                        ),
                        child: DropdownButton<StateCategory>(
                          hint: Text('Select State'),
                          value: _selectedCategory,
                          // The currently selected category
                          items: _statecategoryList.map((category) {
                            return DropdownMenuItem<StateCategory>(
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
                            return _statecategoryList.map<Widget>((category) {
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
                      padding: const EdgeInsets.only(top: 0.0, left: 10.0),
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
            Container(
              padding: const EdgeInsets.only(top: 0.0, left: 10.0, right: 10.0),
              child: TextFormField(
                autofocus: false,
                decoration: InputDecoration(
                  filled: true,
                  //<-- SEE HERE
                  //fillColor: Color.fromRGBO(0, 0, 0, 0.10),
                  fillColor: Colors.white,

                  hintText: 'Street Address',
                  labelStyle: TextStyle(fontSize: 20.0),

                  errorStyle: TextStyle(color: Colors.redAccent, fontSize: 15),
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
                      padding: const EdgeInsets.only(top: 0.0, left: 10.0),
                      child: const Text(
                        'Pin Code. *',
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

                        hintText: 'Enter Your pin',
                        labelStyle: TextStyle(fontSize: 20.0),

                        errorStyle:
                            TextStyle(color: Colors.redAccent, fontSize: 15),
                      ),
                      controller: pin,
                      validator: (value) {
                        if (value?.length != 10) {
                          return 'Please Enter pin';
                        }
                        return null;
                      },
                    ),
                  ),
                )
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
                          top: 0.0, left: 10, right: 10.0),
                      alignment: Alignment.center,
                      child: const Text(
                        'Please indicate areas to volunteer according to your Skills and Interests.',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.black45,
                            fontWeight: FontWeight.bold,
                            fontSize: 13.0),
                      )),
                )
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
                        child: DropdownButton<SkillCategory>(
                          hint: Text('Select Skill'),
                          value: _selectedCategory1,
                          // The currently selected category
                          items: _skillcategoryList.map((category) {
                            return DropdownMenuItem<SkillCategory>(
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
                            return _skillcategoryList.map<Widget>((category) {
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
                    padding: const EdgeInsets.only(
                        top: 0.0, left: 50.0, right: 50),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: Color.fromRGBO(0, 0, 0, 0.03),
                      ),
                      onPressed: () {
                        var registration = Registration();
                        registration.name = name.text;
                        registration.mobile = mobile.text;
                        registration.email = email.text;
                        registration.date = date.text;
                        registration.statecategory =
                            _selectedCategory?.name ?? '';
                        registration.adress = adress.text;
                        registration.pin = pin.text;
                        registration.skillcategory =
                            _selectedCategory1?.name ?? '';
                        _registration(context, registration);

                        clearText();

                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              scrollable: true,
                              backgroundColor: Colors.blueGrey,
                              title: const Text(
                                "Data Saved Successfully ",
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
                      child: const Text('AGREE & SUBMIT',
                          style: TextStyle(
                              color: Colors.black45,
                              fontWeight: FontWeight.bold,
                              fontSize: 18.0)),
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
                      padding: const EdgeInsets.only(
                          top: 0.0, left: 10, right: 10.0),
                      alignment: Alignment.center,
                      child: const Text(
                        'Thanks for Registration.',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.black45,
                            fontWeight: FontWeight.bold,
                            fontSize: 13.0),
                      )),
                )
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

  void _registration(context, Registration registration) async {
    var registrationService = RegistrationService();
    var registrationData =
        await registrationService.addRegistration(registration);
    var result = await json.decode(registrationData.body);

    // if (result['result'] == true) {
    //   Navigator.push(
    //       context,
    //       MaterialPageRoute(
    //           builder: (context) => RegistrationScreen(cartItems: [],)));
    // } else {
    //   _showSnackMessage(const Text(
    //     'Failed to add shipping',
    //     style: TextStyle(color: Colors.red),
    //   ));
    // }
  }
}
