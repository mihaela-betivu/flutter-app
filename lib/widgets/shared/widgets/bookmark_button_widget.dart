import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class BookmarkButtonWidget extends StatelessWidget {
  final bool active;
  final VoidCallback? onTap;
  const BookmarkButtonWidget({required this.active, this.onTap, super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
          width: 24,
          padding: const EdgeInsets.all(4),
          height: 24,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.white,
          ),
          child: SvgPicture.asset(
            active ? 'assets/images/active-mark.svg': 'assets/images/inactive-mark.svg',
            width: 12,
            height: 12,
          )
      ),
    );
  }
}
