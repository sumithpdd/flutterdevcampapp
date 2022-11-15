import 'package:flutter/material.dart';

typedef VoidBoolCallback = void Function(bool T);

class CategoryItem extends StatelessWidget {
  final String categoryName;
  final bool isSelected;
  final VoidBoolCallback? onSelected;

  const CategoryItem({
    super.key,
    required this.categoryName,
    required this.isSelected,
    this.onSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 10.0),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
        child: ChoiceChip(
          selectedColor: Theme.of(context).colorScheme.secondary,
          label: Text(
            categoryName,
            style: Theme.of(context).primaryTextTheme.bodyText1,
          ),
          selected: isSelected,
          onSelected: onSelected,
        ),
      ),
    );
  }
}
