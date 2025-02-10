import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:guiago/core/providers/app_providers.dart';
import 'package:guiago/presentation/theme/app_theme.dart';

class _FilterList extends SliverPersistentHeaderDelegate {
  _FilterList({
    required this.onFilterDeselected,
    required this.onFilterSelected,
    required this.selectedFilters,
  });

  final void Function(String) onFilterDeselected;
  final void Function(String) onFilterSelected;
  final List<String> selectedFilters;

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
        color: GOColors.grey2,
      ),
      child: child,
    );
  }

  List<String> filterOptions = [
    'com desconto',
    'disponíveis',
    'hidro',
    'piscina',
    'sauna',
    'ofurô',
    'decoração erótica',
    'decoração temática',
    'cadeira erótica',
    'pista de dança',
    'garagem privativa',
    'frigobar',
    'internet wi-fi',
    'suíte para festas',
    'suíte com acessibilidade',
  ];

  Widget filterList() {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: filterOptions.length + 1,
      itemBuilder: (_, index) {
        if (index == 0) {
          return filterButton();
        }
        final filterOption = filterOptions[index - 1];
        return filterItem(filterOption, isSelected: selectedFilters.contains(filterOption));
      },
    );
  }

  Widget filterItem(String filterOption, {bool isSelected = true}) {
    return GestureDetector(
      onTap: () {
        if (isSelected) {
          onFilterDeselected(filterOption);
        } else {
          onFilterSelected(filterOption);
        }
      },
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 4),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color: GOColors.dotsIndicatorColor.withValues(alpha: 0.4),
          ),
          color: isSelected ? GOColors.primaryColor : GOColors.white,
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Text(
            filterOption,
            style: TextStyle(
              color: isSelected ? GOColors.white : GOColors.textColor,
              fontWeight: FontWeight.w500,
              fontSize: 12,
            ),
          ),
        ),
      ),
    );
  }

  Widget filterButton() {
    return Stack(
      alignment: Alignment.center,
      children: [
        filterButtonFirstLayer(),
        circleBadgeselectedFiltersCount(),
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
                  color: GOColors.dotsIndicatorColor,
                  Icons.tune,
                  size: 16,
                ),
                Text(
                  'filtros',
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    color: GOColors.textColor,
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget circleBadgeselectedFiltersCount() {
    return Visibility(
      visible: selectedFilters.isNotEmpty,
      child: Positioned(
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
            selectedFilters.length.toString(),
            style: TextStyle(
              color: GOColors.white,
              fontSize: 10,
            ),
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
    return true;
  }
}

class Filter extends ConsumerWidget {
  const Filter({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SliverPersistentHeader(
      delegate: _FilterList(
        onFilterDeselected: ref.read(homeViewModelProvider.notifier).removeFilter,
        onFilterSelected: ref.read(homeViewModelProvider.notifier).addFilter,
        selectedFilters: ref.watch(homeViewModelProvider).selectedFilters,
      ),
      floating: false,
      pinned: true,
    );
  }
}
