import 'package:expand_hit_test/expand_hit_test.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Example3 extends StatelessWidget {
  const Example3({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text("Example3")),
        body: ExpandHitTestScope(
            child: Container(
                padding: const EdgeInsets.all(16),
                child: Column(children: [
                  Row(children: const [
                    Text("Account"),
                    Expanded(child: TextField())
                  ]),
                  Row(children: const [
                    Text("Password"),
                    Expanded(child: TextField())
                  ]),
                  CupertinoButton(child: const Text("Login"), onPressed: () {}),
                  const Spacer(),
                  Row(children: [
                    ExpandInkWell(
                        onTap: () {
                          debugPrint("check");
                        },
                        expandArea: const EdgeInsets.all(20),
                        child: const Icon(Icons.check_box)),
                    const Text(
                        "By logging in/registering the APP, you agree to the \"Service Agreement\" and \"Privacy Policy\""),
                  ])
                ]))));
  }
}
