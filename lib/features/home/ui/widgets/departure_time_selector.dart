import 'package:flutter/material.dart';
import 'package:guiago/core/theme/go_colors.dart';

class DepartureTimeSelector extends StatelessWidget {
  const DepartureTimeSelector({super.key, this.onDepartureTimeChange});

  final VoidCallback? onDepartureTimeChange;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onDepartureTimeChange,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 8),
        // height: 40,
        decoration: BoxDecoration(
          color: Colors.black26,
          borderRadius: BorderRadius.circular(24),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            departureTimeSelectorItem(
              icon: Icons.flash_on_rounded,
              title: "ir agora",
              isSelected: true,
            ),
            departureTimeSelectorItem(
              icon: Icons.calendar_month_outlined,
              title: "ir outro dia",
              isSelected: false,
            ),
          ],
        ),
      ),
    );
  }

  Widget departureTimeSelectorItem({
    bool isSelected = false,
    required IconData icon,
    required String title,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: isSelected ? GOColors.whiteColor : null,
        borderRadius: BorderRadius.circular(24),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        spacing: 6,
        children: [
          Icon(
            icon,
            color: isSelected ? GOColors.primaryColor : GOColors.whiteColor,
            size: 16,
          ),
          Text(
            title,
            style: TextStyle(
              color: isSelected ? Colors.black : GOColors.whiteColor,
              fontWeight: FontWeight.w600,
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }
}
