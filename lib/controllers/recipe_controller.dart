import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;
import 'package:get/get.dart';
import 'package:flutter_application_1/models/user.dart';
import 'package:flutter_application_1/models/category.dart';
import 'package:flutter_application_1/models/recipe.dart';
import 'package:flutter_application_1/models/new_recipe.dart';

class RecipeController extends GetxController {
  // Observables
  var user = Rxn<User>();
  var searchPlaceholder = ''.obs;
  var categories = <Category>[].obs;
  var recipes = <Recipe>[].obs;
  var newRecipes = <NewRecipe>[].obs;
  var filteredRecipes = <Recipe>[].obs;

  var isLoading = false.obs;
  var hasError = false.obs;
  var errorMessage = ''.obs;

  var selectedCategoryId = 1.obs;
  var searchQuery = ''.obs;

  @override
  void onInit() {
    super.onInit();
    loadData();
  }

  // Încărcarea datelor din JSON
  Future<void> loadData() async {
    try {
      isLoading.value = true;
      hasError.value = false;

      // (opțional) mic delay ca să vezi animația de loading
      await Future.delayed(const Duration(seconds: 1));

      // 1. Citim fișierul JSON din assets
      final jsonString = await rootBundle.loadString('assets/data/data.json');

      // 2. Parsăm în Map
      final Map<String, dynamic> data =
      jsonDecode(jsonString) as Map<String, dynamic>;

      // 3. Mapăm pe modele
      user.value = User.fromJson(data['user']);

      searchPlaceholder.value =
      data['filters']['search_placeholder'] as String;

      categories.value =
          (data['filters']['categories'] as List<dynamic>)
              .map((item) => Category.fromJson(item))
              .toList();

      recipes.value = (data['recipes'] as List<dynamic>)
          .map((item) => Recipe.fromJson(item))
          .toList();

      newRecipes.value = (data['new_recipes'] as List<dynamic>)
          .map((item) => NewRecipe.fromJson(item))
          .toList();

      filteredRecipes.value = List<Recipe>.from(recipes);

    } catch (e) {
      hasError.value = true;
      errorMessage.value = 'Eroare la încărcarea datelor: $e';
      print('Eroare: $e');
    } finally {
      isLoading.value = false;
    }
  }

  void _applyFilters() {
    // pornim de la toate rețetele
    List<Recipe> list = recipes.toList();

    // 1) filtrare după categorie
    if (selectedCategoryId.value != 1) {
      list = list
          .where((r) => r.categoryId == selectedCategoryId.value)
          .toList();
    }

    // 2) filtrare după nume (căutare)
    if (searchQuery.value.isNotEmpty) {
      final q = searchQuery.value.toLowerCase();
      list = list
          .where((r) => r.name.toLowerCase().contains(q))
          .toList();
    }

    // actualizăm lista afișată în UI
    filteredRecipes.assignAll(list);
  }


  void filterRecipes(String query) {
    searchQuery.value = query;
    _applyFilters();
  }

  void selectCategory(int categoryId) {
    selectedCategoryId.value = categoryId; // setăm categoria selectată

    categories.refresh(); // actualizăm UI-ul

    _applyFilters(); // aplicăm filtrarea
  }


  // Refresh
  Future<void> refreshData() async {
    await loadData();
  }
}