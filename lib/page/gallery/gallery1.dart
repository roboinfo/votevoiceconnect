import 'package:flutter/material.dart';
import 'package:votevoiceconnect/page/gallery/user_model.dart';

import '../../apiServices/api_service.dart';

class gallery1 extends StatefulWidget {
  const gallery1({Key? key}) : super(key: key);

  @override
  State<gallery1> createState() => _gallery1State();
}

class _gallery1State extends State<gallery1> {
  late List<Gallery>? _galleryModel = [];

  @override
  void initState() {
    super.initState();
    _getData();
  }

  void _getData() async {
    _galleryModel = (await ApiServiceGallery().getGallery())!;
    Future.delayed(const Duration(seconds: 1)).then((value) => setState(() {}));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(0, 0, 0, 0.10),
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 90, 90, 90),
        title: Row(
          children: [
            // Icon(
            //   Icons.event,
            //   color: Colors.deepPurple,
            //   size: 30.0,
            // ),
            const Text(
              '              Gallery',
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 22.0),
            ),
          ],
        ),
      ),
      body: _galleryModel == null || _galleryModel!.isEmpty
          ? const Center(
        child: CircularProgressIndicator(),
      )
          : ListView.builder(
        itemCount: _galleryModel!.length,
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
                    _galleryModel![index].featuredImageUrl.toString(),
                    width: double.infinity ,),

                ),


                Row(

                  children: [
                    // Text(_userModel![index].id.toString()),
                    Flexible(
                      flex: 1,
                      fit: FlexFit.tight,
                      child: Text(_galleryModel![index].details.toString(),
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
