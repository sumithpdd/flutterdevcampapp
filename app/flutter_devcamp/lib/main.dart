import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'helpers/app_constants.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'FlutterDevcamp - 2022 - Welcome',
      theme: ThemeData(
        primaryColor: AppConstants.hexToColor(AppConstants.appPrimaryColor),
        backgroundColor: AppConstants.hexToColor(AppConstants.appBackgroundColor),
        primaryColorLight: AppConstants.hexToColor(AppConstants.appPrimaryColorLight),
        dividerColor: AppConstants.hexToColor(AppConstants.appBackgroundColorGray),
        textTheme: TextTheme(
          caption: TextStyle(color: AppConstants.hexToColor(AppConstants.appPrimaryFontColorWhite)),
        ),
      ),
      home: const MyHomePage(title: 'FlutterDevcamp - 2022 - Welcome'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 1;
  final nameController = TextEditingController();
  String name = "Marius";
  var currentDay = DateTime.now().day;
  void _printLatestValue() {
    setState(() {
      name = nameController.text;
    });
  }

  var e = 4;
  @override
  void initState() {
    super.initState();

    // Start listening to changes.
    nameController.addListener(_printLatestValue);
  }

  void _incrementCounter() {
    setState(() {
      (currentDay < _counter) ? _counter = 1 : _counter++;
    });
  }

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    nameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        elevation: 4,
        backgroundColor: Colors.red,
        title: Text(widget.title),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 8.0, top: 30.0),
            child: Card(
              semanticContainer: true,
              clipBehavior: Clip.antiAliasWithSaveLayer,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              elevation: 5,
              margin: const EdgeInsets.all(10),
              child: Stack(children: [
                Image.asset(
                  "assets/images/flutterdevcamp2022_banner.png",
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    '#flutterdevcamp - London ${DateFormat.MMMMd().format(DateTime.now())} ',
                    style: TextStyle(
                      color: AppConstants.hexToColor(AppConstants.appPrimaryColorLight),
                      fontSize: 24,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ]),
            ),
          ),
          Text(
            '😍 ${name.isEmpty ? "I love" : "$name loves"} this Devcamp 😍',
            style: Theme.of(context).textTheme.headline5,
          ),
          Text(
            currentDay == _counter ? "🪙" : "$_counter times ",
            style: Theme.of(context).textTheme.headline2,
          ),
          Text(
            currentDay == _counter ? "🪙" : "$_counter times de review ",
            style: Theme.of(context).textTheme.headline2,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Enter your name',
              ),
              controller: nameController,
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Like',
        child: const Icon(Icons.favorite, color: Colors.red),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
