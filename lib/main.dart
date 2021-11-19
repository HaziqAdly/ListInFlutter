//Assignment 1: Using List in Flutter
//CSCI 4311 MOBILE APPLICATION DEVELOPMENT
//Created by: Muhammad Haziq Adli bin Zamzuri (1814981)

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mobile App: Using List in Flutter',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List animalList = ['Tiger', 'Cat', 'Bird', 'Elephant', 'Fish', 'Dog'];

  //A controller for an editable text field
  final TextEditingController _controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    _controller.addListener(() {
      final String text = _controller.text.toLowerCase();
      _controller.value = _controller.value.copyWith(
        text: text,
        selection:
            TextSelection(baseOffset: text.length, extentOffset: text.length),
        composing: TextRange.empty,
      );
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Enter a number between 0-5:'),
      ),
      body: Padding(
          padding: const EdgeInsets.all(20.0),
        child: TextField(
          controller: _controller,
        ),
      ),
      //Show dialog box containing animal name based on the input number that the user entered
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                content: Text(animalList[int.parse(_controller.text)]),
              );
            },
          );
        },
        child: const Icon(Icons.search),
      ),
    );
  }
}