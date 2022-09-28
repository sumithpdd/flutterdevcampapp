import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class HeadlineSection extends StatelessWidget {
  const HeadlineSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).colorScheme.primary,
      child: CarouselSlider.builder(
        itemCount: 50,
        options: CarouselOptions(
          aspectRatio: 2.0,
          enlargeCenterPage: true,
          autoPlay: true,
        ),
        itemBuilder: (ctx, index, realIdx) {
          return Center(child: Text(index.toString(), style: Theme.of(context).textTheme.headline1,));
        },
      ),
    );
  }
}
