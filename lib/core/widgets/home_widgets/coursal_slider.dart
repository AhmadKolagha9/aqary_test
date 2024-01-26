import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import '../../../model/slider_model.dart';

class CustomCarousalSlider extends StatelessWidget {

  final List<SliderModel> sliderItems;
  const CustomCarousalSlider({super.key, required this.sliderItems});

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      items: sliderItems.map((item) {
        return Builder(
          builder: (BuildContext context) {
            return  Image.asset(
              item.imgUrl,
              fit: BoxFit.cover,
            );
          },
        );
      }).toList(),
      options: CarouselOptions(
        height: 200, // Adjust height as needed
        autoPlay: true,
        enlargeCenterPage: true,
        aspectRatio: 16 / 9,
        viewportFraction: 0.8,
        initialPage: 0,
        enableInfiniteScroll: true,
        reverse: false,
        autoPlayInterval: const Duration(seconds: 3),
        autoPlayAnimationDuration: const Duration(milliseconds: 800),
        autoPlayCurve: Curves.fastOutSlowIn,
        onPageChanged: (index, reason) {
          // Handle page change events if needed
        },
      ),
    )
    ;
  }
}
