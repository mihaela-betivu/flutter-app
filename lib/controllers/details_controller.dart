import 'package:flutter/material.dart' hide Tab;
import 'package:get/get.dart';
import 'package:flutter_application_1/data/data.dart';
import 'package:flutter_application_1/models/chef.dart';
import 'package:flutter_application_1/models/recipe_detail.dart';
import 'package:flutter_application_1/models/tab.dart' as mtab;
import 'package:flutter_application_1/models/serving.dart';
import 'package:flutter_application_1/models/ingredient.dart';

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

    // chiar dacă nu folosești încă id-ul, îl citești
    if (arg is int) {
      // aici, mai târziu, vei face fetch după id
      // deocamdată doar încarci din `details` static
      loadData();
    } else {
      loadData();
    }
  }

  // Încărcarea datelor
  Future<void> loadData() async {
    try {
      isLoading.value = true;
      hasError.value = false;

      // Simulăm un delay pentru loading
      await Future.delayed(Duration(seconds: 1));

      // Exemplu: ia direct din `details` (data ta mock)
      final map = details;

      recipe.value = RecipeDetail.fromJson(map['recipe']);
      if (map['chef'] != null) {
        chef.value = Chef.fromJson(map['chef']);
      }
      if (map['serving'] != null) {
        serving.value = Serving.fromJson(map['serving']);
      }

      tabs.assignAll(
        (map['tabs'] as List).map((e) => mtab.Tab.fromJson(e)),
      );

      ingredients.assignAll(
        (map['ingredients'] as List).map((e) => Ingredient.fromJson(e)),
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