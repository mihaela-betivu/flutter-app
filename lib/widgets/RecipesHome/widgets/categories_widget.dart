import 'package:flutter/material.dart';
import 'package:flutter_application_1/widgets/RecipesHome/widgets/category_tag.dart';
import 'package:get/get.dart';
import 'package:flutter_application_1/controllers/recipe_controller.dart';

class CategoriesWidget extends StatelessWidget {
  const CategoriesWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final RecipeController controller = Get.find<RecipeController>();

    return Obx(() {
      return Padding(
        padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
        child: SizedBox(
          height: 31,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: [
              SizedBox(width: 30),

              ...controller.categories.map((category) {
                return CategoryTag(
                  label: category.name,
                  selected: category.id == controller.selectedCategoryId.value,
                  onTap: () => controller.selectCategory(category.id),
                );
              }),

              SizedBox(width: 8),
            ],
          ),
        ),
      );
    });
  }
}
