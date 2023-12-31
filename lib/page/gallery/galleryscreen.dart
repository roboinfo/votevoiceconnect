import 'package:flutter/material.dart';
import 'package:votevoiceconnect/page/gallery/user_model.dart';

import '../../apiServices/api_service.dart';
import 'gallery1.dart';

class GalleryScreen extends StatefulWidget {
  const GalleryScreen({Key? key}) : super(key: key);

  @override
  State<GalleryScreen> createState() => _GalleryScreenState();
}

class _GalleryScreenState extends State<GalleryScreen> {
  late List<Gallery>? _galleryModel = [];
  List<String> displayedCategories = [];
  String? selectedCategory;

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
      body: Column(
        children: <Widget>[
          const SizedBox(
            height: 4,
          ),
          Expanded(
            child: _galleryModel == null || _galleryModel!.isEmpty
                ? const Center(child: CircularProgressIndicator())
                : ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: _galleryModel!.length,
              itemBuilder: (context, index) {
                String category = _galleryModel![index].categoryId.toString();

                if (!displayedCategories.contains(category)) {
                  displayedCategories.add(category);

                  return Container(
                    color: Colors.white,
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            alignment: Alignment.centerLeft,
                            child: ClipOval(
                              child: Image.network(
                                _galleryModel![index].featuredImageUrl.toString(),
                                width: 100,
                                height: 80,
                              ),
                            ),
                          ),
                        ),
                        Flexible(
                          flex: 1,
                          fit: FlexFit.tight,
                          child: Padding(
                            padding: const EdgeInsets.all(6.0),
                            child: Text(
                              category,
                              textAlign: TextAlign.start,
                              style:
                              TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),

                        if (selectedCategory == category)
                          Icon(Icons.arrow_drop_down_circle_outlined),


                      ],
                    ),
                  );
                } else {
                  return Container(); // If the category has been displayed, show an empty container
                }
              },
            ),
          ),




        ],
      ),
    );
  }
}
