import 'package:flutter/material.dart';
import 'package:guiago/core/theme/go_colors.dart';

class MyLocal extends StatelessWidget {
  const MyLocal({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 4,
      children: [
        Row(
          spacing: 4,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'minha localização',
              style: TextStyle(
                fontWeight: FontWeight.w600,
                color: GOColors.whiteColor,
                fontSize: 14,
              ),
            ),
            Icon(
              Icons.keyboard_arrow_down_rounded,
              color: GOColors.whiteColor,
            )
          ],
        ),
        dashedLined(),
      ],
    );
  }

  Widget dashedLined() {
    return SizedBox(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(37, (int index) {
          return Container(
            margin: EdgeInsets.only(right: 2),
            color: Colors.white70,
            height: 0.6,
            width: 2,
          );
        }),
      ),
    );
  }
}
