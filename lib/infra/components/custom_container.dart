import 'package:flutter/material.dart';

class CustomContainer extends StatelessWidget {
  final VoidCallback? onTap;
  final Widget? child;
  final double? width;
  final double? height;
  final EdgeInsetsGeometry? margin;
  final EdgeInsetsGeometry? padding;
  final double? borderWidth;
  final BorderRadiusGeometry? borderRadius;
  final Color? borderColor;
  final Color? backgroundColor;
  final List<BoxShadow>? boxShadow;
  final Gradient? gradient;
  final AlignmentGeometry? alignment;
  final BoxConstraints? constraints;
  final bool? showShadow;
  final ImageProvider? image;

  const CustomContainer({
    super.key,
    this.onTap,
    this.child,
    this.width,
    this.height,
    this.margin,
    this.padding,
    this.borderWidth,
    this.borderRadius,
    this.borderColor,
    this.backgroundColor,
    this.boxShadow,
    this.gradient,
    this.alignment,
    this.constraints,
    this.showShadow,
    this.image,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: width,
        height: height,
        alignment: alignment,
        padding: padding,
        margin: margin,
        constraints: constraints,
        decoration: BoxDecoration(
          color: backgroundColor,
          border: Border.all(width: borderWidth ?? 0, color: borderColor ?? Colors.transparent),
          gradient: gradient,
          borderRadius: borderRadius,
          boxShadow: boxShadow ??
              (showShadow == true
                  ? [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.2),
                        spreadRadius: 0,
                        blurRadius: 12,
                        offset: const Offset(0, 0),
                      ),
                    ]
                  : null),
          image: image == null
              ? null
              : DecorationImage(
                  image: image!,
                  fit: BoxFit.cover,
                ),
        ),
        child: child,
      ),
    );
  }
}
