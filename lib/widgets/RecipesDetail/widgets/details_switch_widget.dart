import 'package:flutter/material.dart';

enum RecipeTab { ingredient, procedure }

class DetailsSwitchWidget extends StatelessWidget {
  final RecipeTab value;
  final ValueChanged<RecipeTab> onChanged;

  final double height;
  final double radius;
  final Color activeColor;
  final Color inactiveTextColor;
  final Color activeTextColor;

  const DetailsSwitchWidget({
    super.key,
    required this.value,
    required this.onChanged,
    this.height = 33,
    this.radius = 10,
    this.activeColor = const Color(0xFF129575), // verde
    this.inactiveTextColor = const Color(0xFF71B1A1), // verde-șters
    this.activeTextColor = Colors.white,
  });

  @override
  Widget build(BuildContext context) {
    Widget buildItem(String label, RecipeTab tab) {
      final isActive = value == tab;
      return Expanded(
        child: GestureDetector(
          onTap: () => onChanged(tab),
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
      padding: EdgeInsets.symmetric(horizontal: 30, vertical: 12),
      child: Row(
        children: [
          buildItem('Ingredient', RecipeTab.ingredient),
          const SizedBox(width: 16),
          buildItem('Procedure', RecipeTab.procedure),
        ],
      ),
    );
  }
}
