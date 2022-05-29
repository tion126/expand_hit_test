import 'package:expand_hit_test/expand_hit_test.dart';
import 'package:flutter/material.dart';

class Example4 extends StatelessWidget {
  const Example4({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text("Example4")),
        body: ExpandHitTestScope(
            child: ListView.builder(itemBuilder: (context, index) {
          return Container(
              padding: const EdgeInsets.all(16),
              margin: const EdgeInsets.symmetric(vertical: 30),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("item $index"),
                    const SizedBox(height: 20),
                    Row(children: [
                      ExpandInkWell(
                        expandArea: const EdgeInsets.only(
                            left: 2, right: 2, top: 20, bottom: 20),
                        child: const Text("tag1"),
                        onTap: () {
                          debugPrint("$index tag1");
                        },
                      ),
                      const SizedBox(width: 5),
                      ExpandInkWell(
                        expandArea: const EdgeInsets.only(
                            left: 2, right: 2, top: 20, bottom: 20),
                        child: const Text("tag2"),
                        onTap: () {
                          debugPrint("$index tag2");
                        },
                      ),
                      const SizedBox(width: 5),
                      InkWell(
                        child: const Text("tag3"),
                        onTap: () {
                          debugPrint("$index tag3");
                        },
                      ),
                      const SizedBox(width: 5),
                      InkWell(
                        child: const Text("tag4"),
                        onTap: () {
                          debugPrint("$index tag4");
                        },
                      ),
                      const SizedBox(width: 5),
                      InkWell(
                        child: const Text("tag5"),
                        onTap: () {
                          debugPrint("$index tag5");
                        },
                      )
                    ])
                  ]));
        })));
  }
}
