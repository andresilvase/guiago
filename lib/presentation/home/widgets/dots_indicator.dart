import 'dart:math';

import 'package:flutter/material.dart';
import 'package:guiago/presentation/theme/app_theme.dart';

class DotsIndicator extends AnimatedWidget {
  DotsIndicator({
    super.key,
    this.color,
    this.onPageSelected,
    this.controller,
    this.itemCount,
  }) : super(listenable: controller!);

  final ValueChanged<int>? onPageSelected;
  final PageController? controller;
  final int? itemCount;
  final Color? color;

  static const double _dotSpacing = 16.0;
  static const double _dotSize = 5.0;
  static const double _maxZoom = 2.0;

  Widget _buildDot(int index) {
    double selected = Curves.easeOut.transform(
      max(
        0.0,
        1.0 - ((controller!.page ?? controller!.initialPage) - index).abs(),
      ),
    );
    double zoom = 1.0 + (_maxZoom - 1.0) * selected;

    return SizedBox(
      width: _dotSpacing,
      child: Center(
        child: Material(
          color: selected == 1.0 ? GOColors.dotsIndicatorColor : GOColors.dotsIndicatorColor.withValues(alpha: 0.55),
          type: MaterialType.circle,
          child: SizedBox(
            width: _dotSize * zoom,
            height: _dotSize * zoom,
            child: InkWell(
              onTap: () => onPageSelected?.call(index),
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List<Widget>.generate(itemCount!, _buildDot),
    );
  }
}
