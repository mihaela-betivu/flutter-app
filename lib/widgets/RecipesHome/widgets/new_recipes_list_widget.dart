import 'package:flutter/material.dart';
import 'package:flutter_application_1/widgets/RecipesHome/widgets/new_recipe_card_widget.dart';
import 'package:flutter_application_1/widgets/RecipesHome/widgets/recipe_card_widget.dart';

class NewRecipesListWidget extends StatelessWidget {
  const NewRecipesListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 175,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          SizedBox(width: 30),
          NewRecipeCardWidget(
            title: 'Steak with tomato...',
            author: 'James Milner',
            minutes: 20,
            imagePath: 'assets/images/new-recipe-1.png',
            rating: 5,
          ),
          NewRecipeCardWidget(
            title: 'Pilaf sweet corn',
            author: 'Laura K.',
            minutes: 18,
            imagePath: 'assets/images/new-recipe-2.png',
            rating: 4,
          ),
          NewRecipeCardWidget(
            title: 'Avocado toast',
            author: 'Nico',
            minutes: 8,
            imagePath: 'assets/images/new-recipe-1.png',
            rating: 5,
          ),
          SizedBox(width: 5),
        ],
      ),
    );
  }
}
