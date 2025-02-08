import 'package:flutter/material.dart';

class _FilterWidget extends SliverPersistentHeaderDelegate {
  Widget cardOffers() {
    return Container(
      padding: EdgeInsets.zero,
      margin: EdgeInsets.zero,
      color: Colors.green,
      child: Row(
        children: [
          Container(
            margin: EdgeInsets.all(8),
            color: Colors.purple,
            width: 120,
            height: 40,
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      padding: EdgeInsets.zero,
      margin: EdgeInsets.zero,
      child: cardOffers(),
    );
  }

  final extent = 56.0;

  @override
  double get maxExtent => extent;

  @override
  double get minExtent => extent;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return false;
  }
}

class Filter extends StatelessWidget {
  const Filter({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverPersistentHeader(
      delegate: _FilterWidget(),
      floating: false,
      pinned: true,
    );
  }
}
