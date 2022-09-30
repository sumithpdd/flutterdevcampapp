import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:news_app/models/models.dart';
import 'package:news_app/widgets/widgets.dart';

class HeadlineSection extends StatelessWidget {
  final List<Article> fetchedHeadlines;

  const HeadlineSection({
    Key? key,
    required this.fetchedHeadlines,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).colorScheme.onTertiaryContainer,
      child: CarouselSlider.builder(
              itemCount: fetchedHeadlines.length,
              options: CarouselOptions(
                aspectRatio: 2.0,
                enlargeCenterPage: false,
                autoPlay: true,
              ),
              itemBuilder: (ctx, index, realIdx) {
                return HeadlineCard(article: fetchedHeadlines[index]);
              },
            ),
    );
  }
}
