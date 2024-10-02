import 'package:alda_front/themes/theme.dart';
import 'package:flutter/material.dart';

class Greetings extends StatelessWidget {
  const Greetings({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 16),
          child: Text("좋은 아침이에요!", style: Theme.of(context).appTexts.title),
        ),
        Text(
          "오늘 하루에 대해서 적어보아요. 너무 긴 텍스트는 어떻게 될지 궁금하시죠? 그러게요 너무 긍금하네요.",
          style: Theme.of(context).appTexts.body,
        ),
      ],
    );
  }
}
