import 'package:flutter/material.dart';
import 'package:flutter_application_1/widgets/RecipesDetail/detail_screen.dart';
import 'package:flutter_application_1/widgets/RecipesHome/widgets/bookmark_button_widget.dart';
import 'package:flutter_application_1/widgets/RecipesHome/widgets/category_tag.dart';
import 'package:flutter_application_1/widgets/RecipesHome/widgets/rating_badge_widget.dart';
import 'package:flutter_svg/svg.dart';

class RecipeCardWidget extends StatelessWidget {
  final String title;
  final String imagePath;
  final double rating;
  final int minutes;
  final bool saved;
  final VoidCallback? onTap;
  final VoidCallback? onSave;

  const RecipeCardWidget({super.key,
    required this.title,
    required this.imagePath,
    required this.rating,
    required this.minutes,
    this.saved = false,
    this.onTap,
    this.onSave,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: SizedBox(
        width: 150,
        child: Stack(
          children: [
            // CARDUL
            Container(
              margin: const EdgeInsets.only(top: 66), // spațiu pt imaginea de sus
              decoration: BoxDecoration(
                color: const Color(0xFFD9D9D9).withOpacity(0.5),
                borderRadius: BorderRadius.circular(12),

              ),
              padding: const EdgeInsets.fromLTRB(10, 68, 10, 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    title,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                        height: 1.3,
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: Color(0xFF484848),
                        fontFamily: 'Poppins'
                    ),
                  ),
                  const SizedBox(height: 19),
                  const Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Time',
                      style: TextStyle(
                          fontSize: 11,
                          color: Color(0xFFA9A9A9),
                          fontWeight: FontWeight.w400,
                          fontFamily: 'Poppins'
                      ),
                    ),
                  ),
                  const SizedBox(height: 5),
                  Row(
                    children: [
                      Text(
                        '$minutes Mins',
                        style: const TextStyle(
                            fontSize: 11,
                            fontWeight: FontWeight.w600,
                            color: Color(0xFF484848),
                            fontFamily: 'Poppins'

                        ),
                      ),
                      const Spacer(),
                      BookmarkButtonWidget(active: saved, onTap: onSave),
                    ],
                  ),
                ],
              ),
            ),

            // IMAGINEA deasupra cardului
            Positioned(
              top: 10,
              left: 25,
              right: 25,
              child: Stack(
                clipBehavior: Clip.none,
                children: [
                  // Imaginea cu shadow
                  SizedBox(
                    height: 118,
                    width: 118,
                    child: Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black26,
                            blurRadius: 10,
                            offset: Offset(0, 5),
                          ),
                        ],
                      ),
                      child: CircleAvatar(
                        backgroundColor: Color(0xFFDDDDDD),
                        backgroundImage: NetworkImage(imagePath),
                      ),
                    ),
                  ),

                  // badge rating
                  Positioned(
                    right: -23,
                    bottom: 65,
                    child: RatingBadgeWidget(value: rating),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
