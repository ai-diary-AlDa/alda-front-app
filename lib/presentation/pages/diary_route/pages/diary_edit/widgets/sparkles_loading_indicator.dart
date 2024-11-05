import 'dart:async';
import 'package:alda_front/themes/colors.dart';
import 'package:alda_front/themes/theme.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class SparklesLoadingIndicator extends StatefulWidget {
  const SparklesLoadingIndicator({
    super.key,
  });

  @override
  State<SparklesLoadingIndicator> createState() =>
      _SparklesLoadingIndicatorState();
}

class _SparklesLoadingIndicatorState extends State<SparklesLoadingIndicator> {
  bool _visible = true;
  int counter = 0;
  final _loadingMessages = [
    "일기를 읽어보고 있어요...",
    "감정을 이해하는 중이에요...",
    "어떤 말을 할지 고민하고 있어요...",
    "피드백을 적고 있어요...",
    "거의 다 됐어요! 조금만 더 기다려주세요",
    "일기 내용이 길어 시간이 걸리고 있어요..."
  ];

  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 10), () {
      if (!mounted) {
        return;
      }
      setState(() {
        _visible = false;
      });
      Timer.periodic(Duration(seconds: 11), (timer) {
        if (!mounted) {
          return;
        }
        setState(() {
          _visible = false;
        });
        if (counter == _loadingMessages.length - 1) {
          timer.cancel();
        }
      });
    });

    Timer(Duration(seconds: 10, milliseconds: 500), () {
      if (!mounted) {
        return;
      }
      setState(() {
        _visible = true;
        counter++;
      });
      Timer.periodic(Duration(seconds: 11), (timer) {
        if (!mounted) {
          return;
        }
        setState(() {
          _visible = true;
          counter++;
        });
        if (counter == _loadingMessages.length - 1) {
          timer.cancel();
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
          width: 200,
          child: Lottie.asset("assets/animations/sparkles_loader.json"),
        ),
        AnimatedOpacity(
          opacity: _visible ? 1.0 : 0.0,
          duration: Duration(milliseconds: 500),
          child: Text(
            textAlign: TextAlign.center,
            _loadingMessages[counter],
            style: Theme.of(context)
                .appTexts
                .body
                .copyWith(color: AppColors.white, fontWeight: FontWeight.bold),
          ),
        ),
        SizedBox(height: 80),
      ],
    );
  }
}
