import 'package:flutter/material.dart';
import 'package:guiago/presentation/theme/app_theme.dart';

class DepartureTimeSelector extends StatelessWidget {
  const DepartureTimeSelector({super.key, this.onDepartureTimeChange, required this.departureOption});

  final VoidCallback? onDepartureTimeChange;
  final int departureOption;

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
              isSelected: departureOption == 0,
              icon: Icons.flash_on_rounded,
              title: "ir agora",
            ),
            departureTimeSelectorItem(
              icon: Icons.calendar_month_outlined,
              isSelected: departureOption == 1,
              title: "ir outro dia",
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
        color: isSelected ? GOColors.white : null,
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
            color: isSelected ? GOColors.primaryColor : GOColors.white,
            size: 16,
          ),
          Text(
            title,
            style: TextStyle(
              color: isSelected ? GOColors.black : GOColors.white,
              fontWeight: FontWeight.w600,
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }
}
