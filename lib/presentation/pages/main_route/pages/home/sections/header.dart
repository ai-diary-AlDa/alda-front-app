import 'package:alda_front/presentation/common/widgets/button.dart';
import 'package:flutter/material.dart';

class Header extends StatelessWidget {
  const Header({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const CircleAvatar(
          radius: 24,
        ),
        Row(
          children: [
            Button(
                onPressed: () {},
                child: const Icon(
                  Icons.search,
                  color: Colors.black,
                  size: 32,
                )),
            SizedBox(
              width: 8,
            ),
            Button(
                onPressed: () {},
                child: const Icon(Icons.menu, color: Colors.black, size: 32))
          ],
        )
      ],
    );
  }
}
