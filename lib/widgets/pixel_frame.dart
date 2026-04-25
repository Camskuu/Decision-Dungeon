import 'package:flutter/material.dart';

class PixelFrame extends StatelessWidget {
  final Widget child;
  final Color borderColor;
  final Color fillColor;
  final EdgeInsetsGeometry padding;
  final Color? shadowColor;
  final double pixel;

  const PixelFrame({
    super.key,
    required this.child,
    required this.borderColor,
    required this.fillColor,
    this.padding = const EdgeInsets.all(16),
    this.shadowColor,
    this.pixel = 6,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          decoration: BoxDecoration(
            color: borderColor,
            boxShadow: shadowColor == null
                ? []
                : [
                    BoxShadow(
                      color: shadowColor!,
                      offset: const Offset(4, 4),
                      blurRadius: 0,
                    ),
                  ],
          ),
          padding: EdgeInsets.all(pixel * 1.5),
          child: Container(
            color: fillColor,
            padding: padding,
            child: child,
          ),
        ),

        // Top-left
        _block(left: pixel, top: -pixel, size: pixel),
        _block(left: -pixel, top: pixel, size: pixel),

        // Top-right
        _block(right: pixel, top: -pixel, size: pixel),
        _block(right: -pixel, top: pixel, size: pixel),

        // Bottom-left
        _block(left: pixel, bottom: -pixel, size: pixel),
        _block(left: -pixel, bottom: pixel, size: pixel),

        // Bottom-right
        _block(right: pixel, bottom: -pixel, size: pixel),
        _block(right: -pixel, bottom: pixel, size: pixel),
      ],
    );
  }

  Widget _block({
    double? left,
    double? right,
    double? top,
    double? bottom,
    required double size,
  }) {
    return Positioned(
      left: left,
      right: right,
      top: top,
      bottom: bottom,
      child: Container(
        width: size,
        height: size,
        color: borderColor,
      ),
    );
  }
}