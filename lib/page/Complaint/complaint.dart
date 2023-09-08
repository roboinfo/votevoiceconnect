import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:votevoiceconnect/page/drawescreen.dart';
import 'package:votevoiceconnect/page/home2.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(Complaints());
}

class Complaints extends StatefulWidget {
  const Complaints({key}) : super(key: key);

  @override
  _ComplaintsState createState() => _ComplaintsState();
}

class _ComplaintsState extends State<Complaints> {
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();

  final Stream<QuerySnapshot> complaint1 =
  FirebaseFirestore.instance.collection('complaint').snapshots();

  final _formKey = GlobalKey<FormState>();

  var description = "";
  var address = "";


  final descriptionController = TextEditingController();
  final addressController = TextEditingController();


  void dispose() {
    descriptionController.dispose();
    addressController.dispose();


    super.dispose();
  }

  clearText() {
    descriptionController.clear();
    addressController.clear();

  }

  // Adding Registration
  CollectionReference complaint =
  FirebaseFirestore.instance.collection('complaint');

  Future<void> addUser() {
    return complaint
        .add({
      'description': description,
      'address': address,

    })
        .then((value) => print('User Added'))
        .catchError((error) => print('Failed to Add user: $error'));
  }

  //City Dropdown
  var selectedMethod, selectedMethod1;

  final GlobalKey<FormState> _formKeyValue = new GlobalKey<FormState>();
  List<String> _Block = <String>[
    'Block A',
    'Block B',
    'Block C',
    'Block D',
  ];
  List<String> _Complaint = <String>[
    'Electricity, Water and Local Services',
    'Health & Wellness Jobs & Support',
    'Business and Self-employed',
    'Education and Support',
    'Personal and Family Disputes',
  ];



  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _initialization,
      builder: (context, snapshot) {
        // CHeck for Errors
        if (snapshot.hasError) {
          print("Something went Wrong");
        }
        // once Completed, show your application
        if (snapshot.connectionState == ConnectionState.done) {
          return Scaffold(
            //backgroundColor: Colors.white,
            backgroundColor: Color.fromRGBO(0, 0, 0, 0.10),

            appBar: AppBar(
              title: const Text('Register Complaint'),
              backgroundColor: Color.fromARGB(255, 90, 90, 90),

            ),

            body: Form(
              key: _formKey,
              child: SingleChildScrollView(
                child: SafeArea(
                  child: Center(
                    child: Column(
                      children: [
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
                                  const EdgeInsets.only(top: 10.0, left: 20.0),
                                  child: const Text(
                                    'Select Block *',
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
                                    child: DropdownButton(
                                      items: _Block.map((value) => DropdownMenuItem(
                                        child: Text(
                                          value,
                                          style: TextStyle(
                                              color:
                                              Color.fromRGBO(0, 0, 0, 0.70)),
                                        ),
                                        value: value,
                                      )).toList(),
                                      onChanged: (selectedAccountType) {
                                        print('$selectedAccountType');
                                        setState(() {
                                          selectedMethod = selectedAccountType;
                                        });
                                      },
                                      value: selectedMethod,
                                      isExpanded: false,
                                      hint: Padding(
                                        padding: const EdgeInsets.all(10.0),
                                        child: Text(
                                          'Block',
                                          style: TextStyle(
                                              color: Color.fromRGBO(0, 0, 0, 0.70)),
                                        ),
                                      ),
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
                                    child: DropdownButton(
                                      items: _Complaint.map((value) => DropdownMenuItem(
                                        child: Text(
                                          value,
                                          style: TextStyle(
                                              color:
                                              Color.fromRGBO(0, 0, 0, 0.70)),
                                        ),
                                        value: value,
                                      )).toList(),
                                      onChanged: (selectedAccountType) {
                                        print('$selectedAccountType');
                                        setState(() {
                                          selectedMethod1 = selectedAccountType;
                                        });
                                      },
                                      value: selectedMethod1,
                                      isExpanded: false,
                                      hint: Padding(
                                        padding: const EdgeInsets.all(10.0),
                                        child: Text(
                                          'Complaint',
                                          style: TextStyle(
                                              color: Color.fromRGBO(0, 0, 0, 0.70)),
                                        ),
                                      ),
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
                                    'Description',
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
                                  controller: descriptionController,
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
                                  controller: addressController,
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
                                  onPressed: () {
                                    if (_formKey.currentState!.validate()) {
                                      setState(() {
                                        Map<String, dynamic> data = {
                                          "description": descriptionController.text,
                                          "address": addressController.text,

                                          "Block": selectedMethod.toString(),
                                          "Complaint": selectedMethod1.toString(),
                                        };

                                        FirebaseFirestore.instance
                                            .collection('complaint')
                                            .add(data);

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
                                      });
                                    }
                                    ;
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

                        Row(
                          children: <Widget>[
                            Flexible(
                              flex: 1,
                              fit: FlexFit.tight,
                              child: Container(
                                  alignment: Alignment.center,
                                  padding: const EdgeInsets.only(top: 0.0),
                                  child: const Text(
                                    'Manage Complaint',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color: Colors.black38,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 17.0),
                                  )),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        }
        return CircularProgressIndicator();
      },
    );
  }
}