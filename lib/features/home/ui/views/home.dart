import 'package:flutter/material.dart';
import 'package:guiago/features/home/logic/models.dart';
import 'package:guiago/features/home/ui/views/motel_list.dart';
import 'package:guiago/features/home/ui/widgets/filter.dart';
import 'package:guiago/features/home/ui/widgets/header.dart';
import 'package:guiago/features/home/ui/widgets/highlight_offer_widget.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Header(onDepartureTimeChange: () {}),
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
          HighlightOfferWidget(offers: HighlightOffer.list()),
          Filter(),
        ];
      },
      body: MotelList(),
    );
  }
}
