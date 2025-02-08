import 'package:flutter/material.dart';
import 'package:guiago/core/theme/go_colors.dart';

class MotelList extends StatelessWidget {
  const MotelList({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.zero,
      margin: EdgeInsets.zero,
      color: GOColors.whiteColor,
      child: ListView.builder(
        padding: EdgeInsets.zero,
        itemCount: 100,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text('Item $index'),
          );
        },
      ),
    );
  }
}
