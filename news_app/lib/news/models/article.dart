import 'package:equatable/equatable.dart';
import 'package:news_app/app_constants/app_constants.dart';
import 'package:news_app/news/models/models.dart';
import 'package:uuid/uuid.dart';

class Article extends Equatable with Comparable<Article> {
  final Source? source;
  final String? author;
  final String? title;
  final String? description;
  final String? url;
  final String? urlToImage;
  final String? publishedAt;
  final String? content;
  final bool isSaved;
  final String uuid;

  Article({
    required this.source,
    required this.author,
    required this.title,
    required this.description,
    required this.url,
    required this.urlToImage,
    required this.publishedAt,
    required this.content,
    required this.isSaved,
    String? uuid,
  }) : uuid = uuid ?? const Uuid().v4();

  Article copy({required bool isSaved}) => Article(
    source: source,
    author: author,
    title: title,
    description: description,
    url: url,
    urlToImage: urlToImage,
    publishedAt: publishedAt,
    content: content,
    isSaved: isSaved,
    uuid: uuid,
  );

  factory Article.fromJson(Map<String, dynamic> json) {
    return Article(
      source: json['source'] != null ? Source.fromJson(json['source']) : null,
      author: json['author'],
      title: json['title'],
      description: json['description'],
      url: json['url'],
      urlToImage: json['urlToImage'],
      publishedAt: json['publishedAt'] ?? AppStrings.missingDate,
      content: json['content'],
      isSaved: json['isSaved'] ?? false,
    );
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};

    if (source != null) {
      data.addAll({'source': source!.toJson()});
    }
    data.addAll({'author': author});
    data.addAll({'title': title});
    data.addAll({'description': description});
    data.addAll({'url': url});
    data.addAll({'urlToImage': urlToImage});
    data.addAll({'publishedAt': publishedAt});
    data.addAll({'content': content});

    return data;
  }

  @override
  List<Object?> get props => [
        source,
        author,
        title,
        description,
        url,
        urlToImage,
        publishedAt,
        content,
      ];

  @override
  int compareTo(other) {
    return other.publishedAt!.compareTo(publishedAt!);
  }
}
