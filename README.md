# super_color_picker

析取屏幕像素颜色.

## 效果

![析取图片颜色](https://github.com/liaobushi520/super_color_picker/blob/main/example/gifs/%E5%9B%BE%E7%89%87%E9%A2%9C%E8%89%B2%E9%80%89%E6%8B%A9%E5%99%A8.gif)

![颜色选择器](https://github.com/liaobushi520/super_color_picker/blob/main/example/gifs/%E5%9C%86%E5%BD%A2%E9%A2%9C%E8%89%B2%E9%80%89%E6%8B%A9%E5%99%A8.gif)

## 用法
可以使用ColorsPicker包装任何Widget.

```dart
ColorsPicker(child: Container(
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
            )
```              
