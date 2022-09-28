import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class HeadlineSection extends StatelessWidget {
  const HeadlineSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).colorScheme.onTertiaryContainer,
      child: CarouselSlider.builder(
        itemCount: 100,
        options: CarouselOptions(
          aspectRatio: 2.0,
          enlargeCenterPage: true,
          autoPlay: true,
        ),
        itemBuilder: (ctx, index, realIdx) {
          return Center(child: Text(index.toString()));
        },
      ),
    );
  }
}
