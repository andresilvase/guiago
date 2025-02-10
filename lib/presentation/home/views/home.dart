import 'package:flutter/material.dart';
import 'package:guiago/presentation/home/views/motel_list.dart';
import 'package:guiago/presentation/home/widgets/filter.dart';
import 'package:guiago/presentation/home/widgets/header.dart';
import 'package:guiago/presentation/home/widgets/highlight_offer_widget.dart';
import 'package:guiago/presentation/theme/app_theme.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Header(),
        SizedBox(height: 16),
        Expanded(
          child: ClipRRect(
            borderRadius: BorderRadius.circular(24),
            child: scrollableList(),
          ),
        ),
      ],
    );
  }

  Widget scrollableList() {
    return NestedScrollView(
      headerSliverBuilder: (_, __) {
        return [
          HighlightOfferWidget(),
          Filter(),
        ];
      },
      body: Container(
        color: GOColors.grey2,
        child: MotelList(),
      ),
    );
  }
}
