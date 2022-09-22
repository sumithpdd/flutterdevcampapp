import 'package:flutter/material.dart';
import 'package:recipe_app_ui/constants/strings.dart';

class SearchBox extends StatelessWidget {
  const SearchBox({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const TextField(
      decoration: InputDecoration(
        border: OutlineInputBorder(),
        hintText: searchTextFieldHint,
        hintStyle: TextStyle(
          color: Colors.black,
        ),
        fillColor: Colors.white,
        filled: true,
      ),
    );
  }
}
