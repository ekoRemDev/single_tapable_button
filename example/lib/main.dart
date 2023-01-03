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
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text('Loader enabled Examples'),
          Center(
            child: SingleTapableButton(
              buttonType: ButtonType.elevatedButton,
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
          const SizedBox(height: 20),
          Center(
            child: SingleTapableButton(
              buttonType: ButtonType.textButton,
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
          const SizedBox(height: 20),
          Center(
            child: SingleTapableButton(
              buttonType: ButtonType.iconButton,
              width: 40,
              icon: const Icon(Icons.ac_unit),
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
          const SizedBox(height: 20),
          Center(
            child: SingleTapableButton(
              buttonType: ButtonType.listItem,
              width: 40,
              child: const Icon(Icons.ac_unit),
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
          const SizedBox(height: 20),
          Center(
            child: SingleTapableButton(
              buttonType: ButtonType.outlinedButton,
              width: 400,
              backgroundColor: Colors.white,
              borderColor: Colors.black,
              child: const Text('ButtonType.outlinedButton'),
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

          const Divider(height: 1,),
          const Text('Loader disabled Examples'),
          Center(
            child: SingleTapableButton(
              buttonType: ButtonType.elevatedButton,
              width: 400,
              isLoaderEnabled: false,
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
          const SizedBox(height: 20),
          Center(
            child: SingleTapableButton(
              buttonType: ButtonType.textButton,
              width: 400,
              isLoaderEnabled: false,
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
          const SizedBox(height: 20),
          Center(
            child: SingleTapableButton(
              buttonType: ButtonType.iconButton,
              width: 40,
              isLoaderEnabled: false,
              icon: const Icon(Icons.ac_unit),
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
          const SizedBox(height: 20),
          Center(
            child: SingleTapableButton(
              buttonType: ButtonType.listItem,
              width: 40,
              isLoaderEnabled: false,
              child: const Icon(Icons.ac_unit),
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
          const SizedBox(height: 20),
          Center(
            child: SingleTapableButton(
              buttonType: ButtonType.outlinedButton,
              width: 400,
              backgroundColor: Colors.white,
              borderColor: Colors.black,
              isLoaderEnabled: false,
              child: const Text('ButtonType.outlinedButton'),
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
        ],
      ),
    );
  }
}
