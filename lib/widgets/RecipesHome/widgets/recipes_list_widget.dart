import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/widgets/RecipesHome/widgets/recipe_card_widget.dart';
import 'package:flutter_application_1/controllers/recipe_controller.dart';

class RecipesListWidget extends StatelessWidget {
  const RecipesListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final RecipeController controller = Get.find<RecipeController>();

    return Obx((){
      if (controller.isLoading.value) {
        return SizedBox(
          height: 200,
          child: Center(child: CircularProgressIndicator()),
        );
      }

      if (controller.filteredRecipes.isEmpty) {
        return SizedBox(
          height: 200,
          child: Center(child: Text('No recipes available')),
        );
      }

      return SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            SizedBox(width: 30),

            // Generăm card-uri din date
            ...controller.filteredRecipes.map((recipe) {
              return Padding(
                padding: const EdgeInsets.only(right: 15),
                child: RecipeCardWidget(
                  title: recipe.name,
                  imagePath: recipe.image,
                  rating: recipe.rating,
                  minutes: int.parse(recipe.time.replaceAll(RegExp(r'[^0-9]'), '')),
                  saved: recipe.isBookmarked,
                  // onSaveToggle: () => controller.toggleBookmark(recipe.id),
                  onTap: () {
                    // pentru moment trimitem doar id la recipe
                    Get.toNamed(
                      '/details',
                      arguments: recipe.id, // sau index-ul, dacă nu ai id
                    );
                  },
                ),
              );
            }),
            SizedBox(width: 15),
          ],
        ),
      );
    });
  }
}
