import 'package:flutter/material.dart';
import 'package:guiago/presentation/home/widgets/motel_item.dart';
import 'package:guiago/presentation/theme/app_theme.dart';

class MotelList extends StatelessWidget {
  const MotelList({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: GOColors.grey2,
      child: ListView.builder(
        itemCount: 10,
        itemBuilder: (context, index) {
          return MotelItem();
        },
      ),
    );
  }
}
