<!-- 
This README describes the package. If you publish this package to pub.dev,
this README's contents appear on the landing page for your package.

For information about how to write a good package README, see the guide for
[writing package pages](https://dart.dev/guides/libraries/writing-package-pages). 

For general information about developing packages, see the Dart guide for
[creating packages](https://dart.dev/guides/libraries/create-library-packages)
and the Flutter guide for
[developing packages and plugins](https://flutter.dev/developing-packages). 
-->

A flutter package for expand hit test area. Several default widgets are provided and can be easily customized

## Usage

Default widget by extends InkWell
```dart
    ExpandInkWell(
        expandArea:const EdgeInsets.all(30),
        onTap: () {
            debugPrint("expand inkwell tap");
        },
        child: Container(color: Colors.red, height: 100, width: 100))
```

Default widget by extends GestureDetector
```dart
    ExpandGestureDetector(
        expandArea:const EdgeInsets.all(30),
        onTap: () {
            debugPrint("expand GestureDetector tap");
        },
        child: Container(color: Colors.red, height: 100, width: 100))
```

Custom 
```dart
    ExpandHitTestWidget(
        expandArea:const EdgeInsets.all(30),
        child: CupertinoButton(padding: EdgeInsets.zero,child: Container(color: Colors.red, height: 100, width: 100), 
        onPressed: () {
            debugPrint("expand CupertinoButton tap");
        }))
```

Need to go beyond the parent 
```dart
    ExpandHitTestScope(child: xxxxx)
```
