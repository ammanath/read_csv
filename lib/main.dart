import 'package:flutter/material.dart';
import 'dart:io';
import 'dart:async';
import 'dart:convert';

void main() {
  runApp(ReadCsv());
}

class ReadCsv extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Read CSV file',
      theme: ThemeData(
        primarySwatch: Colors.red,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: ReadCsvHomePage(title: 'Read CSV Home Page'),
    );
  }
}

class ReadCsvHomePage extends StatefulWidget {
  ReadCsvHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _ReadCsvHomePageState createState() => _ReadCsvHomePageState();
}

class _ReadCsvHomePageState extends State<ReadCsvHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  void processFile() {
    //TODO: Fix to read file with correct path
    File data = new File("../winequality-red.csv");
    data.readAsLines().then(processLines).catchError((e) => handleError(e));
  }

  processLines(List<String> lines) {
    // process lines:
    for (var line in lines) {
      print(line);
    }
  }

  handleError(e) {
    print("An error...");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}
