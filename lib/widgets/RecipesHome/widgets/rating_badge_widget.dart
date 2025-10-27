import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class RatingBadgeWidget extends StatelessWidget {
  final double value;
  const RatingBadgeWidget({required this.value, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 3),
      decoration: BoxDecoration(
        color: const Color(0xFFFFE1B3),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        children: [
          const Icon(Icons.star_rounded, size: 10, color: Color(0xFFF4B740)),
          const SizedBox(width: 4),
          Text(
            value.toStringAsFixed(1),
            style: const TextStyle(
              fontWeight: FontWeight.w400,
              fontSize: 11,
              color: Color(0xFF000000),
            ),
          ),
        ],
      ),
    );
  }
}
