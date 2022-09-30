import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:news_app/models/models.dart';

class HeadlineCard extends StatelessWidget {
  final Article article;

  const HeadlineCard({
    Key? key,
    required this.article,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAlias,
      child: Column(
        children: [
          DecoratedBox(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
            ),
            child: Ink.image(
              image: NetworkImage(article.urlToImage!),
              height: 240,
              fit: BoxFit.cover,
            ),
          ),
          Text(
            article.title!,
            style: Theme.of(context).textTheme.headline2,
          ),
          RichText(
            text: TextSpan(
              style: Theme.of(context).textTheme.subtitle1,
              children: [
                TextSpan(
                  text: article.author!,
                ),
                const WidgetSpan(child: SizedBox(width: 10)),
                TextSpan(
                  text: DateFormat.yMEd().add_jms().format(DateTime.now()),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
