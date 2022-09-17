import 'package:devcamp_session1/models/data.dart';
import 'package:flutter/material.dart';

Widget buildContainer(String text) {
  return Container(
    height: 50,
    width: 100,
    decoration: BoxDecoration(
        color: Colors.red.shade800, borderRadius: BorderRadius.circular(12.0)),
    child: Center(
      child: Text(
        text,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 20,
        ),
      ),
    ),
  );
}

Widget buildStack(Data sample) {
  return Stack(
    fit: StackFit.expand,
    children: [
      Image.network(sample.cityImage),
      Positioned(
        bottom: 0,
        right: 0,
        left: 0,
        child: Container(
          height: 30,
          decoration: BoxDecoration(
            color: Colors.red.shade800,
          ),
          child: Center(
            child: Text(
              sample.cityName,
              style: const TextStyle(
                fontSize: 20,
                color: Colors.white,
              ),
            ),
          ),
        ),
      )
    ],
  );
}
