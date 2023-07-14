import 'package:flutter/material.dart';
import 'package:sea_cinema/const.dart';

class TransparentBox extends StatelessWidget {
  const TransparentBox({
    super.key,
    required this.child,
    required this.height,
    required this.width,
    required this.borderRadius,
  });
  final Widget child;
  final double width;
  final double height;
  final double borderRadius;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      height: height,
      width: width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(borderRadius),
        color: kTransparentGrey.withOpacity(0.15),
      ),
      child: child,
    );
  }
}
