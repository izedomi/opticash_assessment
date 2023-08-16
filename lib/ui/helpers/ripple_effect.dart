import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

///A Flutter Class For Showing Ripple Effects
class Ripple extends StatefulWidget {
  const Ripple(
      {required this.child,
      Key? key,
      this.rippleColor,
      this.duration,
      this.onTap,
      this.rippleShape,
      this.width,
      this.radius})
      : super(key: key);

  final Duration? duration;
  final double? radius;
  final Widget? child;
  final Color? rippleColor;
  final BoxShape? rippleShape;
  final VoidCallback? onTap;
  final double? width;

  @override
  _RippleState createState() => _RippleState();
}

class _RippleState extends State<Ripple> with SingleTickerProviderStateMixin {
  AnimationController? _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      lowerBound: 0.5,
      duration: widget.duration ?? const Duration(milliseconds: 1000),
    )..repeat();
  }

  @override
  void dispose() {
    _controller!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(child: _bodyWidget());
  }

  Widget _bodyWidget() {
    return AnimatedBuilder(
      animation:
          CurvedAnimation(parent: _controller!, curve: Curves.fastOutSlowIn),
      builder: (context, child) {
        return SizedBox(
          width: widget.width ?? 150.w,
          height: widget.width ?? 150.w,
          child: Stack(
            alignment: Alignment.center,
            children: <Widget>[
              ...List.generate(
                4,
                (index) => _containerWidget(widget.radius == null
                    ? (100 * index) * _controller!.value
                    : (widget.radius! * index) * _controller!.value),
              ),
              Align(child: widget.child),
            ],
          ),
        );
      },
    );
  }

  Widget _containerWidget(double radius) {
    return Container(
      width: radius,
      height: radius,
      decoration: BoxDecoration(
          shape: widget.rippleShape ?? BoxShape.circle,
          color: widget.rippleColor == null
              ? Colors.blue.withOpacity(1 - _controller!.value)
              : widget.rippleColor!.withOpacity(1 - _controller!.value)),
    );
  }
}
