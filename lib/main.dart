import 'package:flutter/material.dart';
import 'package:flutter_application_1/widgets/RecipesDetail/detail_screen.dart';
import 'package:flutter_application_1/widgets/RecipesHome/home_screen.dart';
import 'package:get/get.dart';

import 'controllers/details_controller.dart';
import 'controllers/recipe_controller.dart';

void main() {
  runApp(GetMaterialApp(
    debugShowCheckedModeBanner: false,
    initialRoute: '/home',
    getPages: [
      GetPage(
        name: '/home',
        page: () => const HomeScreen(),
        binding: HomeBinding(),
      ),
      GetPage(
        name: '/details',
        page: () => const RecipesDetailPage(),
        binding: DetailsBinding(),
      ),
    ],
  ));
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFFFFFF),
      body: SafeArea(
        child: SingleChildScrollView(
          child: RecipesHomeScreenWidget(),
        ),
      ),
    );
  }
}


// home_binding.dart
class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<RecipeController>(() => RecipeController());
  }
}

// details_binding.dart
class DetailsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DetailsController>(() => DetailsController());
  }
}