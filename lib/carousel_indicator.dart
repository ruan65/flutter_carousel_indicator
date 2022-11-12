import 'package:flutter/material.dart';

class CarouselIndicator extends StatelessWidget {
  const CarouselIndicator({
    super.key,
    required this.count,
    required this.activeIndex,
    this.width = 8.0,
    this.activeWidth = 16.0,
    this.height = 2.0,
    this.color = Colors.grey,
    this.activeColor = Colors.orange,
    this.gap = 4.0,
  });
  final int count;
  final int activeIndex;
  final double width;
  final double activeWidth;
  final double height;
  final double gap;
  final Color color;
  final Color activeColor;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 15.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(
          count,
          (position) => Padding(
            padding: EdgeInsets.only(right: position == count - 1 ? 0 : gap),
            child: position == activeIndex
                ? _Dash(
                    key: ValueKey(position),
                    width: activeWidth,
                    height: height,
                    color: activeColor,
                  )
                : _Dash(
                    key: ValueKey(position),
                    width: width,
                    height: height,
                    color: color,
                  ),
          ),
        ),
      ),
    );
  }
}

class _Dash extends StatelessWidget {
  const _Dash({
    super.key,
    required this.width,
    required this.height,
    required this.color,
  });
  final double width;
  final double height;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: color,
        borderRadius: const BorderRadius.all(
          Radius.circular(8.0),
        ),
      ),
    );
  }
}
