import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CategoryTag extends StatelessWidget {
  final String label;
  final bool selected;
  final VoidCallback onTap;
  const CategoryTag({
    required this.label,
    this.selected = false,
    required this.onTap,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap, // <<–– click handler
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 7),
        margin: const EdgeInsets.only(right: 12),
        decoration: BoxDecoration(
          color: selected ? const Color(0xFF129575) : Colors.white,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Text(
          label,
          style: TextStyle(
            fontSize: 11,
            fontWeight: FontWeight.w600,
            color: selected ? Colors.white : const Color(0xFF71B1A1),
            fontFamily: 'Poppins',
          ),
        ),
      ),
    );
  }
}
