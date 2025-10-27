import 'package:flutter/material.dart';
import 'package:flutter_application_1/widgets/shared/widgets/bookmark_button_widget.dart';
import 'package:flutter_application_1/widgets/shared/widgets/rating_badge_widget.dart';
import 'package:flutter_svg/svg.dart';

class FoodCard extends StatelessWidget {
  final String imageUrl;
  final String title;
  final double rating; // ex: 4.0
  final String time; // ex: "20 min"
  final String reviewsLabel; // ex: "13k Reviews"
  final bool saved;

  const FoodCard({
    super.key,
    required this.imageUrl,
    required this.title,
    required this.rating,
    required this.time,
    required this.reviewsLabel,
    this.saved = false,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Stack(
              children: [
                AspectRatio(
                  aspectRatio: 16 / 9,
                  child: Image.asset(imageUrl, fit: BoxFit.cover),
                ),
                // Gradient jos (transparent -> negru)
                Positioned.fill(
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Colors.black.withOpacity(0.0), // 0%
                          Colors.black.withOpacity(0.9),
                        ],
                      ),
                    ),
                  ),
                ),
                // Badge rating (dreapta sus)
                Positioned(
                  right: 10,
                  top: 10,
                  child: RatingBadgeWidget(value: 4.5),
                ),
                // Timp + bookmark (jos)
                Positioned(
                  right: 10,
                  bottom: 10,
                  // Timp (icon + text) – stil alb peste gradient
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Row(
                        children: [
                          SvgPicture.asset(
                            'assets/images/timer.svg',
                            width: 18,
                            height: 18,
                            colorFilter: const ColorFilter.mode(
                              Color(0xFFFFFFFF),
                              BlendMode.srcIn,
                            ),
                          ),
                          const SizedBox(width: 5),
                          Text(
                            '20 mins',
                            style: const TextStyle(
                              color: Color(0xFFFFFFFF),
                              fontSize: 11,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(width: 10),
                      // Bookmark în buton rotund alb cu contur verde
                      BookmarkButtonWidget(active: true),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 10),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 5),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Text(
                    title,
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      fontFamily: 'Poppins',
                      height: 1.5
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                Text(
                  '($reviewsLabel)',
                  style: TextStyle(
                    fontSize: 14,
                    color: Color(0xFFA9A9A9),
                    fontWeight: FontWeight.w400,
                    fontFamily: 'Poppins'
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
