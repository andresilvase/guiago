import 'package:flutter/material.dart';
import 'package:guiago/presentation/theme/app_theme.dart';

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
