import 'package:flutter/material.dart';

class ItemWrapper extends StatefulWidget {
  final Widget child;

  const ItemWrapper({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  State<ItemWrapper> createState() => _ItemWrapperState();
}

class _ItemWrapperState extends State<ItemWrapper> with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    )..forward();

    _scaleAnimation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.easeOut,
      ),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ScaleTransition(
      scale: _scaleAnimation,
      child: widget.child,
    );
  }
}
