import 'package:flutter/material.dart';
import 'package:flutter_application_1/widgets/RecipesHome/widgets/category_tag.dart';
import 'package:flutter_svg/svg.dart';

class NewRecipeCardWidget extends StatelessWidget {
  final String title;
  final String author;
  final int minutes;
  final int rating; // 0..5
  final String imagePath;

  const NewRecipeCardWidget({
    required this.title,
    required this.author,
    required this.minutes,
    required this.rating,
    required this.imagePath,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 251,
      margin: const EdgeInsets.only(right: 15),
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 35),
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            // Card
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.10),
                    blurRadius: 20,
                    offset: const Offset(0, 0),
                    spreadRadius: 0,
                  ),
                ],
              ),
              padding: const EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFF484848),
                    ),
                  ),
                  const SizedBox(height: 5),
                  // stars
                  Row(
                    children: List.generate(
                      5,
                          (i) => Icon(
                        Icons.star_rounded,
                        size: 18,
                        color: i < rating
                            ? const Color(0xFFF4B740)
                            : const Color(0xFFE8EDF4),
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  Row(
                    children: [
                      CircleAvatar(
                        radius: 14,
                        backgroundImage: AssetImage(
                          'assets/images/review-image-1.jpg',
                        ),
                        backgroundColor: const Color(0xFFECEFF4),
                      ),
                      const SizedBox(width: 8),
                      Expanded(
                        child: Text(
                          'By $author',
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            color: Color(0xFFA9A9A9),
                            fontSize: 11,
                            fontFamily: 'Poppins',
                          ),
                        ),
                      ),
                      SvgPicture.asset(
                        'assets/images/timer.svg',
                        width: 18,
                        height: 18,
                        colorFilter: const ColorFilter.mode(
                          Color(0xFFA9A9A9),
                          BlendMode.srcIn,
                        ),
                      ),
                      const SizedBox(width: 5),
                      Text(
                        '$minutes mins',
                        style: const TextStyle(
                          color: Color(0xFFA9A9A9),
                          fontSize: 11,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            // Dish image overlapping right
            Positioned(
              right: 10,
              bottom: 60,
              child: Container(
                width: 80,
                height: 80,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 14,
                      offset: Offset(0, 6),
                    ),
                  ],
                ),
                child: Image.asset(imagePath, fit: BoxFit.cover),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
