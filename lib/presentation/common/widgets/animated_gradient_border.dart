import 'package:alda_front/themes/colors.dart';
import 'package:flutter/material.dart';

class AnimatedGradientBorder extends StatefulWidget {
  const AnimatedGradientBorder({
    super.key,
  });

  @override
  State<AnimatedGradientBorder> createState() => _AnimatedGradientBorderState();
}

class _AnimatedGradientBorderState extends State<AnimatedGradientBorder>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Color?> _animation1;
  late Animation<Color?> _animation2;
  late Animation<Color?> _animation3;
  late Animation<Color?> _animation4;

  @override
  void initState() {
    super.initState();
    _controller =
        AnimationController(vsync: this, duration: Duration(seconds: 5));
    _animation1 = TweenSequence([
      TweenSequenceItem(
          tween: ColorTween(
              begin: Colors.grey.shade600, end: Colors.grey.shade600),
          weight: 1),
      TweenSequenceItem(
          tween:
              ColorTween(begin: Colors.grey.shade600, end: Color(0xFF434343)),
          weight: 1),
      TweenSequenceItem(
          tween: ColorTween(begin: Color(0xFF434343), end: Color(0xFF434343)),
          weight: 1),
      TweenSequenceItem(
          tween:
              ColorTween(begin: Color(0xFF434343), end: Colors.grey.shade600),
          weight: 1),
    ]).animate(_controller);
    _animation2 = TweenSequence([
      TweenSequenceItem(
          tween:
              ColorTween(begin: Color(0xFF434343), end: Colors.grey.shade600),
          weight: 1),
      TweenSequenceItem(
          tween: ColorTween(
              begin: Colors.grey.shade600, end: Colors.grey.shade600),
          weight: 1),
      TweenSequenceItem(
          tween:
              ColorTween(begin: Colors.grey.shade600, end: Color(0xFF434343)),
          weight: 1),
      TweenSequenceItem(
          tween: ColorTween(begin: Color(0xFF434343), end: Color(0xFF434343)),
          weight: 1),
    ]).animate(_controller);
    _animation3 = TweenSequence([
      TweenSequenceItem(
          tween: ColorTween(begin: Color(0xFF434343), end: Color(0xFF434343)),
          weight: 1),
      TweenSequenceItem(
          tween:
              ColorTween(begin: Color(0xFF434343), end: Colors.grey.shade600),
          weight: 1),
      TweenSequenceItem(
          tween: ColorTween(
              begin: Colors.grey.shade600, end: Colors.grey.shade600),
          weight: 1),
      TweenSequenceItem(
          tween:
              ColorTween(begin: Colors.grey.shade600, end: Color(0xFF434343)),
          weight: 1),
    ]).animate(_controller);
    _animation4 = TweenSequence([
      TweenSequenceItem(
          tween:
              ColorTween(begin: Colors.grey.shade600, end: Color(0xFF434343)),
          weight: 1),
      TweenSequenceItem(
          tween: ColorTween(begin: Color(0xFF434343), end: Color(0xFF434343)),
          weight: 1),
      TweenSequenceItem(
          tween:
              ColorTween(begin: Color(0xFF434343), end: Colors.grey.shade600),
          weight: 1),
      TweenSequenceItem(
          tween: ColorTween(
              begin: Colors.grey.shade600, end: Colors.grey.shade600),
          weight: 1),
    ]).animate(_controller);

    _controller.repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return Stack(alignment: Alignment.center, children: [
          Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    colors: [
                      _animation1.value!,
                      _animation2.value!,
                      _animation3.value!,
                      _animation4.value!,
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    stops: [0.1, 0.2, 0.8, 0.9]),
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 3,
                    spreadRadius: 5,
                  )
                ]),
          ),
          Container(
            width: 48,
            height: 48,
            decoration: BoxDecoration(
              color: Color(0xFF3A3A3A),
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: AppColors.black01, width: 0.5),
            ),
            child: Center(
              child: Text(
                "😀",
                style: TextStyle(fontSize: 28),
              ),
            ),
          ),
        ]);
      },
    );
  }
}
