import 'package:example/example1.dart';
import 'package:example/example2.dart';
import 'package:example/example3.dart';
import 'package:example/example4.dart';
import 'package:expand_hit_test/expand_hit_test.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  ExpandHitTestConfigs.showDebugArea = true;
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text("Expand hit test example")),
        body: Column(children: [
          CupertinoButton(
              child: const Text("example1"),
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (BuildContext context) => const Example1(),
                ));
              }),
          CupertinoButton(
              child: const Text("example2"),
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (BuildContext context) => const Example2(),
                ));
              }),
          CupertinoButton(
              child: const Text("example3"),
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (BuildContext context) => const Example3(),
                ));
              }),
          CupertinoButton(
              child: const Text("example4"),
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (BuildContext context) => const Example4(),
                ));
              })
        ]));
  }
}
