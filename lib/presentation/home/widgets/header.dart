import 'package:flutter/material.dart';
import 'package:guiago/presentation/theme/app_theme.dart';
import 'package:guiago/presentation/home/widgets/departure_time_selector.dart';
import 'package:guiago/presentation/home/widgets/my_local.dart';

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
      icon: Icon(Icons.menu, color: GOColors.white),
      onPressed: () {},
    );
  }

  Widget search() {
    return IconButton(
      icon: Icon(Icons.search, color: GOColors.white),
      padding: EdgeInsets.zero,
      onPressed: () {},
    );
  }
}
