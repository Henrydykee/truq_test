
import 'package:flutter/material.dart';

class BurgerText extends StatelessWidget {
  final String? title;
  final Color? color;
  final double? size;
  final FontWeight? fontWeight;
  final TextAlign? align;
  final Function()? onTap;
  final TextStyle? style;
  final double? fontHeight;
  final int? maxLines;
  final TextOverflow? overflow;

  BurgerText(
      {@required this.title,
        this.color,
        this.size,
        this.fontWeight,
        this.align,
        this.overflow,
        this.onTap,
        this.maxLines,
        this.fontHeight,

        this.style});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Text(
        title ?? "",
        textAlign: align,
        maxLines: maxLines,
        overflow: overflow,
        style: style ??
            TextStyle(
              color: color ?? Colors.white,
              fontSize: size ?? 13,
              height: fontHeight,
              fontWeight: fontWeight ?? FontWeight.w400,
            ),
      ),
    );
  }
}