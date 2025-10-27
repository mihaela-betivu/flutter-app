import 'package:flutter/material.dart';
import 'package:flutter_application_1/widgets/RecipesDetail/widgets/author_widget.dart';
import 'package:flutter_application_1/widgets/RecipesDetail/widgets/details_switch_widget.dart';
import 'package:flutter_application_1/widgets/RecipesDetail/widgets/food_card_widget.dart';
import 'package:flutter_application_1/widgets/RecipesDetail/widgets/ingredients_list_widget.dart';
import 'widgets/top_bar_widget.dart';

class RecipesDetailPage extends StatefulWidget {
  const RecipesDetailPage({super.key});

  @override
  State<RecipesDetailPage> createState() => _RecipesDetailPageState();
}

class _RecipesDetailPageState extends State<RecipesDetailPage> {
  RecipeTab _tab = RecipeTab.ingredient;

  final ingredients = [
    IngredientItem('Tomatos', '500g', 'assets/images/ingredient-1.png'),
    IngredientItem('Cabbage', '300g', 'assets/images/ingredient-2.png'),
    IngredientItem('Taco', '300g', 'assets/images/ingredient-3.png'),
    IngredientItem('Slice Bread', '300g', 'assets/images/ingredient-4.png'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFFFFFF),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TopBar(),
              SizedBox(height: 10),

              FoodCard(
                imageUrl: 'assets/images/recipe-info.png',
                title: 'Spicy chicken burger with\nFrench fries',
                rating: 4.0,
                time: '20 min',
                reviewsLabel: '13k Reviews',
                saved: false,
              ),
              SizedBox(height: 10),

              AuthorWidget(
                avatarAsset: 'assets/images/recipe-author.png',
                name: 'Laura Wilson',
                location: 'Lagos, Nigeria',
                pinIconAsset: 'assets/images/pin-icon.svg', // sau .png
                onFollow: () {
                  /* TODO: follow */
                },
              ),
              SizedBox(height: 8),

              DetailsSwitchWidget(
                value: _tab,
                onChanged: (t) => setState(() => _tab = t),
                height: 33,
                radius: 10,
              ),
              SizedBox(height: 22),

              SingleChildScrollView(
                child: IngredientsList(items: ingredients, servesLabel: '1 serve'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
