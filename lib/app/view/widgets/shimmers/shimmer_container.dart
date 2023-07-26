import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class ShimmerContainer extends StatelessWidget {
  final double? width;
  final double? height;
  final BorderRadius? borderRadius;
  final BoxShape? shape;
  final bool withShadow;
  final EdgeInsetsGeometry? margin;

  const ShimmerContainer(
      {super.key,
      this.width,
      this.height,
      this.borderRadius,
      this.shape,
      required this.withShadow,
      this.margin});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      margin: margin,
      decoration: BoxDecoration(
        color: Colors.grey.shade100,
        borderRadius: borderRadius,
        shape: shape ?? BoxShape.rectangle,
        boxShadow: [
          if (withShadow)
            const BoxShadow(
              blurRadius: 5,
              blurStyle: BlurStyle.outer,
              color: Colors.black12,
            ),
        ],
      ),
    )
        .animate(
          onComplete: (controller) => controller.repeat(),
        )
        .shimmer(
          color: Colors.grey.shade300,
          duration: const Duration(seconds: 2),
        );
  }
}
