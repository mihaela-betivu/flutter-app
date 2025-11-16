import 'package:flutter/material.dart';
import 'package:flutter_application_1/widgets/RecipesHome/widgets/new_recipe_card_widget.dart';
import 'package:flutter_application_1/controllers/recipe_controller.dart';
import 'package:get/get.dart';

class NewRecipesListWidget extends StatelessWidget {
  const NewRecipesListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final RecipeController controller = Get.find<RecipeController>();

    return Obx(() {
      return SizedBox(
        height: 175,
        child: ListView(
          scrollDirection: Axis.horizontal,
          children: [
            SizedBox(width: 30),

            ...controller.newRecipes.map((recipe) {
              return NewRecipeCardWidget(
                title: recipe.name,
                author: recipe.author,
                authorImage: recipe.authorImage,
                imagePath: recipe.image,
                minutes: int.parse(
                  recipe.time.replaceAll(RegExp(r'[^0-9]'), ''),
                ),
                rating: recipe.rating.round(),
              );
            }),

            SizedBox(width: 5),
          ],
        ),
      );
    });
  }
}
