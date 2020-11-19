library super_color_picker;

import 'dart:typed_data';
import 'dart:ui';
import 'dart:ui' as ui show Image;


import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';

typedef OnColorChanged = void Function(Color color);

class ColorsPicker extends StatefulWidget {
  final OnColorChanged onColorChanged;

  final Widget child;

  const ColorsPicker({Key key, this.onColorChanged, this.child})
      : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return ColorsPickerState();
  }
}

class ColorsPickerState extends State<ColorsPicker> {
  GlobalKey _globalKey = GlobalKey();
  Uint8List _pngBytes;
  GlobalKey _childKey = GlobalKey();
  int width;
  int height;

  Future<void> _capturePng() async {
    RenderRepaintBoundary boundary =
        _globalKey.currentContext.findRenderObject();
    ui.Image image = await boundary.toImage();
    width = image.width;
    height = image.height;
    ByteData byteData = await image.toByteData(format: ImageByteFormat.rawRgba);
    _pngBytes = byteData.buffer.asUint8List();
  }

  void notifyColorChanged(e) {
    var dx = e.localPosition.dx;
    var dy = e.localPosition.dy;
    var childRender =
        (_childKey.currentContext.findRenderObject() as RenderBox);
    if (_pngBytes != null && childRender.size.contains(Offset(dx, dy))) {
      var pos = (dy.toInt() * width * 4 + dx.toInt() * 4).toInt();
      int s = pos % 4;
      var r = _pngBytes[pos - s];
      var g = _pngBytes[pos + 1 - s];
      var b = _pngBytes[pos + 2 - s];
      var a = _pngBytes[pos + 3 - s];
      Color color = Color.fromARGB(a, r, g, b);
      widget?.onColorChanged(color);
      return;
    }
  }

  @override
  Widget build(BuildContext context) {
    return RepaintBoundary(
      key: _globalKey,
      child: Listener(
        onPointerDown: (e) {
          if (_pngBytes == null) {
            _capturePng();
            return;
          }

          notifyColorChanged(e);
        },
        onPointerMove: (e) {
          notifyColorChanged(e);
        },
        child: Container(
          key: _childKey,
          child: widget.child,
        ),
      ),
    );
  }
}
