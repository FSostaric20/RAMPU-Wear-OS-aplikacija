import 'package:flutter/material.dart';
import 'package:wear/wear.dart';
import 'package:wearable_communicator/wearable_communicator.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold( backgroundColor: Colors.white,
      body: Center(
        child: WatchShape(
          builder: (BuildContext context, WearShape shape, Widget? child) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  'Shape: ${shape == WearShape.round ? 'round' : 'square'}',
                ),
                child!,
              ],
            );
          },
          child: AmbientMode(
            builder: (BuildContext context, WearMode mode, Widget? child) {
              return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      'Mode: ${mode == WearMode.active ? 'Active' : 'Ambient'}',
                    ),
                    child!,
                  ]);
            },
            child: AmbientMode(builder:
                (BuildContext context, WearMode mode, Widget? child) {
              if (mode != WearMode.ambient) {
                return const Center(
                    child: ElevatedButton(
                        onPressed: onPressed, child: Text('Pošalji Toast')));
              } else {
                return const Center(
                    child: Text(
                        'Sat mora biti u aktivnom modu za slanje toasta',
                        textAlign: TextAlign.center));
              }
            }),
          ),
        ),
      ),
    ),
    );

  }
}

void onPressed() {
  WearableCommunicator.sendMessage(
      {"text": "Poslan vam je Toast sa pametnog sata", "integerValue": 1});
}
