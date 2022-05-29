import 'package:expand_hit_test/expand_hit_test.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Example1 extends StatelessWidget {
  const Example1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title:const Text("Example1")),
        body: SingleChildScrollView(child: Column(children: [
          //inkwell
          Row(children: [
            InkWell(
                onTap: () {
                  debugPrint("Inkwell tap");
                },
                child:
                    Container(color: Colors.yellow, height: 100, width: 100)),
            const SizedBox(width: 200),
            ExpandInkWell(
                expandArea:const EdgeInsets.all(30),
                onTap: () {
                  debugPrint("expand inkwell tap");
                },
                child: Container(color: Colors.red, height: 100, width: 100))
          ]),
          const SizedBox(height: 100),
          //gesture
          Row(children: [
            GestureDetector(
                onTap: () {
                  debugPrint("GestureDetector tap");
                },
                child:
                    Container(color: Colors.yellow, height: 100, width: 100)),
            const SizedBox(width: 200),
            ExpandGestureDetector(
                expandArea:const EdgeInsets.all(30),
                onTap: () {
                  debugPrint("expand GestureDetector tap");
                },
                child: Container(color: Colors.red, height: 100, width: 100))
          ]),

          const SizedBox(height: 100),
          //custom
          Row(children: [
            CupertinoButton(
                padding: EdgeInsets.zero,
                onPressed: () {
                  debugPrint("CupertinoButton tap");
                },
                child:
                    Container(color: Colors.yellow, height: 100, width: 100)),
            const SizedBox(width: 200),
            ExpandHitTestWidget(
                expandArea:const EdgeInsets.all(30),
                child: CupertinoButton(padding: EdgeInsets.zero,child: Container(color: Colors.red, height: 100, width: 100), onPressed: () {
                  debugPrint("expand CupertinoButton tap");
                }))
          ])
        ])));
  }
}
