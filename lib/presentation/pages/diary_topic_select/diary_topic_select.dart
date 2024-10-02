import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

@RoutePage()
class DiaryTopicSelectPage extends StatelessWidget {
  const DiaryTopicSelectPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: TextButton(
              onPressed: () {
                context.router.back();
              },
              child: Text('Back'))),
    );
  }
}
