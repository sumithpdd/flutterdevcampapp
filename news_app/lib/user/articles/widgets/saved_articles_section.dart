import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:news_app/user/articles/providers/user_saved_articles_provider.dart';

class SavedArticlesSection extends ConsumerWidget {
  const SavedArticlesSection({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final articles = ref.watch(userSavedArticlesProvider);
    return Container();
  }
}
