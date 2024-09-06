import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerLoading extends StatelessWidget {
  const ShimmerLoading({
    super.key,
    required this.width,
    required this.height,
    this.baseColor,
    this.highlightColor,
    this.borderRadius,
  });

  final double width;
  final double height;
  final Color? baseColor;
  final Color? highlightColor;
  final double? borderRadius;

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: baseColor ?? Colors.grey.shade500,
      highlightColor: highlightColor ?? Colors.grey.shade300,
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(borderRadius ?? 6.0),
          color: Colors.white,
        ),
      ),
    );
  }
}
