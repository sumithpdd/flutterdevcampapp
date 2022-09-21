import 'package:devcamp_session1/details_page.dart';
import 'package:devcamp_session1/models/data.dart';
import 'package:devcamp_session1/widgets/widgets.dart';
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
    final List<String> pagesList = [
      'Attraction',
      'Places',
      'Hotels',
    ];
    const headerImgLink =
        'https://img.freepik.com/premium-vector/travel-concept-vector-illustration-with-famous-sights-accessories_95169-98.jpg?w=1800';

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Travel App'),
        backgroundColor: Colors.red.shade800,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(
              headerImgLink,
              fit: BoxFit.contain,
            ),
            const SizedBox(
              height: 20.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                MyCustomContainer(text: pagesList[0]),
                MyCustomContainer(text: pagesList[1]),
                MyCustomContainer(text: pagesList[2]),
              ],
            ),
            const SizedBox(
              height: 20.0,
            ),
            const Padding(
              padding: EdgeInsets.only(left: 12.0),
              child: Text(
                'Popular Destination',
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 12.0, right: 12.0),
              child: GridView.builder(
                physics: const ScrollPhysics(),
                shrinkWrap: true,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 30,
                  mainAxisSpacing: 10,
                ),
                itemCount: dataList.length,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => DetailPage(city: dataList[index]),
                        ),
                      );
                    },
                    child: MyCustomStack(
                      data: dataList[index],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
