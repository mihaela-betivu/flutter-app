import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/tab.dart' as mtab;

class DetailsSwitchWidget extends StatelessWidget {
  final List<mtab.Tab> tabs;
  final int selectedIndex;
  final ValueChanged<int> onChanged;

  final double height;
  final double radius;
  final Color activeColor;
  final Color inactiveTextColor;
  final Color activeTextColor;

  const DetailsSwitchWidget({
    super.key,
    required this.tabs,
    required this.selectedIndex,
    required this.onChanged,
    this.height = 33,
    this.radius = 10,
    this.activeColor = const Color(0xFF129575),
    this.inactiveTextColor = const Color(0xFF71B1A1),
    this.activeTextColor = Colors.white,
  });

  @override
  Widget build(BuildContext context) {
    Widget buildItem(String label, int index) {
      final isActive = selectedIndex == index;

      return Expanded(
        child: GestureDetector(
          onTap: () => onChanged(index),
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            curve: Curves.easeOut,
            height: height,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: isActive ? activeColor : Colors.transparent,
              borderRadius: BorderRadius.circular(radius),
            ),
            child: Text(
              label,
              style: TextStyle(
                fontSize: 11,
                fontWeight: FontWeight.w600,
                color: isActive ? activeTextColor : inactiveTextColor,
              ),
            ),
          ),
        ),
      );
    }

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 12),
      child: Row(
        children: [
          for (int i = 0; i < tabs.length; i++) ...[
            buildItem(tabs[i].name, i),
            if (i != tabs.length - 1) const SizedBox(width: 16),
          ],
        ],
      ),
    );
  }
}
