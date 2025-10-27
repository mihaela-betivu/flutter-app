import 'package:flutter/material.dart';
import 'package:flutter_application_1/widgets/RecipesHome/widgets/recipe_card_widget.dart';

class RecipesListWidget extends StatelessWidget {
  const RecipesListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: const [
          SizedBox(width: 30),
          RecipeCardWidget(
            title: 'Classic Greek\nSalad',
            imagePath: 'assets/images/recipe-1.png',
            rating: 4.5,
            minutes: 15,
            saved: true,
          ),
          SizedBox(width: 15),
          RecipeCardWidget(
              title: 'Crunchy Nut\nColeslaw',
              imagePath: 'assets/images/recipe-1.png',
              rating: 3.5,
              minutes: 10,
              saved: false
          ),
          SizedBox(width: 15),
          RecipeCardWidget(
            title: 'Classic Greek\nSalad',
            imagePath: 'assets/images/recipe-3.png',
            rating: 4.5,
            minutes: 15,
            saved: true,
          ),
          SizedBox(width: 15),
          RecipeCardWidget(
            title: 'Classic Greek\nSalad',
            imagePath: 'assets/images/recipe-1.png',
            rating: 4.5,
            minutes: 15,
            saved: true,
          ),
          SizedBox(width: 30),
        ],
      ),
    );
  }
}
