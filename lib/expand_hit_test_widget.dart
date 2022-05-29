import 'package:expand_hit_test/expand_hit_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class ExpandHitTestWidget extends SingleChildRenderObjectWidget {
  const ExpandHitTestWidget(
      {Key? key, Widget? child, this.expandArea = EdgeInsets.zero})
      : super(key: key, child: child);

  final EdgeInsets expandArea;

  @override
  ExpandAreaWidgetRender createRenderObject(BuildContext context) {
    return ExpandAreaWidgetRender(
        expandArea: expandArea,
        associated: ExpandHitTestScope.associated(context));
  }

  @override
  void updateRenderObject(
      BuildContext context, ExpandAreaWidgetRender renderObject) {
    renderObject.expandArea = expandArea;
    renderObject.associated = ExpandHitTestScope.associated(context);
  }
}

class ExpandAreaWidgetRender extends RenderProxyBoxWithHitTestBehavior {
  ExpandAreaWidgetRender({this.expandArea = EdgeInsets.zero, this.associated});

  EdgeInsets expandArea;

  List<RenderBox>? associated;

  @override
  bool hitTest(BoxHitTestResult result, {required Offset position}) {
    bool hitTarget = false;

    var positionInParent = position + Offset(expandArea.left, expandArea.top);

    var newX = size.width *
        positionInParent.dx /
        (size.width + expandArea.right + expandArea.left);
    var newY = size.height *
        positionInParent.dy /
        (size.height + expandArea.top + expandArea.bottom);
    position = Offset(newX, newY);

    if (size.contains(position)) {
      hitTarget =
          hitTestChildren(result, position: position) || hitTestSelf(position);
      if (hitTarget) {
        result.add(BoxHitTestEntry(this, position));
      }
    }
    return hitTarget;
  }

  @override
  void attach(covariant PipelineOwner owner) {
    super.attach(owner);
    associated?.add(this);
  }

  @override
  void detach() {
    associated?.remove(this);
    super.detach();
  }

  @override
  void paint(PaintingContext context, Offset offset) {
    super.paint(context, offset);
    if (ExpandHitTestConfigs.showDebugArea) {
      paintDebugArea(context, offset);
    }
  }

  void paintDebugArea(PaintingContext context, Offset offset) {
    RenderBox parentBox = parent as RenderBox;

    Offset parentPosition = Offset.zero;
    parentPosition = offset - localToGlobal(Offset.zero, ancestor: parentBox);
    Rect parentRect;
    if (associated != null) {
      parentRect = Rect.largest;
    } else {
      Size parentSize = parentBox.size;
      parentRect = Rect.fromLTWH(
        parentPosition.dx,
        parentPosition.dy,
        parentSize.width,
        parentSize.height,
      );
    }

    Offset paintOffset = offset - expandArea.topLeft;
    Rect paintRect = Rect.fromLTWH(
      paintOffset.dx,
      paintOffset.dy,
      size.width + expandArea.horizontal,
      size.height + expandArea.vertical,
    );

    final Paint paint = Paint()
      ..style = PaintingStyle.fill
      ..strokeWidth = 1.0
      ..color = ExpandHitTestConfigs.debugExpandAreaColor;
    context.canvas.drawRect(paintRect.intersect(parentRect), paint);
  }
}
