import 'package:flutter/material.dart';
import 'package:flutter_application_1/widgets/RecipesHome/widgets/categories_widget.dart';
import 'package:flutter_application_1/widgets/RecipesHome/widgets/header_widget.dart';
import 'package:flutter_application_1/widgets/RecipesHome/widgets/new_recipes_list_widget.dart';
import 'package:flutter_application_1/widgets/RecipesHome/widgets/recipe_card_widget.dart';
import 'package:flutter_application_1/widgets/RecipesHome/widgets/recipes_list_widget.dart';
import 'package:flutter_application_1/widgets/RecipesHome/widgets/search_widget.dart';
import 'package:flutter_svg/svg.dart';

class RecipesHomeScreenWidget extends StatelessWidget {
  const RecipesHomeScreenWidget({super.key});

  @override
  Widget build(BuildContext context) {

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Top bar
            HeaderWidget(),
            const SizedBox(height: 30),

            // Search + Filter
            SearchWidget(),
            const SizedBox(height: 15),

            // Categories tags
            CategoriesWidget(),
            const SizedBox(height: 15),

            // Recipes horizontal list
            RecipesListWidget(),
            const SizedBox(height: 20),

            Padding(
              padding: EdgeInsets.symmetric(horizontal: 30),
              child: Text(
                'New Recipes',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: Color(0xFF0F172A),
                ),
              ),
            ),

            const SizedBox(height: 5),

            // New recipes carousel style
            NewRecipesListWidget(),
          ],
        ),
      ],
    );
  }
}