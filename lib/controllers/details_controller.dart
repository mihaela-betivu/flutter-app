import 'dart:convert';

import 'package:get/get.dart';
import 'package:flutter_application_1/models/chef.dart';
import 'package:flutter_application_1/models/recipe_detail.dart';
import 'package:flutter_application_1/models/tab.dart' as mtab;
import 'package:flutter_application_1/models/serving.dart';
import 'package:flutter_application_1/models/ingredient.dart';
import 'package:flutter/services.dart' show rootBundle;

class DetailsController extends GetxController {

  // Observables
  var recipe = Rxn<RecipeDetail>();
  var chef = Rxn<Chef>();
  var serving = Rxn<Serving>();

  var tabs = <mtab.Tab>[].obs;
  var ingredients = <Ingredient>[].obs;

  var isLoading = false.obs;
  var hasError = false.obs;
  var errorMessage = ''.obs;

  @override
  void onInit() {
    super.onInit();

    final arg = Get.arguments;
    print('arg primit în DetailsController: $arg');

    loadData();
  }

  // Încărcarea datelor
  Future<void> loadData() async {
    try {
      isLoading.value = true;
      hasError.value = false;

      // Simulăm un delay pentru loading
      await Future.delayed(Duration(seconds: 1));

      final String jsonString =
      await rootBundle.loadString('assets/data/data.json');

      final jsonData = jsonDecode(jsonString);

      recipe.value = RecipeDetail.fromJson(jsonData['recipe']);

      if (jsonData['chef'] != null) {
        chef.value = Chef.fromJson(jsonData['chef']);
      }
      if (jsonData['serving'] != null) {
        serving.value = Serving.fromJson(jsonData['serving']);
      }

      tabs.assignAll(
        (jsonData['tabs'] as List).map((e) => mtab.Tab.fromJson(e)),
      );

      ingredients.assignAll(
        (jsonData['ingredients'] as List).map((e) => Ingredient.fromJson(e)),
      );
    } catch (e) {
      hasError.value = true;
      errorMessage.value = 'Eroare la încărcarea datelor: $e';
      print('Eroare: $e');
    } finally {
      isLoading.value = false;
    }
  }

  void navigateToDetails(RecipeDetail recipe) {
    Get.toNamed('/details', arguments: recipe);
  }
}