import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:votevoiceconnect/page/drawescreen.dart';

class AdminHome extends StatefulWidget {
  const AdminHome({super.key});

  @override
  State<AdminHome> createState() => _AdminHomeState();
}

class _AdminHomeState extends State<AdminHome> {

  int index = 0;
  final storage = new FlutterSecureStorage();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Color.fromRGBO(0, 0, 0, 0.10),
      appBar: AppBar(
        title: const Text('Admin Home Screen',
            style: TextStyle(color: Colors.black)),
        iconTheme: IconThemeData(color: Colors.black),
        backgroundColor: Colors.white,

      ),

      drawer: DrawerScreen(),

    body: SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.only(top: 80.0),
        child: Center(
          child: Text("Admin Dashboard",style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold,color: Colors.blue),

          ),
        ),
      ),
    ),


    );
  }
}
