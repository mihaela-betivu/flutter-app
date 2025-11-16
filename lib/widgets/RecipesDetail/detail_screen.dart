import 'package:flutter/material.dart';
import 'package:flutter_application_1/widgets/RecipesDetail/widgets/author_widget.dart';
import 'package:flutter_application_1/widgets/RecipesDetail/widgets/details_switch_widget.dart';
import 'package:flutter_application_1/widgets/RecipesDetail/widgets/food_card_widget.dart';
import 'package:flutter_application_1/widgets/RecipesDetail/widgets/ingredients_list_widget.dart';
import 'widgets/top_bar_widget.dart';
import 'package:get/get.dart';
import 'package:flutter_application_1/controllers/details_controller.dart';

class RecipesDetailPage extends StatefulWidget {
  const RecipesDetailPage({super.key});

  @override
  State<RecipesDetailPage> createState() => _RecipesDetailPageState();
}

class _RecipesDetailPageState extends State<RecipesDetailPage> {
  int _tabIndex = 0; // 0 = primul tab
  late final DetailsController controller;


  @override
  void initState() {
    super.initState();
    // Inițializează controllerul o singură dată
    controller =
        Get.find<DetailsController>(); // 🔥 controller-ul injectat din Binding
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (controller.isLoading.value && controller.recipe.value == null) {
        return const Scaffold(body: Center(child: CircularProgressIndicator()));
      }

      final recipe = controller.recipe.value;
      final tabs = controller.tabs;

      final ingredientItems = controller.ingredients.map((ing) {
        return IngredientItem(
          ing.name,
          ing.quantity,
          ing.icon,    // URL-ul din JSON
        );
      }).toList();

      if (recipe == null) {
        return const Scaffold(
          body: Center(child: Text('Nu s-au putut încărca detaliile rețetei')),
        );
      }

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
                  imageUrl: controller.recipe.value?.image ?? '',
                  title: controller.recipe.value?.title ?? '',
                  rating: controller.recipe.value?.rating ?? 2,
                  time: controller.recipe.value?.cookTime ?? '',
                  reviewsLabel: controller.recipe.value?.reviews ?? '',
                  saved: controller.recipe.value?.isBookmarked ?? false,
                ),
                SizedBox(height: 10),

                AuthorWidget(
                  avatarAsset: controller.chef.value?.profileImage ?? '',
                  name: controller.chef.value?.name ?? '',
                  location: controller.chef.value?.location ?? '',
                  pinIconAsset: 'assets/images/pin-icon.svg', // sau .png
                  onFollow: () {
                    /* TODO: follow */
                  },
                ),
                SizedBox(height: 8),

                if (tabs.isNotEmpty)
                  DetailsSwitchWidget(
                    tabs: tabs,
                    selectedIndex: _tabIndex,
                    onChanged: (i) {
                      setState(() => _tabIndex = i);
                      // aici poți schimba și conținutul (ingredient vs procedure)
                    },
                    height: 33,
                    radius: 10,
                  ),

                const SizedBox(height: 22),

                // exemplu: în funcție de tab, arăți alt conținut
                if (_tabIndex == 0)
                  SingleChildScrollView(
                    child: IngredientsList(
                      items: ingredientItems,
                      servesLabel:
                          controller.serving.value?.serves ?? '1 serve',
                      totalItems: controller.serving.value?.totalItems ?? 0,
                    ),
                  )
                else
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30),
                    child: Text(
                      'Aici va fi continutul pentru Procedure tab cand vor fi datele',
                      style: const TextStyle(fontSize: 12),
                    ),
                  ),
                SizedBox(height: 22),
              ],
            ),
          ),
        ),
      );
    });
  }
}
