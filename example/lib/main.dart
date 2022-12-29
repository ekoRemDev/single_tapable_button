import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:single_tapable_buttons/single_tapable_buttons.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Single Tapable Button Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Demo Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: SingleTapableButton(
          width: 400,
          child: const Text('Tap me now...'),
          onPressed: (StreamSink<bool> canBePressed) async {
            // Do whatever has to be done

            if (kDebugMode) {
              print('Button is pressed');
            }

            // we are doing api call and it takes time

            // Make button tappable again
            Future.delayed(
              const Duration(milliseconds: 2000),
              () => canBePressed.add(true),
            );
            // canBePressed.add(true);
          },
        ),
      ),
    );
  }
}
