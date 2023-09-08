import 'package:flutter/material.dart';
import 'package:votevoiceconnect/apiServices/api_service.dart';
import 'package:votevoiceconnect/event/user_model.dart';


class events1 extends StatefulWidget {
  const events1({Key? key}) : super(key: key);

  @override
  State<events1> createState() => _events1State();
}

class _events1State extends State<events1> {

  late List<Event>? _eventModel = [];

  @override
  void initState() {
    super.initState();
    _getData();
  }

  void _getData() async {
    _eventModel = (await ApiServiceEvent().getEvent())!;
    Future.delayed(const Duration(seconds: 1)).then((value) => setState(() {}));
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: Colors.white,
      backgroundColor: Color.fromRGBO(0, 0, 0, 0.10),

      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 90, 90, 90),
        title: Row(
          children: [
            // Icon(Icons.event,
            //   color: Colors.deepPurple,
            //   size: 30.0,
            // ),
            const Text(
              '               Events',
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 22.0),
            ),
          ],
        ),
      ),

      body: _eventModel == null || _eventModel!.isEmpty
          ? const Center(
        child: CircularProgressIndicator(),
      )
          : ListView.builder(
        itemCount: _eventModel!.length,
        itemBuilder: (context, index) {
          return Card(
            child: Column(
              children: [

                // Row(
                //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                //   children: [
                //     // Text(_userModel![index].id.toString()),
                //     Text(_articleModel![index].title.toString()),
                //   ],
                // ),

                Container(
                  padding: const EdgeInsets.only(top: 5.0),
                  child: Image.network(
                    _eventModel![index].featuredImageUrl.toString(),
                    width: double.infinity ,),

                ),


                Row(

                  children: [
                    // Text(_userModel![index].id.toString()),
                    Flexible(
                      flex: 1,
                      fit: FlexFit.tight,
                      child: Text(_eventModel![index].details.toString(),
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.black45,
                            fontWeight: FontWeight.bold,
                            fontSize: 17.0),
                      ),
                    ),
                  ],
                ),


              ],
            ),
          );
        },
      ),
    );
  }
}
