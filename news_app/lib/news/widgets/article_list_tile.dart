import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:news_app/app_constants/app_constants.dart';
import 'package:news_app/news/models/models.dart';
import 'package:url_launcher/url_launcher.dart';

class ArticleListTileListView extends StatelessWidget {
  final List<Article> articles;

  const ArticleListTileListView({
    Key? key,
    required this.articles,
  }) : super(key: key);
  // TODO (Joshua): Add a saved icon that users will be able to use to save articles
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: const ScrollPhysics(),
      shrinkWrap: true,
      itemCount: articles.length,
      itemBuilder: (context, index) {
        return Card(
          clipBehavior: Clip.antiAlias,
          color: Theme.of(context).colorScheme.onTertiaryContainer,
          child: ListTile(
            dense: true,
            leading: ClipRRect(
              borderRadius: BorderRadius.circular(4),
              child: CachedNetworkImage(
                height: 120,
                width: 80,
                fit: BoxFit.cover,
                imageUrl: articles[index].urlToImage == null ? AppStrings.missingImageUrl : articles[index].urlToImage!,
                placeholder: (context, url) => SizedBox(
                  height: 60,
                  width: 40,
                  child: Center(
                    child: CircularProgressIndicator(
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ),
                ),
                errorWidget: (context, url, error) => const Icon(Icons.error_outline_rounded),
              ),
            ),
            title: Text(
              articles[index].title == null ? AppStrings.missingTitle : articles[index].title!,
              style: Theme.of(context).primaryTextTheme.bodyText1,
            ),
            subtitle: RichText(
              text: TextSpan(
                style: Theme.of(context).primaryTextTheme.subtitle2,
                children: [
                  TextSpan(
                    text: articles[index].author == null ? AppStrings.missingAuthor : articles[index].author!,
                  ),
                  const WidgetSpan(child: SizedBox(width: 10)),
                  TextSpan(
                    text: articles[index].publishedAt == null
                        ? AppStrings.missingDate
                        : DateFormat.yMEd().add_jm().format(DateTime.parse(articles[index].publishedAt!)),
                  ),
                ],
              ),
            ),
            onTap: () async {
              final articleUrl = articles[index].url == null ? AppStrings.missingUrl : articles[index].url!;
              final url = Uri.parse(articleUrl);
              if (!await launchUrl(url, mode: LaunchMode.externalApplication)) {
                throw 'Could not launch $url';
              }
            },
          ),
        );
      },
    );
  }
}
