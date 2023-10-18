
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:votevoiceconnect/ecom/services/slider_service.dart';
import 'package:shimmer/shimmer.dart';

class carouselSlider extends StatefulWidget {
  const carouselSlider({Key? key}) : super(key: key);

  @override
  State<carouselSlider> createState() => _carouselSliderState();
}

class _carouselSliderState extends State<carouselSlider> {
  var _selectedIndex = 0;
  SliderService _sliderService = SliderService();
  final List<String> items = [];

  @override
  void initState() {
    super.initState();
    _getAllSliders();
  }

  _getAllSliders() async {
    var sliders = await _sliderService.getSliders();
    var result = json.decode(sliders.body);
    result['data'].forEach((data) {
      setState(() {
        items.add(data['image_url'].toString());
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    if (items.isEmpty) {
      // Handle the case when the items list is empty
      return
        Shimmer.fromColors(
          baseColor: Colors.grey.withOpacity(0.25),
          highlightColor: Colors.grey.withOpacity(0.6),
          period: Duration(seconds: 2),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 18),
            child: Container(
              height: 190,
              decoration: BoxDecoration(
                color: Colors.white, // You can change this to any color you like
                borderRadius: BorderRadius.circular(15.0),
              ),
            ),
          ),
        );
    }

    return Column(
      children: [
        Container(
          margin: EdgeInsets.symmetric(vertical: 2.0),
          height: 140,
          width: 500,
          child: CarouselSlider.builder(
            itemCount: items.length,
            itemBuilder: (context, index, realIndex) {
              var _scale = _selectedIndex == index ? 1.0 : 0.8;
              return TweenAnimationBuilder(
                duration: const Duration(milliseconds: 350),
                tween: Tween(begin: _scale, end: _scale),
                curve: Curves.ease,
                builder: (context, value, child) {
                  return Transform.scale(
                    scale: value,
                    child: child,
                  );
                },
                child: Container(
                  margin: EdgeInsets.symmetric(vertical: 2.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15.0),
                    image: DecorationImage(
                      image: NetworkImage(items[index]),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              );
            },
            options: CarouselOptions(
              aspectRatio: 16 / 9,
              autoPlay: true,
              autoPlayCurve: Curves.fastOutSlowIn,

              onPageChanged: (index, reason) {
                setState(() {
                  _selectedIndex = index;
                });
              },
            ),
          ),
        ),
        // this code for below dots ... on slider images
        // Row(
        //   mainAxisAlignment: MainAxisAlignment.center,
        //   children: [
        //     ...List.generate(
        //       items.length,
        //           (index) => Indicator(
        //         isActive: _selectedIndex == index,
        //       ),
        //     )
        //   ],
        // )
      ],
    );
  }
}

class Indicator extends StatelessWidget {
  final bool isActive;

  const Indicator({
    Key? key,
    required this.isActive,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 350),
      margin: EdgeInsets.symmetric(horizontal: 4.0),
      width: isActive ? 8.0 : 8.0,
      height: 8.0,
      decoration: BoxDecoration(
        color: isActive ? Colors.green[400] : Colors.grey[300],
        borderRadius: BorderRadius.circular(8.0),
      ),
    );
  }
}