import 'package:flutter/material.dart';

class CustomSliderTextInsideThumbShape extends SliderComponentShape {
  String thumbText;

  CustomSliderTextInsideThumbShape(this.thumbText);

  @override
  Size getPreferredSize(bool isEnabled, bool isDiscrete) {
    return const Size(20.0, 20.0);
  }

  @override
  void paint(
    PaintingContext context,
    Offset center, {
    Animation<double>? activationAnimation,
    Animation<double>? enableAnimation,
    bool? isDiscrete,
    TextPainter? labelPainter,
    RenderBox? parentBox,
    SliderThemeData? sliderTheme,
    TextDirection? textDirection,
    double? value,
    double? textScaleFactor,
    Size? sizeWithOverflow,
  }) {
    final canvas = context.canvas;

    final thumbRect = Rect.fromCenter(
      center: center,
      width: getPreferredSize(true, isDiscrete!).width,
      height: getPreferredSize(true, isDiscrete).height,
    );

    final thumbPaint = Paint()
      ..color = sliderTheme!.activeTrackColor!
      ..style = PaintingStyle.fill;

    final textSpan = TextSpan(
      text: thumbText,
      style: const TextStyle(
        color: Colors.white,
        fontSize: 10.0,
        fontWeight: FontWeight.bold,
      ),
    );

    final textPainter = TextPainter(
      text: textSpan,
      textDirection: TextDirection.ltr,
    );
    textPainter.layout();

    final textOffset = Offset(
      center.dx - (textPainter.width / 2),
      center.dy - (textPainter.height / 2),
    );

    canvas.drawRRect(
      RRect.fromRectAndRadius(thumbRect, const Radius.circular(90.0)),
      thumbPaint,
    );

    textPainter.paint(canvas, textOffset);
  }
}
