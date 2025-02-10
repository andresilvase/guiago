import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:guiago/core/providers/app_providers.dart';
import 'package:guiago/presentation/theme/app_theme.dart';
import 'package:guiago/presentation/home/widgets/departure_time_selector.dart';
import 'package:guiago/presentation/home/widgets/my_local.dart';

class Header extends ConsumerWidget {
  const Header({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      spacing: 16,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            drawerMenu(),
            DepartureTimeSelector(
              onDepartureTimeChange: ref.read(homeViewModelProvider.notifier).setDepartureOption,
              departureOption: ref.watch(homeViewModelProvider).departureOption,
            ),
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
