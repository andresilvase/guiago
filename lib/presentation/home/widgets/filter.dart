import 'package:flutter/material.dart';
import 'package:guiago/presentation/theme/app_theme.dart';

class _FilterList extends SliverPersistentHeaderDelegate {
  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    return filterContainer(
      child: filterList(),
    );
  }

  Widget filterContainer({required Widget child}) {
    return Container(
      padding: const EdgeInsets.only(left: 8),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: GOColors.dotsIndicatorColor.withValues(alpha: 0.4),
          ),
        ),
        color: GOColors.white,
      ),
      child: child,
    );
  }

  Widget filterList() {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: 8,
      itemBuilder: (_, index) {
        if (index == 0) {
          return filterButton();
        }
        return filterItem();
      },
    );
  }

  Widget filterItem({bool isSelected = true}) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 4),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: GOColors.dotsIndicatorColor.withValues(alpha: 0.4),
        ),
        color: isSelected ? GOColors.primaryColor : GOColors.white,
      ),
      width: 80,
      child: Text(
        'filtros',
        style: TextStyle(
          color: isSelected ? GOColors.white : GOColors.textColor,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }

  Widget filterButton() {
    return Stack(
      alignment: Alignment.center,
      children: [
        filterButtonFirstLayer(),
        circleBadgeFiltersCount(),
      ],
    );
  }

  Widget filterButtonFirstLayer() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4.0),
      child: Row(
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              border: Border.all(
                color: GOColors.dotsIndicatorColor.withValues(alpha: 0.4),
              ),
              color: GOColors.white,
            ),
            padding: EdgeInsets.symmetric(vertical: 6),
            width: 80,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              spacing: 4,
              children: [
                Icon(
                  color: GOColors.textColor,
                  Icons.tune,
                  size: 16,
                ),
                Text(
                  'filtros',
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    color: GOColors.textColor,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget circleBadgeFiltersCount() {
    return Positioned(
      top: 8,
      left: 8,
      child: Container(
        width: 16,
        height: 16,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: GOColors.primaryColor,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Text(
          '1',
          style: TextStyle(
            color: GOColors.white,
            fontSize: 10,
          ),
        ),
      ),
    );
  }

  final extent = 60.0;

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
      delegate: _FilterList(),
      floating: false,
      pinned: true,
    );
  }
}
