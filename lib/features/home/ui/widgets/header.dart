import 'package:flutter/material.dart';
import 'package:guiago/core/theme/go_colors.dart';
import 'package:guiago/features/home/ui/widgets/departure_time_selector.dart';
import 'package:guiago/features/home/ui/widgets/my_local.dart';

class Header extends StatelessWidget {
  const Header({super.key, this.onDepartureTimeChange});

  final VoidCallback? onDepartureTimeChange;

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 16,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            drawerMenu(),
            DepartureTimeSelector(onDepartureTimeChange: onDepartureTimeChange),
            search(),
          ],
        ),
        MyLocal(),
      ],
    );
  }

  Widget drawerMenu() {
    return IconButton(
      padding: EdgeInsets.zero,
      icon: Icon(Icons.menu, color: GOColors.whiteColor),
      onPressed: () {},
    );
  }

  Widget search() {
    return IconButton(
      icon: Icon(Icons.search, color: GOColors.whiteColor),
      padding: EdgeInsets.zero,
      onPressed: () {},
    );
  }
}
