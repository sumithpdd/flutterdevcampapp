import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:news_app/animations/animations.dart';
import 'package:news_app/news/news.dart';

class CategoryPicker extends ConsumerWidget {
  const CategoryPicker({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      height: 30,
      width: double.infinity,
      child: ListView.builder(
        padding: const EdgeInsets.only(left: 8.0),
        scrollDirection: Axis.horizontal,
        physics: const ScrollPhysics(),
        itemCount: ArticleCategory.values.length,
        itemBuilder: (context, index) {
          final category = ArticleCategory.values[index];
          final isSelected = category == ref.watch(currentCategoryProvider);

          return ItemWrapper(
            child: CategoryItem(
              categoryName: category.name,
              isSelected: isSelected,
              onSelected: (bool _) => ref
                  .read(
                currentCategoryProvider.notifier,
              )
                  .state = category,
            ),
          );
        },
      ),
    );
  }
}