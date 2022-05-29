import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class ExpandHitTestScope extends StatefulWidget {
  const ExpandHitTestScope({Key? key, required this.child}) : super(key: key);
  final Widget child;

  static List<RenderBox>? associated(BuildContext context) {
    return (context
            .getElementForInheritedWidgetOfExactType<
                ExpandScopeInheritedWidget>()
            ?.widget as ExpandScopeInheritedWidget?)
        ?.associated;
  }

  @override
  State<StatefulWidget> createState() => ExpandHitTestScopeState();
}

class ExpandHitTestScopeState extends State<ExpandHitTestScope> {
  List<RenderBox> associated = [];

  @override
  Widget build(BuildContext context) {
    return ExpandScopeInheritedWidget(
        associated: associated,
        child: ExpandAreaRenderObjectWidget(
            associated: associated, child: widget.child));
  }
}

class ExpandAreaRenderObjectWidget extends SingleChildRenderObjectWidget {
  const ExpandAreaRenderObjectWidget(
      {Key? key, Widget? child, required this.associated})
      : super(child: child, key: key);

  final List<RenderBox> associated;

  @override
  RenderObject createRenderObject(BuildContext context) =>
      ExpandAreaRender(associated: associated);
}

class ExpandAreaRender extends RenderProxyBoxWithHitTestBehavior {
  ExpandAreaRender({required this.associated});

  final List<RenderBox> associated;

  @override
  bool hitTest(BoxHitTestResult result, {required Offset position}) {
    for (final painter in associated.reversed) {
      final hit = result.addWithPaintTransform(
        transform: painter.getTransformTo(this),
        position: position,
        hitTest: (BoxHitTestResult result, Offset? position) {
          return painter.hitTest(result, position: position!);
        },
      );
      if (hit) {
        return true;
      }
    }
    return child?.hitTest(result, position: position) ?? false;
  }
}

class ExpandScopeInheritedWidget extends InheritedWidget {
  const ExpandScopeInheritedWidget(
      {Key? key, required Widget child, required this.associated})
      : super(key: key, child: child);
  final List<RenderBox> associated;

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) => false;
}
