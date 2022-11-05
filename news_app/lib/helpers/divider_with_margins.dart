import 'package:flutter/material.dart';

class DividerWithMargins extends StatelessWidget {
  final double marginHeight;

  const DividerWithMargins({
    required this.marginHeight,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: marginHeight,
        ),
        const Divider(),
        SizedBox(
          height: marginHeight,
        )
      ],
    );
  }
}
