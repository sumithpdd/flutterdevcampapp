import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:news_app/app_constants/app_constants.dart';
import 'package:news_app/models/models.dart';
import 'package:url_launcher/url_launcher.dart';

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
      child: InkWell(
        onTap: () async {
          final articleUrl = article.url == null ? AppStrings.missingUrl : article.url!;
          final url = Uri.parse(articleUrl);
          if (!await launchUrl(url)) {
          throw 'Could not launch $url';
          }
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: DecoratedBox(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                ),
                child: CachedNetworkImage(
                  height: 125,
                  width: MediaQuery.of(context).size.width,
                  fit: BoxFit.cover,
                  imageUrl: article.urlToImage == null ? AppStrings.missingImageUrl : article.urlToImage!,
                  placeholder: (context, url) => const SizedBox(
                    height: 60,
                    width: 60,
                    child: Center(child: CircularProgressIndicator()),
                  ),
                  errorWidget: (context, url, error) => const Center(child: Icon(Icons.error_outline_rounded)),
                ),
              ),
            ),
            Text(
              article.title == null ? AppStrings.missingTitle : article.title!,
              style: Theme.of(context).primaryTextTheme.bodyText1,
              overflow: TextOverflow.ellipsis,
            ),
            RichText(
              text: TextSpan(
                style: Theme.of(context).primaryTextTheme.subtitle1,
                children: [
                  TextSpan(
                    text: article.author == null ? AppStrings.missingAuthor : article.author!,
                  ),
                  const WidgetSpan(child: SizedBox(width: 10)),
                  TextSpan(
                    text: DateFormat.yMEd().add_jm().format(
                          DateTime.parse(
                            article.publishedAt == null ? DateTime.now().toString() : article.publishedAt!,
                          ),
                        ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
