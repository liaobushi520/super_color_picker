import 'dart:math';

import 'package:flutter/material.dart';
import 'package:super_color_picker/super_color_picker.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: ListDemoPage(title: 'SuperColorPicker'),
    );
  }
}

class ListDemoPage extends StatelessWidget {
  ListDemoPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            GestureDetector(
              child: Container(
                padding: EdgeInsets.only(left: 16, top: 20, bottom: 20),
                child: Text(
                  "圆形颜色选择",
                  style: TextStyle(fontSize: 20),
                ),
              ),
              onTap: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) {
                  return CircleColorPicker();
                }));
              },
            ),
            GestureDetector(
              child: Container(
                padding: EdgeInsets.only(left: 16, top: 20, bottom: 20),
                child: Text(
                  "图片颜色选择",
                  style: TextStyle(fontSize: 20),
                ),
              ),
              onTap: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) {
                  return ImageColorPicker();
                }));
              },
            ),
          ],
        ),
      ),
      appBar: AppBar(
        title: Text(title),
      ),
    );
  }
}

class CircleColorPicker extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return CircleColorPickerState();
  }
}

class CircleColorPickerState extends State<CircleColorPicker> {
  Color _color = Colors.transparent;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("圆形颜色选择器"),
      ),
      body: Center(
        child: Column(
          children: [
            SizedBox(
              width: 300,
              height: 300,
              child: ColorsPicker(
                child: Container(
                  decoration: ShapeDecoration(
                    shape: CircleBorder(),
                    gradient: SweepGradient(
                      center: FractionalOffset.center,
                      startAngle: 0.0,
                      endAngle: pi * 2,
                      colors: const <Color>[
                        Color(0xFF4285F4),
                        Color(0xFF34A853),
                        Color(0xFFFBBC05),
                        Color(0xFFEA4335),
                        Color(0xFF4285F4),
                      ],
                      stops: const <double>[0.0, 0.25, 0.5, 0.75, 1.0],
                      transform: GradientRotation(pi / 4),
                    ),
                  ),
                ),
                onColorChanged: (color) {
                  setState(() {
                    this._color = color;
                  });
                },
              ),
            ),
            Container(
              width: 200,
              height: 200,
              color: _color,
              alignment: Alignment.center,
              child: Text("颜色$_color"),
            )
          ],
        ),
      ),
    );
  }
}

class ImageColorPicker extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return ImageColorPickerState();
  }
}

class ImageColorPickerState extends State<ImageColorPicker> {
  Color _color = Colors.transparent;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("圆形颜色选择器"),
      ),
      body: Center(
        child: Column(
          children: [
            SizedBox(
              width: 300,
              height: 300,
              child: ColorsPicker(
                child: Image.asset(
                  "assets/image2.png",
                  width: 300,
                  height: 300,
                ),
                onColorChanged: (color) {
                  setState(() {
                    this._color = color;
                  });
                },
              ),
            ),
            Container(
              width: 200,
              height: 200,
              color: _color,
              alignment: Alignment.center,
              child: Text("颜色$_color"),
            )
          ],
        ),
      ),
    );
  }
}
