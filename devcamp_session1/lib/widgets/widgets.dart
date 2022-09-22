import 'package:devcamp_session1/models/destination.dart';
import 'package:flutter/material.dart';

class MyCustomContainer extends StatelessWidget {
  final String text;
  const MyCustomContainer({
    Key? key,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: 100,
      decoration: BoxDecoration(
          color: Colors.red.shade800,
          borderRadius: BorderRadius.circular(12.0)),
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
}

class MyCustomStack extends StatelessWidget {
  final Destination data;
  const MyCustomStack({
    Key? key,
    required this.data,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        Image.network(data.cityImage),
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
                data.cityName,
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
}
