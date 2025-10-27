import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CategoryTag extends StatelessWidget {
  final String label;
  final bool selected;
  const CategoryTag({required this.label, this.selected = false, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      // margin: const EdgeInsets.only(right: 12),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 7),
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
    );
  }
}
