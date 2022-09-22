import 'package:flutter/material.dart';
import 'package:recipe_app_ui/constants/constants.dart';

class FilterListView extends StatelessWidget {
  const FilterListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Icon(
          Icons.tune_outlined,
          color: Colors.white,
        ),
        Expanded(
          child: ListView.builder(
            physics: const ScrollPhysics(),
            scrollDirection: Axis.horizontal,
            shrinkWrap: true,
            itemCount: categoryList.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Container(
                  width: 60,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.blue.shade900,
                  ),
                  child: Center(
                    child: Text(
                      categoryList[index],
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 10
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
