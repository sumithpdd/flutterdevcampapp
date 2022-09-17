import 'package:devcamp_session1/models/data.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    title: 'Travel App',
    theme: ThemeData(
      primarySwatch: Colors.blue,
    ),
    home: const HomePage(),
  ));
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const headerImgLink =
        'https://img.freepik.com/premium-vector/travel-concept-vector-illustration-with-famous-sights-accessories_95169-98.jpg?w=1800';

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Travel App'),
        backgroundColor: Colors.red.shade800,
      ),
      body: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Image.network(
          headerImgLink,
          fit: BoxFit.contain,
        ),
        const SizedBox(
          height: 10.0,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              height: 50,
              width: 100,
              decoration: BoxDecoration(
                  color: Colors.red.shade800,
                  borderRadius: BorderRadius.circular(8.0)),
              child: Center(
                child: Text(
                  pagesList[0],
                  style: const TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            Container(
              height: 50,
              width: 100,
              decoration: BoxDecoration(
                  color: Colors.red.shade800,
                  borderRadius: BorderRadius.circular(8.0)),
              child: Center(
                child: Text(
                  pagesList[1],
                  style: const TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            Container(
              height: 50,
              width: 100,
              decoration: BoxDecoration(
                  color: Colors.red.shade800,
                  borderRadius: BorderRadius.circular(8.0)),
              child: Center(
                child: Text(
                  pagesList[2],
                  style: const TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 20.0,
        ),
        const Padding(
          padding: EdgeInsets.all(8.0),
          child: Text(
            'Popular Destination',
            style: TextStyle(
              fontSize: 18.0,
            ),
          ),
        ),
      ]),
    );
  }
}
